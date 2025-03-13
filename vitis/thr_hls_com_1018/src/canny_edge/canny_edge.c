#include <stdio.h>
#include <math.h>
#include "canny_edge.h"



int HEIGHT	;
int WIDTH	;

void Hough(uint8_t *edges, int HEIGHT, int WIDTH, double *theta, int *rho)
{
	uint8_t *accumulator = (uint8_t *)((uintptr_t)accumulator_addr);
	int MAX_RHO = (int)sqrt(HEIGHT * HEIGHT + WIDTH * WIDTH) + 1;
	int MAX_THETA = 180;
	int THETA_STEP = 1;
	int ACCUMULATOR_THRESHOLD = 50;
	int accumulator_size = MAX_RHO * (MAX_THETA / THETA_STEP);
	//int accumulator[accumulator_size];

	// 初始化累加器
	for (int i = 0; i < accumulator_size; i++) {
		accumulator[i] = 0;
	}
	for(int y = 0; y < HEIGHT;y++){
		for(int x = 0; x < WIDTH; x++){
			if(edges[y * WIDTH + x] == 255){
				for(int theta = 0; theta < MAX_THETA; theta += THETA_STEP){
					double radians = theta * M_PI / 180;
					int rho = round(x * cos(radians) + y * sin(radians)) + MAX_RHO / 2; // 避免rho为负
					if(rho >= 0 && rho < MAX_RHO){
						accumulator[rho * (MAX_THETA / THETA_STEP) + theta]++;
					}
				}
			}
		}
	}
	 // 寻找峰值
	for(int r = 0; r < MAX_RHO; r++) {
		for(int t = 0; t < MAX_THETA; t++) {
	    	if(accumulator[r * (MAX_THETA / THETA_STEP) + t] > ACCUMULATOR_THRESHOLD) {
	    		ACCUMULATOR_THRESHOLD = accumulator[r * (MAX_THETA / THETA_STEP) + t];
	        	*theta = t ; //弧度值 * M_PI / 180
	        	*rho = r - MAX_RHO / 2;
	          	//printf("Detected line at theta: %f, rho: %d\n", theta, rho);
	        }
	    }
	}
}

/************************************ 高斯滤波***********************************/
/*
void gaussianBlur(unsigned char *picture_in, int ksize, double sigma, unsigned char *picture_out, int HEIGHT, int WIDTH)
{
    int i, j, m, n;
    int radius = ksize / 2;
    double weightSum;
    double weightTotal;
    double weightMatrix[ksize * ksize];
    // 计算高斯权重矩阵
    for (i = 0; i < ksize; i++)
    {
        for (j = 0; j < ksize; j++)
        {
            m = i - radius;
            n = j - radius;
            weightMatrix[i * ksize + j] = exp(-((m * m + n * n) / (2 * sigma * sigma)));
            weightSum += weightMatrix[i * ksize + j];
        }
    }
    // 高斯滤波处理
    for (i = 0; i < HEIGHT; i++)
    {
        for (j = 0; j < WIDTH; j++)
        {
        	int index = i * WIDTH + j;
            double pixelValue = 0.0;
            weightTotal = 0.0;

            for (m = -radius; m <= radius; m++)
            {
                for (n = -radius; n <= radius; n++)
                {
                    if (i + m >= 0 && i + m < HEIGHT && j + n >= 0 && j + n < WIDTH)
                    {
                        pixelValue += picture_in[(i + m) * WIDTH + j + n] * weightMatrix[(m + radius) * ksize + n + radius];
                        weightTotal += weightMatrix[(m + radius) * ksize + n + radius];
                    }
                }
            }

            picture_out[index] = (unsigned char)(pixelValue / weightTotal);
        }
    }
}*/
/****************Sobel算子***************
 水平方向Sobel算子：
-1  0  1
-2  0  2
-1  0  1
垂直方向Sobel算子：
-1 -2 -1
 0  0  0
 1  2  1
 *****************************************/
