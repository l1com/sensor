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

#define CAM0_VDMA_ID       XPAR_AXIVDMA_0_DEVICE_ID    //VDMA0����ID
#define CAM1_VDMA_ID       XPAR_AXIVDMA_1_DEVICE_ID    //VDMA1����ID
#define CAM2_VDMA_ID       XPAR_AXIVDMA_2_DEVICE_ID    //VDMA2����ID	//��Ҫ��Ӳ��ƽ̨����

#define GPIOPS_ID 			XPAR_XGPIOPS_0_DEVICE_ID
#define INTC_DEVICE_ID 		XPAR_SCUGIC_SINGLE_DEVICE_ID //ͨ���жϿ����� ID
#define GPIO_INTERRUPT_ID 	XPAR_XGPIOPS_0_INTR //PS �� GPIO �ж� ID

#define COUNT_IP_BASEADDR	XPAR_COUNT_IP_0_S00_AXI_BASEADDR

#define MIOLED1 			38 	//�ߵ�ƽ����
#define MIO_KEY1 			40  //���� û�а���Ϊ�ߵ�ƽ

//ȫ�ֱ���
XAxiVdma     cam0_vdma;
XAxiVdma     cam1_vdma;
XAxiVdma     cam2_vdma;		//������

VideoMode    vd_mode;
XGpioPs 	 gpiops_inst;	 //PS �� GPIO ����ʵ��
XScuGic      intc; 			 //ͨ���жϿ���������ʵ��
u32 		 key_press = 0; 	//KEY �������µı�־

XCanny_accel		canny_inst;
XEdgetracing_accel	edgetracing_inst;

unsigned int lcd_id;

//�ļ�ϵͳ
static FATFS fatfs;
//BMPͼƬ�ļ�ͷ
u8 bmp_head[54] = {
		0x42,0x4d,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x36,0x0,0x0,0x0,0x28,0x0,
		0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x1,0x0,0x18,0x0,0x0,0x0,
		0x0,0x0,0x0,0x0,0x0,0x0,0xc4,0xe,0x0,0x0,0xc4,0x0e,0x0,0x0,0x0,0x0,
		0x0,0x0,0x0,0x0,0x0,0x0 };
//BMPͼƬ������ƫ�Ƶ�ַ
UINT *bf_size    = (UINT *)(bmp_head + 0x2);
UINT *bmp_width  = (UINT *)(bmp_head + 0x12);
UINT *bmp_height = (UINT *)(bmp_head + 0x16);
UINT *bmp_size   = (UINT *)(bmp_head + 0x22);
//BMPͼƬ���
int  pic_cnt = 0;
int  pic_flag = 0;

//ץ�ĵ�ͼƬ�Դ��ַ
unsigned int const bmp_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x11000000);
//frame buffer����ʼ��ַ
unsigned int const frame_buffer_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x1000000);

unsigned int const cam0_frame_buffer_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x12000000);
unsigned int const cam1_frame_buffer_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x13000000);
unsigned int const cam2_frame_buffer_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x14000000);

// ����ͼ�����ݵ���ʼ��ַ
unsigned int const I_addr = (XPAR_PSU_DDR_0_S_AXI_BASEADDR + 0x15000000);
unsigned int Q_addr;
unsigned int U_addr;

// ����ͼ�����ݵ���ʼ��ַ
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

//aoe����
void image_operations(uint8_t *im1, uint8_t *im2, uint8_t *im3, int16_t *I,
					int16_t *Q, int16_t *U, int HEIGHT, int WIDTH, int CHANNELS) ;
void calculate_IUQDopAop(int16_t *I,int16_t *Q,int16_t *U,double *Dop, double *Aop, int HEIGHT, int WIDTH, int CHANNELS);
void process_data(double *Aop, double *Dop, uint8_t *AOE ,int HEIGHT, int WIDTH);
void singlech_to_threech(uint8_t *sin_image, uint8_t *thr_image, int HEIGHT, int WIDTH);

