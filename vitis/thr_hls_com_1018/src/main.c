#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "xil_types.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "xgpiops.h"
#include "xscugic.h"
#include "xaxivdma.h"
#include "xaxivdma_i.h"
#include "display_ctrl_hdmi/lcd_modes.h"
#include "vdma_api/vdma_api.h"
#include "emio_sccb_cfg/emio_sccb_cfg.h"
#include "ov5640/ov5640_init.h"
#include "canny_edge/canny_edge.h"
#include "ff.h"
#include "xil_exception.h"
#include "xplatform_info.h"
#include "sleep.h"
#include "xcanny_accel.h"
#include "xedgetracing_accel.h"
#include "count_ip.h"

#define CAM0_VDMA_ID       XPAR_AXIVDMA_0_DEVICE_ID    //VDMA0器件ID
#define CAM1_VDMA_ID       XPAR_AXIVDMA_1_DEVICE_ID    //VDMA1器件ID
#define CAM2_VDMA_ID       XPAR_AXIVDMA_2_DEVICE_ID    //VDMA2器件ID	//需要在硬件平台定义

#define GPIOPS_ID 			XPAR_XGPIOPS_0_DEVICE_ID
#define INTC_DEVICE_ID 		XPAR_SCUGIC_SINGLE_DEVICE_ID //通用中断控制器 ID
#define GPIO_INTERRUPT_ID 	XPAR_XGPIOPS_0_INTR //PS 端 GPIO 中断 ID

#define COUNT_IP_BASEADDR	XPAR_COUNT_IP_0_S00_AXI_BASEADDR

#define MIOLED1 			38 	//高电平点亮
#define MIO_KEY1 			40  //按键 没有按下为高电平

//全局变量
XAxiVdma     cam0_vdma;
XAxiVdma     cam1_vdma;
XAxiVdma     cam2_vdma;		//待定义

VideoMode    vd_mode;
XGpioPs 	 gpiops_inst;	 //PS 端 GPIO 驱动实例
XScuGic      intc; 			 //通用中断控制器驱动实例
u32 		 key_press = 0; 	//KEY 按键按下的标志

XCanny_accel		canny_inst;
XEdgetracing_accel	edgetracing_inst;

unsigned int lcd_id;

//文件系统
static FATFS fatfs;
//BMP图片文件头
u8 bmp_head[54] = {
		0x42,0x4d,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x36,0x0,0x0,0x0,0x28,0x0,
		0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x1,0x0,0x18,0x0,0x0,0x0,
		0x0,0x0,0x0,0x0,0x0,0x0,0xc4,0xe,0x0,0x0,0xc4,0x0e,0x0,0x0,0x0,0x0,
		0x0,0x0,0x0,0x0,0x0,0x0 };
//BMP图片各参数偏移地址
UINT *bf_size    = (UINT *)(bmp_head + 0x2);
UINT *bmp_width  = (UINT *)(bmp_head + 0x12);
UINT *bmp_height = (UINT *)(bmp_head + 0x16);
UINT *bmp_size   = (UINT *)(bmp_head + 0x22);
//BMP图片编号
int  pic_cnt = 0;
int  pic_flag = 0;

//抓拍的图片显存地址
unsigned int const bmp_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x11000000);
//frame buffer的起始地址
unsigned int const frame_buffer_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x1000000);

unsigned int const cam0_frame_buffer_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x12000000);
unsigned int const cam1_frame_buffer_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x13000000);
unsigned int const cam2_frame_buffer_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x14000000);

// 数组图像数据的起始地址
unsigned int const I_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x15000000);
unsigned int Q_addr;
unsigned int U_addr;

// 数组图像数据的起始地址
unsigned int const Dop_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x18000000);
unsigned int Aop_addr;

unsigned int const AOE_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x1A000000);
unsigned int Aoe_addr;
unsigned int Aoo_addr;

unsigned int const AOEthr_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x1D000000);

unsigned int const binedge_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x1E000000);

unsigned int const edges_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x1F000000);

unsigned int const accumulator_addr =  (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x22000000);

unsigned int const picture0_buffer_addr =  (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x23000000);
unsigned int const picture1_buffer_addr =  (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x24000000);
unsigned int const picture2_buffer_addr =  (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x25000000);
//LCD ID
unsigned int lcd_id=0;
void write_sd_bmp(u8 *frame, char pic_name[20]);
//void write_sd_picture(u8 *frame);
void write_sd_data(float data);