/****************************************************************************************************
*函数简介       基于soble算子计算四个方向的梯度幅值
*参数说明       picture         输入二维数组名
*参数说明		gradient_h		水平方向梯度幅值
				gradient_v		垂直方向梯度幅值
				gradient_d1		正对角线方向梯度幅值
				gradient_d2		反对角线方向梯度幅值
*返回参数       void
****************************************************************************************************/
/*
void sobel_gradient(unsigned char *picture, int16_t *gradient_h, int16_t *gradient_v, int HEIGHT, int WIDTH)
{
    //*卷积核大小*
	//unsigned char KERNEL_SIZE = 3;
	int xStart = 1;
	int xEnd = WIDTH - 1;
	int yStart = 1;
	int yEnd = HEIGHT - 1;
	int i, j, index;

    for (i = yStart; i < yEnd; i++)
    {
        for (j = xStart; j < xEnd; j++)
        {
        	index = i * WIDTH + j;
            //计算不同方向梯度幅值
            // 水平方向
            gradient_h[index] = (int16_t)picture[(i - 1) * WIDTH + j + 1] - (int16_t)picture[(i - 1) * WIDTH + j - 1]
								+ (int16_t)(picture[i * WIDTH + j + 1] * 2) - (int16_t)(picture[i * WIDTH + j - 1] * 2)
								+ (int16_t)picture[(i + 1) * WIDTH + j + 1] - (int16_t)picture[(i + 1) * WIDTH + j - 1];

            // 垂直方向
            gradient_v[index] = (int16_t)picture[(i + 1) * WIDTH + j - 1] - (int16_t)picture[(i - 1) * WIDTH + j - 1]
								+ (int16_t)(picture[(i + 1) * WIDTH + j] * 2) - (int16_t)(picture[(i - 1) * WIDTH + j] * 2)
								+ (int16_t)picture[(i + 1) * WIDTH + j + 1] - (int16_t)picture[(i - 1) * WIDTH + j + 1];
        }
    }
}*/
/****************************************************************************************************
 * 计算图像的梯度幅值和方向
 * @param Gx 输入图像的水平方向梯度数组，类型为 int16，大小为 [PICTURE_H][PICTURE_W]。
 * @param Gy 输入图像的垂直方向梯度数组，类型为 int16，大小为 [PICTURE_H][PICTURE_W]。
 * @param G 输出图像的梯度幅值数组，类型为 int16，大小为 [PICTURE_H][PICTURE_W]。
 * @param theta 输出图像的梯度方向数组，类型为 float，大小为 [PICTURE_H][PICTURE_W]。
 ****************************************************************************************************/
/*
void calculate_gradient(int16_t *Gx,int16_t *Gy, uint16_t *G, float *theta, int HEIGHT, int WIDTH)
{
    // 计算图像梯度幅值和方向
    for (int i = 0; i < HEIGHT; i++)
    {
        for (int j = 0; j < WIDTH; j++)
        {
        	int index = i * WIDTH + j;
            G[index] = floor(sqrt(pow(Gx[index], 2) + pow(Gy[index], 2)));
            if(G[index] > 255){
            	G[index] = 255;
            }
            theta[index] = atan2(Gy[index], Gx[index]) * 180 / M_PI;
        }
    }
}*/
/****************************************************************************************************
 * 对图像的梯度幅值进行非极大值抑制，以细化边缘。
 *
 * @param G 梯度幅值数组，类型为 int16，大小为 [PICTURE_H][PICTURE_W]。
 * @param theta 梯度方向数组，类型为 float，大小为 [PICTURE_H][PICTURE_W]。
 * @param edge_threshold 边缘阈值，类型为 int16。
 * @param result 输出的二值化边缘图像数组，类型为 uint8，大小为 [PICTURE_H][PICTURE_W]。
 ****************************************************************************************************/