int main(void)
{
	XGpioPs_Config *gpiops_cfg_ptr; //PS �� GPIO ������Ϣ

	u32 status0,status1,status2;    //2,3������
	int	time = 0;
	u16 cmos_h_pixel;   //ov5640 DVP ���ˮƽ���ص���
	u16 cmos_v_pixel;   //ov5640 DVP �����ֱ���ص���
	u16 total_h_pixel;  //ov5640 ˮƽ�����ش�С
	u16 total_v_pixel;  //ov5640 ��ֱ�����ش�С

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


	emio_init();                                    //��ʼ��EMIO
	status0 = ov5640_init(CAM0_CH0,cmos_h_pixel,  //��ʼ��ov5640 1
						  cmos_v_pixel,
						  total_h_pixel,
						  total_v_pixel);

	status1 = ov5640_init(CAM1_CH1,cmos_h_pixel,  //��ʼ��ov5640 2
						  cmos_v_pixel,
						  total_h_pixel,
						  total_v_pixel);

	status2 = ov5640_init(CAM2_CH2,cmos_h_pixel,  //��ʼ��ov5640 3
						  cmos_v_pixel,
						  total_h_pixel,
						  total_v_pixel);

	if(status0 == 0 && status1 == 0  && status2 == 0)
		xil_printf("Dual OV5640 detected successful!\r\n");
	else
		xil_printf("Dual OV5640 detected failed!\r\n");

	//���ݻ�ȡ��LCD��ID��������video������ѡ��
	vd_mode = VMODE_1280x800;
	//vd_mode = VMODE_800x480;


	//����VDMA0
	run_vdma_frame_buffer(&cam0_vdma, CAM0_VDMA_ID, vd_mode.width, vd_mode.height,
							cam0_frame_buffer_addr,0,0,ONLY_WRITE);
	//����VDMA1
	run_vdma_frame_buffer(&cam1_vdma, CAM1_VDMA_ID, vd_mode.width, vd_mode.height,
							cam1_frame_buffer_addr,0,0,ONLY_WRITE);
	//����VDMA2
	run_vdma_frame_buffer(&cam2_vdma, CAM2_VDMA_ID, vd_mode.width, vd_mode.height,
							cam2_frame_buffer_addr,0,0,ONLY_WRITE);							//������

	//����VDMA�Դ��С��BMP�ļ�ͷ��ֵ
	*bmp_width 	= vd_mode.width;
	*bmp_height = vd_mode.height;
	*bmp_size   = vd_mode.width * vd_mode.height * 3;
	*bf_size 	= *bmp_size + 54;
	//�����ж�
	setup_interrupt_system(&intc, &gpiops_inst, GPIO_INTERRUPT_ID);
	//�����ļ�ϵͳ
	f_mount(&fatfs,"",1);

	while(1){

	    	XGpioPs_WritePin(&gpiops_inst, MIOLED1, 0x1);

	    	if(key_press){
	    		usleep(20000);
	    		if(XGpioPs_ReadPin(&gpiops_inst, MIO_KEY1) == 0){
	    			XGpioPs_WritePin(&gpiops_inst, MIOLED1, 0x0);

	    			COUNT_IP_mWriteReg(COUNT_IP_BASEADDR, COUNT_IP_S00_AXI_SLV_REG0_OFFSET, 1);
	    			COUNT_IP_mWriteReg(COUNT_IP_BASEADDR, COUNT_IP_S00_AXI_SLV_REG1_OFFSET, 0);

	    			//printf("capture picture\n");     //�ɼ�ͼƬ
			    	memcpy((void *)picture0_buffer_addr,(void *)cam0_frame_buffer_addr,vd_mode.height*vd_mode.width*3);
			    	memcpy((void *)picture1_buffer_addr,(void *)cam1_frame_buffer_addr,vd_mode.height*vd_mode.width*3);
				    memcpy((void *)picture2_buffer_addr,(void *)cam2_frame_buffer_addr,vd_mode.height*vd_mode.width*3);

			    	//write_sd_bmp((u8 *)((uintptr_t)picture0_buffer_addr), "picture0.bmp");
			    	//write_sd_bmp((u8 *)((uintptr_t)picture1_buffer_addr), "picture1.bmp");
			    	//write_sd_bmp((u8 *)((uintptr_t)picture2_buffer_addr), "picture2.bmp");
					printf("picture calculate\n");     //����

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
					//��ѯ Canny ��Ե���������Ƿ��ڿ���״̬
					while(!XCanny_accel_IsIdle(&canny_inst));
					//��ʼ����
					XCanny_accel_Start(&canny_inst);
					//��ѯ Canny ��Ե���������Ƿ��Ѿ���������Ĺ���
					while(!XCanny_accel_IsDone(&canny_inst));

					Xil_DCacheFlushRange((UINTPTR) binedge, MAX_2UCI_LEN);

					XEdgetracing_accel_Set_img_inp(&edgetracing_inst,binedge_addr);
					XEdgetracing_accel_Set_img_out(&edgetracing_inst,edges_addr);
					//��ѯ XEdgetracing �������Ƿ��ڿ���״̬
					while(!XEdgetracing_accel_IsIdle(&edgetracing_inst));
					//���� XEdgetracing_accel ������
					XEdgetracing_accel_Start(&edgetracing_inst);
					//��� XEdgetracing_accel �Ƿ��Ѿ�����˵�ǰ������
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
	    		XGpioPs_IntrClearPin(&gpiops_inst, MIO_KEY1) ; //������� KEY �ж�
	    		XGpioPs_IntrEnablePin(&gpiops_inst, MIO_KEY1) ; //ʹ�ܰ��� KEY �ж�
	    	}
	    }

    return 0;
}
//������������ͷ���õ�λ�ö�Ӧ��ƫ��Ƭ�ǶȽ����޸ģ�0��45�㣩��1��0�㣩��2��90�㣩��
void image_operations(uint8_t *im1, uint8_t *im2, uint8_t *im3, int16_t *I,
					int16_t *Q, int16_t *U, int HEIGHT, int WIDTH, int CHANNELS) {
    // ���� I = im2_image_gray1 + im2_image_gray3
    for (int y = 0; y < HEIGHT; ++y) {
        for (int x = 0; x < WIDTH; ++x) {
        	int index = (y * WIDTH + x) * CHANNELS;
        	for(int c = 0;c < CHANNELS; ++c){
        		I[index + c] = im2[index + c] + im3[index + c];
        	}
        }
    }
    // ���� Q = im2_image_gray1 - im2_image_gray3
    for (int y = 0; y < HEIGHT; ++y) {
        for (int x = 0; x < WIDTH; ++x) {
        	int index = (y * WIDTH + x) * CHANNELS;
        	for(int c = 0;c < CHANNELS; ++c){
        		Q[index + c] = im2[index + c] - im3[index + c];
        	}
        }
    }
    // ���� U = 2*im2_image_gray2 - im2_image_gray1 - im2_image_gray3
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
        		//C�����е� atan2 ���ص��ǻ���ֵ,ת��Ϊ�Ƕ�ֵ
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
    // ���� Aoo
    for (y = 0; y < HEIGHT; y++) {
        for (x = 0; x < WIDTH; x++) {
            Aoo[y * WIDTH + x] = atan2((double)(x - HEIGHT/2) , (double)(y - WIDTH/2));
        }
    }
    // ���� Aoe
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
    // ��Aoeת��Ϊ�������������뵽��ӽ�������
    for (y = 0; y < HEIGHT; y++) {
        for (x = 0; x < WIDTH; x++) {
            Aoe[y * WIDTH + x] *= 57.2958; //180.0 / M_PI
            AOE[y * WIDTH + x] = (uint8_t)round(Aoe[y * WIDTH + x]);
        }
    }
}
/******************************��ͨ��ͼ������ת������ͨ��*******************************************/
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
//�жϴ�����
static void intr_handler()
{
	//��ȡ KEY �������ŵ��ж�״̬���ж��Ƿ����ж�
	if(!XGpioPs_ReadPin(&gpiops_inst, MIO_KEY1)){
		key_press = 1;
		XGpioPs_IntrDisablePin(&gpiops_inst, MIO_KEY1) ; //���ΰ��� KEY �ж�
	}
}

//�����ж�ϵͳ��ʹ�� KEY �������½����ж�
static void setup_interrupt_system(XScuGic *gic_ins_ptr, XGpioPs *gpiops_inst, u16 GpioIntrId)
{
	int status;
	XScuGic_Config *IntcConfig; //�жϿ�����������Ϣ
	//�����жϿ�����������Ϣ����ʼ���жϿ���������
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	XScuGic_CfgInitialize(gic_ins_ptr,IntcConfig, IntcConfig->CpuBaseAddress);

	//���ò�ʹ���ж��쳣
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler, gic_ins_ptr);
	Xil_ExceptionEnable();

	//Ϊ�ж������жϴ�����
	XScuGic_Connect(gic_ins_ptr, GpioIntrId,(Xil_ExceptionHandler) intr_handler, (void *) gpiops_inst);

	//ʹ�������� Gpio �������ж�
	XScuGic_Enable(gic_ins_ptr, GpioIntrId);
	//���� KEY �������ж�����Ϊ�½����ж�
	XGpioPs_SetIntrTypePin(gpiops_inst, MIO_KEY1, XGPIOPS_IRQ_TYPE_EDGE_FALLING);
	//ʹ�ܰ��� KEY �ж�
	XGpioPs_IntrEnablePin(gpiops_inst, MIO_KEY1);
}
//��SD����дBMPͼƬ
void write_sd_bmp(u8 *frame, char pic_name[20])
{
	FIL		fil;				//�ļ�����
	UINT 	bw;					//д�ļ�����������д����ֽ���
			//�ַ��������ڴ洢BMP�ļ���

	//��ӡBMPͼƬ��Ϣ(��/��/ͼƬ��С),�Լ�BMP�ļ���С
	xil_printf("width = %d, height = %d, size = %d, file size = %d bytes \n\r",
			*bmp_width,*bmp_height,*bmp_size,*bf_size);

	//��BMPͼƬ���ļ������
	//sprintf(pic_name,"picture %04u.bmp",pic_cnt);
	//��BMP�ļ�,����������򴴽����ļ�
	f_open(&fil,pic_name,FA_CREATE_ALWAYS | FA_WRITE);

	//�ƶ��ļ���дָ�뵽�ļ���ͷ
	f_lseek(&fil,0);
	//д��BMP�ļ�ͷ
	f_write(&fil,bmp_head,54,&bw);
	//д��ץ�ĵ�ͼƬ
	f_write(&fil,frame,*bmp_size,&bw);
	//�ر��ļ�
	f_close(&fil);
	xil_printf("write %s done! \n\r",pic_name);
}
//��SD����дBMPͼƬ
/*
void write_sd_picture(u8 *frame)
{
	FIL		fil;				//�ļ�����
	UINT 	bw;					//д�ļ�����������д����ֽ���
	char 	pic_name[20];		//�ַ��������ڴ洢BMP�ļ���

	//��ӡBMPͼƬ��Ϣ(��/��/ͼƬ��С),�Լ�BMP�ļ���С
	xil_printf("width = %d, height = %d, size = %d, file size = %d bytes \n\r",
			*bmp_width,*bmp_height,*bmp_size,*bf_size);

	//��BMPͼƬ���ļ������
	if(pic_flag == 0){
		sprintf(pic_name,"wr0_fram %04u.bmp",pic_cnt);
	}else if(pic_flag == 1){
		sprintf(pic_name,"wr1_fram %04u.bmp",pic_cnt);
	}else if(pic_flag == 2){
		sprintf(pic_name,"wr2_fram %04u.bmp",pic_cnt);
	}else{
		sprintf(pic_name,"picture %04u.bmp",pic_cnt);
	}
	//��BMP�ļ�,����������򴴽����ļ�
	f_open(&fil,pic_name,FA_CREATE_ALWAYS | FA_WRITE);

	//�ƶ��ļ���дָ�뵽�ļ���ͷ
	f_lseek(&fil,0);
	//д��BMP�ļ�ͷ
	f_write(&fil,bmp_head,54,&bw);
	//д��ץ�ĵ�ͼƬ
	f_write(&fil,frame,*bmp_size,&bw);
	//�ر��ļ�
	f_close(&fil);
	xil_printf("write %s done! \n\r",pic_name);
}*/
void write_sd_data(float data)
{
	FIL		fil;				//�ļ�����
	UINT bytes_written;
	char filename[] = "result.txt";

	f_open(&fil, filename, FA_OPEN_APPEND | FA_WRITE);		//FA_OPEN_APPEND ��־ȷ��ÿ��д�붼�������ļ���ĩβ
	//f_lseek(&fil, SEEK_END);	//ȷ���ļ�ָ��λ���ļ�ĩβ
	char buffer[50];
	sprintf(buffer,"%f\n",data);
	f_write(&fil, buffer, strlen(buffer), &bytes_written);

	f_close(&fil);
	xil_printf("write %s done! \n\r",filename);
}