static void intr_handler();
static void setup_interrupt_system(XScuGic *gic_ins_ptr, XGpioPs *gpiops_inst, u16 GpioIntrId);

//aoe计算
void image_operations(uint8_t *im1, uint8_t *im2, uint8_t *im3, int16_t *I,
					int16_t *Q, int16_t *U, int HEIGHT, int WIDTH, int CHANNELS) ;
void calculate_IUQDopAop(int16_t *I,int16_t *Q,int16_t *U,double *Dop, double *Aop, int HEIGHT, int WIDTH, int CHANNELS);
void process_data(double *Aop, double *Dop, uint8_t *AOE ,int HEIGHT, int WIDTH);
void singlech_to_threech(uint8_t *sin_image, uint8_t *thr_image, int HEIGHT, int WIDTH);

int main(void)
{
	XGpioPs_Config *gpiops_cfg_ptr; //PS 端 GPIO 配置信息

	u32 status0,status1,status2;    //2,3待定义
	int	time = 0;
	u16 cmos_h_pixel;   //ov5640 DVP 输出水平像素点数
	u16 cmos_v_pixel;   //ov5640 DVP 输出垂直像素点数
	u16 total_h_pixel;  //ov5640 水平总像素大小
	u16 total_v_pixel;  //ov5640 垂直总像素大小

	cmos_h_pixel = 1280;
	cmos_v_pixel = 800;
	total_h_pixel = 2570;
	total_v_pixel = 980;
/*	
	cmos_h_pixel = 800;
	cmos_v_pixel = 480;
	total_h_pixel = 1800;
	total_v_pixel = 1000;
*/
	double theta = 0.0;
	int rho = 0;

	gpiops_cfg_ptr = XGpioPs_LookupConfig(GPIOPS_ID);
	XGpioPs_CfgInitialize(&gpiops_inst,gpiops_cfg_ptr,gpiops_cfg_ptr->BaseAddr);

	XGpioPs_SetDirectionPin(&gpiops_inst, MIOLED1, 1);
	XGpioPs_SetOutputEnablePin(&gpiops_inst, MIOLED1, 1);
	XGpioPs_SetDirectionPin(&gpiops_inst, MIO_KEY1, 0);

	XCanny_accel_Initialize(&canny_inst,XPAR_CANNY_ACCEL_0_DEVICE_ID);
	XEdgetracing_accel_Initialize(&edgetracing_inst,XPAR_EDGETRACING_ACCEL_0_DEVICE_ID);
	XCanny_accel_Set_rows(&canny_inst,cmos_v_pixel);
	XCanny_accel_Set_cols(&canny_inst,cmos_h_pixel);
	XCanny_accel_Set_low_threshold(&canny_inst,80);
	XCanny_accel_Set_high_threshold(&canny_inst,160);

	XEdgetracing_accel_Set_rows(&edgetracing_inst,cmos_v_pixel);
	XEdgetracing_accel_Set_cols(&edgetracing_inst,cmos_h_pixel);

	lcd_id = 0x1018;  //0x1018  0x7084
	xil_printf("LCD ID: %x\r\n",lcd_id);

	int MAX_PKT_LEN = cmos_h_pixel*cmos_v_pixel;
	int MAX_2UCI_LEN = (((cmos_h_pixel*2)/8)*cmos_v_pixel);

	Q_addr = I_addr + cmos_h_pixel*cmos_v_pixel*8;
	U_addr = Q_addr + cmos_h_pixel*cmos_v_pixel*8;

	Aop_addr = Dop_addr + cmos_h_pixel*cmos_v_pixel*8;

	Aoo_addr = AOE_addr + cmos_h_pixel*cmos_v_pixel*8;
	Aoe_addr = Aoo_addr + cmos_h_pixel*cmos_v_pixel*8;


	emio_init();                                    //初始化EMIO
	status0 = ov5640_init(CAM0_CH0,cmos_h_pixel,  //初始化ov5640 1
						  cmos_v_pixel,
						  total_h_pixel,
						  total_v_pixel);

	status1 = ov5640_init(CAM1_CH1,cmos_h_pixel,  //初始化ov5640 2
						  cmos_v_pixel,
						  total_h_pixel,
						  total_v_pixel);

	status2 = ov5640_init(CAM2_CH2,cmos_h_pixel,  //初始化ov5640 3
						  cmos_v_pixel,
						  total_h_pixel,
						  total_v_pixel);

	if(status0 == 0 && status1 == 0  && status2 == 0)
		xil_printf("Dual OV5640 detected successful!\r\n");
	else
		xil_printf("Dual OV5640 detected failed!\r\n");

	//根据获取的LCD的ID号来进行video参数的选择
	vd_mode = VMODE_1280x800;
	//vd_mode = VMODE_800x480;


	//配置VDMA0
	run_vdma_frame_buffer(&cam0_vdma, CAM0_VDMA_ID, vd_mode.width, vd_mode.height,
							cam0_frame_buffer_addr,0,0,ONLY_WRITE);
	//配置VDMA1
	run_vdma_frame_buffer(&cam1_vdma, CAM1_VDMA_ID, vd_mode.width, vd_mode.height,
							cam1_frame_buffer_addr,0,0,ONLY_WRITE);
	//配置VDMA2
	run_vdma_frame_buffer(&cam2_vdma, CAM2_VDMA_ID, vd_mode.width, vd_mode.height,
							cam2_frame_buffer_addr,0,0,ONLY_WRITE);							//待定义

	//根据VDMA显存大小给BMP文件头赋值
	*bmp_width 	= vd_mode.width;
	*bmp_height = vd_mode.height;
	*bmp_size   = vd_mode.width * vd_mode.height * 3;
	*bf_size 	= *bmp_size + 54;
	//建立中断
	setup_interrupt_system(&intc, &gpiops_inst, GPIO_INTERRUPT_ID);
	//挂载文件系统
	f_mount(&fatfs,"",1);

	while(1){

	    	XGpioPs_WritePin(&gpiops_inst, MIOLED1, 0x1);

	    	if(key_press){
	    		usleep(20000);
	    		if(XGpioPs_ReadPin(&gpiops_inst, MIO_KEY1) == 0){
	    			XGpioPs_WritePin(&gpiops_inst, MIOLED1, 0x0);

	    			COUNT_IP_mWriteReg(COUNT_IP_BASEADDR, COUNT_IP_S00_AXI_SLV_REG0_OFFSET, 1);
	    			COUNT_IP_mWriteReg(COUNT_IP_BASEADDR, COUNT_IP_S00_AXI_SLV_REG1_OFFSET, 0);

	    			//printf("capture picture\n");     //采集图片
			    	memcpy((void *)picture0_buffer_addr,(void *)cam0_frame_buffer_addr,vd_mode.height*vd_mode.width*3);
			    	memcpy((void *)picture1_buffer_addr,(void *)cam1_frame_buffer_addr,vd_mode.height*vd_mode.width*3);
				    memcpy((void *)picture2_buffer_addr,(void *)cam2_frame_buffer_addr,vd_mode.height*vd_mode.width*3);

			    	//write_sd_bmp((u8 *)((uintptr_t)picture0_buffer_addr), "picture0.bmp");
			    	//write_sd_bmp((u8 *)((uintptr_t)picture1_buffer_addr), "picture1.bmp");
			    	//write_sd_bmp((u8 *)((uintptr_t)picture2_buffer_addr), "picture2.bmp");
					printf("picture calculate\n");     //计算

					uint8_t *gray0_image = (uint8_t *)((uintptr_t)picture0_buffer_addr);
					uint8_t *gray1_image = (uint8_t *)((uintptr_t)picture1_buffer_addr);
					uint8_t *gray2_image = (uint8_t *)((uintptr_t)picture2_buffer_addr);

					int16_t *I = (int16_t *)((uintptr_t)I_addr);
					int16_t *Q = (int16_t *)((uintptr_t)Q_addr);
					int16_t *U = (int16_t *)((uintptr_t)U_addr);
					image_operations(gray0_image,gray1_image,gray2_image,
							I, Q, U, vd_mode.height, vd_mode.width, 3);

					double *Dop = (double *)((uintptr_t)Dop_addr);
					double *Aop = (double *)((uintptr_t)Aop_addr);
					calculate_IUQDopAop(I,Q,U,Dop,Aop, vd_mode.height, vd_mode.width,3);

					uint8_t *AOE = (uint8_t *)((uintptr_t)AOE_addr);
					process_data(Aop, Dop, AOE, vd_mode.height, vd_mode.width);
/*
					uint8_t *AOEthr = (uint8_t *)((uintptr_t)AOEthr_addr);
					singlech_to_threech(AOE, AOEthr, vd_mode.height, vd_mode.width);
				    write_sd_bmp((u8 *)((uintptr_t)AOEthr_addr), "AOE.bmp");
*/

					uint8_t *binedge = (uint8_t *)((uintptr_t)binedge_addr);
					uint8_t *edges =(uint8_t *)((uintptr_t)edges_addr);

					Xil_DCacheFlushRange((UINTPTR) AOE, MAX_PKT_LEN);

					XCanny_accel_Set_img_inp(&canny_inst,AOE_addr);
					XCanny_accel_Set_img_out(&canny_inst,binedge_addr);
					//查询 Canny 边缘检测加速器是否处于空闲状态
					while(!XCanny_accel_IsIdle(&canny_inst));
					//开始工作
					XCanny_accel_Start(&canny_inst);
					//查询 Canny 边缘检测加速器是否已经完成了它的工作
					while(!XCanny_accel_IsDone(&canny_inst));

					Xil_DCacheFlushRange((UINTPTR) binedge, MAX_2UCI_LEN);

					XEdgetracing_accel_Set_img_inp(&edgetracing_inst,binedge_addr);
					XEdgetracing_accel_Set_img_out(&edgetracing_inst,edges_addr);
					//查询 XEdgetracing 加速器是否处于空闲状态
					while(!XEdgetracing_accel_IsIdle(&edgetracing_inst));
					//启动 XEdgetracing_accel 加速器
					XEdgetracing_accel_Start(&edgetracing_inst);
					//检查 XEdgetracing_accel 是否已经完成了当前的任务
					while(!XEdgetracing_accel_IsDone(&edgetracing_inst));

					Xil_DCacheFlushRange((UINTPTR) edges, MAX_PKT_LEN);


					//singlech_to_threech(edges, AOEthr, vd_mode.height, vd_mode.width);
					//write_sd_bmp((u8 *)((uintptr_t)AOEthr_addr), "edges.bmp");

				    Hough(edges, vd_mode.height, vd_mode.width, &theta, &rho);
				    printf("Detected line at theta: %f, rho: %d\n\r", theta, rho);
				      write_sd_data(theta);
/**/
				    COUNT_IP_mWriteReg(COUNT_IP_BASEADDR, COUNT_IP_S00_AXI_SLV_REG0_OFFSET, 0);
				    COUNT_IP_mWriteReg(COUNT_IP_BASEADDR, COUNT_IP_S00_AXI_SLV_REG1_OFFSET, 1);

				    time = COUNT_IP_mReadReg(COUNT_IP_BASEADDR, COUNT_IP_S00_AXI_SLV_REG2_OFFSET);
				    printf("system time: %d\n",time);

	    			pic_cnt++;
	    			pic_flag = 0;

	    		}
	    		key_press = 0;
	    		XGpioPs_IntrClearPin(&gpiops_inst, MIO_KEY1) ; //清除按键 KEY 中断
	    		XGpioPs_IntrEnablePin(&gpiops_inst, MIO_KEY1) ; //使能按键 KEY 中断
	    	}
	    }

    return 0;
}
//根据三个摄像头放置的位置对应的偏振片角度进行修改（0（45°），1（0°），2（90°））
void image_operations(uint8_t *im1, uint8_t *im2, uint8_t *im3, int16_t *I,
					int16_t *Q, int16_t *U, int HEIGHT, int WIDTH, int CHANNELS) {
    // 计算 I = im2_image_gray1 + im2_image_gray3
    for (int y = 0; y < HEIGHT; ++y) {
        for (int x = 0; x < WIDTH; ++x) {
        	int index = (y * WIDTH + x) * CHANNELS;
        	for(int c = 0;c < CHANNELS; ++c){
        		I[index + c] = im2[index + c] + im3[index + c];
        	}
        }
    }
    // 计算 Q = im2_image_gray1 - im2_image_gray3
    for (int y = 0; y < HEIGHT; ++y) {
        for (int x = 0; x < WIDTH; ++x) {
        	int index = (y * WIDTH + x) * CHANNELS;
        	for(int c = 0;c < CHANNELS; ++c){
        		Q[index + c] = im2[index + c] - im3[index + c];
        	}
        }
    }
    // 计算 U = 2*im2_image_gray2 - im2_image_gray1 - im2_image_gray3
    for (int y = 0; y < HEIGHT; ++y) {
        for (int x = 0; x < WIDTH; ++x) {
        	int index = (y * WIDTH + x) * CHANNELS;
        	for(int c = 0;c < CHANNELS; ++c){
        		U[index + c] = 2 * im1[index + c] - im2[index + c] - im3[index + c];
        	}
        }
    }
}
void calculate_IUQDopAop(int16_t *I,int16_t *Q,int16_t *U,
						double *Dop, double *Aop, int HEIGHT, int WIDTH, int CHANNELS) {
	double sum_I = 0.0, sum_Q = 0.0, sum_U = 0.0;
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {

        	for(int c = 0; c < CHANNELS; ++c){
        		int index = (y * WIDTH + x) * CHANNELS + c;
        		sum_I += I[index];
        		sum_Q += Q[index];
        		sum_U += U[index];
        	}

        	double avg_I = sum_I / CHANNELS;
        	double avg_Q = sum_Q / CHANNELS;
        	double avg_U = sum_U / CHANNELS;

        	Dop[y * WIDTH + x] = sqrt(avg_Q * avg_Q + avg_U * avg_U) / (avg_I == 0.0 ? 1e-10 : avg_I);
        		//C语言中的 atan2 返回的是弧度值,转换为角度值
        	Aop[y * WIDTH + x] = 0.5f * atan2(avg_U, avg_Q); //180.0 / M_PI

        }
    }
}