/*
void non_maximum_suppression(uint16_t *G, float *theta, uint8_t *result, int HEIGHT, int WIDTH)
{
    // 对梯度幅值进行非极大值抑制
    for (int i = 1; i < HEIGHT - 1; i++)
    {
        for (int j = 1; j < WIDTH - 1; j++)
        {
        	int index = i * WIDTH + j;
            float angle = theta[index];
            if(angle < 0){
            	angle += 180;  			// 0 < angle < 180
            }
            if( (angle > 0 && angle < 22.5) || (angle > 157.5 && angle < 180)){   // x方向
            	if(G[index] > G[i * WIDTH + j + 1]  && G[index] > G[i * WIDTH + j - 1]){
            		result[index] = G[index];
            	}
            	else{
            		result[index] = 0;				//0 黑色
            	}
            }
            else if(angle > 22.5 && angle < 67.5){	//45度方向
            	if(G[index] > G[(i + 1) * WIDTH + j + 1]  && G[index] > G[(i - 1) * WIDTH + j - 1]){
            		result[index] = G[index];
            	}
            	else{
            		result[index] = 0;
            	}
            }
            else if(angle > 67.5 && angle < 112.5){	//y方向
            	if(G[index] > G[(i + 1) * WIDTH + j]  && G[index] > G[(i - 1) * WIDTH + j]){
            		result[index] = G[index];
            	}
            	else{
            		result[index] = 0;
            	}
            }
            else{
            	if(G[index] > G[(i + 1) * WIDTH + j - 1]  && G[index] > G[(i - 1) * WIDTH + j + 1]){
            		result[index] = G[index];
            	}
            	else{
            		result[index] = 0;
            	}
            }
        }
    }
    // 将图像边缘的边界像素置为 0
    for (int i = 0; i < HEIGHT; i++)
    {
        result[i * WIDTH + 0] = 0;
        result[i * WIDTH + WIDTH - 1] = 0;
    }
    for (int j = 0; j < WIDTH; j++)
    {
        result[0 * WIDTH + j] = 0;
        result[(HEIGHT - 1) * WIDTH + j] = 0;
    }
}*/
/****************************************************************************************************
 * 应用双阈值技术将梯度幅值图像转换为边界图像，并使用边缘跟踪算法处理弱边界
 *
 * @param G 梯度幅值数组，二维数组，大小为 PICTURE_H × PICTURE_W
 * @param edges 边界图像数组，二维数组，大小为 PICTURE_H × PICTURE_W
 * @param high_threshold 高阈值，用于判断强边界的阈值
 * @param low_threshold 低阈值，用于判断强边界和弱边界的阈值 (上界一般是下界的2-3倍)
 ****************************************************************************************************/
/*
void apply_double_threshold(uint8_t *G, uint8_t *edges, int16_t high_threshold, int16_t low_threshold, int HEIGHT, int WIDTH)
{
    for (int i = 0; i < HEIGHT; i++)
    {
        for (int j = 0; j < WIDTH; j++)
        {
        	int index = i * WIDTH + j;
            if (G[index] >= high_threshold)
            {
                // 像素强度大于等于高阈值，被认为是强边界
                edges[index] = 255; // 白色
            }
            else if (G[index] <= low_threshold)
            {
            	// 像素强度小于低阈值，被认为是非边界
            	edges[index] = 0; // 黑色

            }
            else
            {
                // 像素强度在高阈值和低阈值之间，被认为是弱边界
                // 检查当前像素周围的8个像素
                if (edges[(i - 1) * WIDTH + j - 1] == 255 || edges[(i - 1) * WIDTH + j] == 255 || edges[(i - 1) * WIDTH + j + 1] == 255 ||
                    edges[i * WIDTH + j - 1] == 255 || edges[i * WIDTH + j + 1] == 255 ||
                    edges[(i + 1) * WIDTH + j - 1] == 255 || edges[(i + 1) * WIDTH + j] == 255 || edges[(i + 1) * WIDTH + j + 1] == 255)
                {
                    // 如果周围任意一个像素是强边界，则将当前像素标记为强边界
                    edges[index] = 255;
                }
                else
                {
                    // 否则将当前像素标记为非边界
                    edges[index] = 0;  //0 黑色
                }
            }
        }
    }
}

*/