void process_data(double *Aop, double *Dop, uint8_t *AOE ,int HEIGHT, int WIDTH) {
    int y, x;
    double *Aoe = (double *)((uintptr_t)Aoe_addr);
    double *Aoo = (double *)((uintptr_t)Aoo_addr);
    for (y = 0; y < HEIGHT; y++) {
        for (x = 0; x < WIDTH; x++) {
            if (Aop[y * WIDTH + x] < 0) {
                Aop[y * WIDTH + x] = M_PI/2 + Aop[y * WIDTH + x];
            }
            if (Dop[y * WIDTH + x] > 1) {
                Dop[y * WIDTH + x] = 0;
            }
        }
    }
    // 计算 Aoo
    for (y = 0; y < HEIGHT; y++) {
        for (x = 0; x < WIDTH; x++) {
            Aoo[y * WIDTH + x] = atan2((double)(x - HEIGHT/2) , (double)(y - WIDTH/2));
        }
    }
    // 计算 Aoe
    for (y = 0; y < HEIGHT; y++) {
        for (x = 0; x < WIDTH; x++) {
            Aoe[y * WIDTH + x] = Aop[y * WIDTH + x] - Aoo[y * WIDTH + x];
            if (Aoe[y * WIDTH + x] > (M_PI/2)) {
                Aoe[y * WIDTH + x] -= M_PI;
            } else if (Aoe[y * WIDTH + x] < -(M_PI/2)) {
                Aoe[y * WIDTH + x] += M_PI;
            }
        }
    }
    // 将Aoe转换为度数并四舍五入到最接近的整数
    for (y = 0; y < HEIGHT; y++) {
        for (x = 0; x < WIDTH; x++) {
            Aoe[y * WIDTH + x] *= 57.2958; //180.0 / M_PI
            AOE[y * WIDTH + x] = (uint8_t)round(Aoe[y * WIDTH + x]);
        }
    }
}
/******************************单通道图像数据转换成三通道*******************************************/
void singlech_to_threech(uint8_t *sin_image, uint8_t *thr_image, int HEIGHT, int WIDTH)
{
	for(int y = 0; y < HEIGHT; y++)
	{
		for(int x = 0; x < WIDTH; x++)
		{
			int index = (y * WIDTH + x) * 3;
			thr_image[index + 0] = sin_image[y * WIDTH + x];
			thr_image[index + 1] = sin_image[y * WIDTH + x];
			thr_image[index + 2] = sin_image[y * WIDTH + x];
		}
	}
}
//中断处理函数
static void intr_handler()
{
	//读取 KEY 按键引脚的中断状态，判断是否发生中断
	if(!XGpioPs_ReadPin(&gpiops_inst, MIO_KEY1)){
		key_press = 1;
		XGpioPs_IntrDisablePin(&gpiops_inst, MIO_KEY1) ; //屏蔽按键 KEY 中断
	}
}

//建立中断系统，使能 KEY 按键的下降沿中断
static void setup_interrupt_system(XScuGic *gic_ins_ptr, XGpioPs *gpiops_inst, u16 GpioIntrId)
{
	int status;
	XScuGic_Config *IntcConfig; //中断控制器配置信息
	//查找中断控制器配置信息并初始化中断控制器驱动
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	XScuGic_CfgInitialize(gic_ins_ptr,IntcConfig, IntcConfig->CpuBaseAddress);

	//设置并使能中断异常
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler, gic_ins_ptr);
	Xil_ExceptionEnable();

	//为中断设置中断处理函数
	XScuGic_Connect(gic_ins_ptr, GpioIntrId,(Xil_ExceptionHandler) intr_handler, (void *) gpiops_inst);

	//使能来自于 Gpio 器件的中断
	XScuGic_Enable(gic_ins_ptr, GpioIntrId);
	//设置 KEY 按键的中断类型为下降沿中断
	XGpioPs_SetIntrTypePin(gpiops_inst, MIO_KEY1, XGPIOPS_IRQ_TYPE_EDGE_FALLING);
	//使能按键 KEY 中断
	XGpioPs_IntrEnablePin(gpiops_inst, MIO_KEY1);
}
//向SD卡中写BMP图片
void write_sd_bmp(u8 *frame, char pic_name[20])
{
	FIL		fil;				//文件对象
	UINT 	bw;					//写文件函数返回已写入的字节数
			//字符串，用于存储BMP文件名

	//打印BMP图片信息(宽/高/图片大小),以及BMP文件大小
	xil_printf("width = %d, height = %d, size = %d, file size = %d bytes \n\r",
			*bmp_width,*bmp_height,*bmp_size,*bf_size);

	//给BMP图片的文件名编号
	//sprintf(pic_name,"picture %04u.bmp",pic_cnt);
	//打开BMP文件,如果不存在则创建该文件
	f_open(&fil,pic_name,FA_CREATE_ALWAYS | FA_WRITE);

	//移动文件读写指针到文件开头
	f_lseek(&fil,0);
	//写入BMP文件头
	f_write(&fil,bmp_head,54,&bw);
	//写入抓拍的图片
	f_write(&fil,frame,*bmp_size,&bw);
	//关闭文件
	f_close(&fil);
	xil_printf("write %s done! \n\r",pic_name);
}
//向SD卡中写BMP图片
/*
void write_sd_picture(u8 *frame)
{
	FIL		fil;				//文件对象
	UINT 	bw;					//写文件函数返回已写入的字节数
	char 	pic_name[20];		//字符串，用于存储BMP文件名

	//打印BMP图片信息(宽/高/图片大小),以及BMP文件大小
	xil_printf("width = %d, height = %d, size = %d, file size = %d bytes \n\r",
			*bmp_width,*bmp_height,*bmp_size,*bf_size);

	//给BMP图片的文件名编号
	if(pic_flag == 0){
		sprintf(pic_name,"wr0_fram %04u.bmp",pic_cnt);
	}else if(pic_flag == 1){
		sprintf(pic_name,"wr1_fram %04u.bmp",pic_cnt);
	}else if(pic_flag == 2){
		sprintf(pic_name,"wr2_fram %04u.bmp",pic_cnt);
	}else{
		sprintf(pic_name,"picture %04u.bmp",pic_cnt);
	}
	//打开BMP文件,如果不存在则创建该文件
	f_open(&fil,pic_name,FA_CREATE_ALWAYS | FA_WRITE);

	//移动文件读写指针到文件开头
	f_lseek(&fil,0);
	//写入BMP文件头
	f_write(&fil,bmp_head,54,&bw);
	//写入抓拍的图片
	f_write(&fil,frame,*bmp_size,&bw);
	//关闭文件
	f_close(&fil);
	xil_printf("write %s done! \n\r",pic_name);
}*/
void write_sd_data(float data)
{
	FIL		fil;				//文件对象
	UINT bytes_written;
	char filename[] = "result.txt";

	f_open(&fil, filename, FA_OPEN_APPEND | FA_WRITE);		//FA_OPEN_APPEND 标志确保每次写入都发生在文件的末尾
	//f_lseek(&fil, SEEK_END);	//确保文件指针位于文件末尾
	char buffer[50];
	sprintf(buffer,"%f\n",data);
	f_write(&fil, buffer, strlen(buffer), &bytes_written);

	f_close(&fil);
	xil_printf("write %s done! \n\r",filename);
}
