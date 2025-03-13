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

	// ��ʼ���ۼ���
	for (int i = 0; i < accumulator_size; i++) {
		accumulator[i] = 0;
	}
	for(int y = 0; y < HEIGHT;y++){
		for(int x = 0; x < WIDTH; x++){
			if(edges[y * WIDTH + x] == 255){
				for(int theta = 0; theta < MAX_THETA; theta += THETA_STEP){
					double radians = theta * M_PI / 180;
					int rho = round(x * cos(radians) + y * sin(radians)) + MAX_RHO / 2; // ����rhoΪ��
					if(rho >= 0 && rho < MAX_RHO){
						accumulator[rho * (MAX_THETA / THETA_STEP) + theta]++;
					}
				}
			}
		}
	}
	 // Ѱ�ҷ�ֵ
	for(int r = 0; r < MAX_RHO; r++) {
		for(int t = 0; t < MAX_THETA; t++) {
	    	if(accumulator[r * (MAX_THETA / THETA_STEP) + t] > ACCUMULATOR_THRESHOLD) {
	    		ACCUMULATOR_THRESHOLD = accumulator[r * (MAX_THETA / THETA_STEP) + t];
	        	*theta = t ; //����ֵ * M_PI / 180
	        	*rho = r - MAX_RHO / 2;
	          	//printf("Detected line at theta: %f, rho: %d\n", theta, rho);
	        }
	    }
	}
}

/************************************ ��˹�˲�***********************************/
/*
void gaussianBlur(unsigned char *picture_in, int ksize, double sigma, unsigned char *picture_out, int HEIGHT, int WIDTH)
{
    int i, j, m, n;
    int radius = ksize / 2;
    double weightSum;
    double weightTotal;
    double weightMatrix[ksize * ksize];
    // �����˹Ȩ�ؾ���
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
    // ��˹�˲�����
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
/****************Sobel����***************
 ˮƽ����Sobel���ӣ�
-1  0  1
-2  0  2
-1  0  1
��ֱ����Sobel���ӣ�
-1 -2 -1
 0  0  0
 1  2  1
 *****************************************/
/****************************************************************************************************
*�������       ����soble���Ӽ����ĸ�������ݶȷ�ֵ
*����˵��       picture         �����ά������
*����˵��		gradient_h		ˮƽ�����ݶȷ�ֵ
				gradient_v		��ֱ�����ݶȷ�ֵ
				gradient_d1		���Խ��߷����ݶȷ�ֵ
				gradient_d2		���Խ��߷����ݶȷ�ֵ
*���ز���       void
****************************************************************************************************/
/*
void sobel_gradient(unsigned char *picture, int16_t *gradient_h, int16_t *gradient_v, int HEIGHT, int WIDTH)
{
    //*����˴�С*
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
            //���㲻ͬ�����ݶȷ�ֵ
            // ˮƽ����
            gradient_h[index] = (int16_t)picture[(i - 1) * WIDTH + j + 1] - (int16_t)picture[(i - 1) * WIDTH + j - 1]
								+ (int16_t)(picture[i * WIDTH + j + 1] * 2) - (int16_t)(picture[i * WIDTH + j - 1] * 2)
								+ (int16_t)picture[(i + 1) * WIDTH + j + 1] - (int16_t)picture[(i + 1) * WIDTH + j - 1];

            // ��ֱ����
            gradient_v[index] = (int16_t)picture[(i + 1) * WIDTH + j - 1] - (int16_t)picture[(i - 1) * WIDTH + j - 1]
								+ (int16_t)(picture[(i + 1) * WIDTH + j] * 2) - (int16_t)(picture[(i - 1) * WIDTH + j] * 2)
								+ (int16_t)picture[(i + 1) * WIDTH + j + 1] - (int16_t)picture[(i - 1) * WIDTH + j + 1];
        }
    }
}*/
/****************************************************************************************************
 * ����ͼ����ݶȷ�ֵ�ͷ���
 * @param Gx ����ͼ���ˮƽ�����ݶ����飬����Ϊ int16����СΪ [PICTURE_H][PICTURE_W]��
 * @param Gy ����ͼ��Ĵ�ֱ�����ݶ����飬����Ϊ int16����СΪ [PICTURE_H][PICTURE_W]��
 * @param G ���ͼ����ݶȷ�ֵ���飬����Ϊ int16����СΪ [PICTURE_H][PICTURE_W]��
 * @param theta ���ͼ����ݶȷ������飬����Ϊ float����СΪ [PICTURE_H][PICTURE_W]��
 ****************************************************************************************************/
/*
void calculate_gradient(int16_t *Gx,int16_t *Gy, uint16_t *G, float *theta, int HEIGHT, int WIDTH)
{
    // ����ͼ���ݶȷ�ֵ�ͷ���
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
 * ��ͼ����ݶȷ�ֵ���зǼ���ֵ���ƣ���ϸ����Ե��
 *
 * @param G �ݶȷ�ֵ���飬����Ϊ int16����СΪ [PICTURE_H][PICTURE_W]��
 * @param theta �ݶȷ������飬����Ϊ float����СΪ [PICTURE_H][PICTURE_W]��
 * @param edge_threshold ��Ե��ֵ������Ϊ int16��
 * @param result ����Ķ�ֵ����Եͼ�����飬����Ϊ uint8����СΪ [PICTURE_H][PICTURE_W]��
 ****************************************************************************************************/
/*
void non_maximum_suppression(uint16_t *G, float *theta, uint8_t *result, int HEIGHT, int WIDTH)
{
    // ���ݶȷ�ֵ���зǼ���ֵ����
    for (int i = 1; i < HEIGHT - 1; i++)
    {
        for (int j = 1; j < WIDTH - 1; j++)
        {
        	int index = i * WIDTH + j;
            float angle = theta[index];
            if(angle < 0){
            	angle += 180;  			// 0 < angle < 180
            }
            if( (angle > 0 && angle < 22.5) || (angle > 157.5 && angle < 180)){   // x����
            	if(G[index] > G[i * WIDTH + j + 1]  && G[index] > G[i * WIDTH + j - 1]){
            		result[index] = G[index];
            	}
            	else{
            		result[index] = 0;				//0 ��ɫ
            	}
            }
            else if(angle > 22.5 && angle < 67.5){	//45�ȷ���
            	if(G[index] > G[(i + 1) * WIDTH + j + 1]  && G[index] > G[(i - 1) * WIDTH + j - 1]){
            		result[index] = G[index];
            	}
            	else{
            		result[index] = 0;
            	}
            }
            else if(angle > 67.5 && angle < 112.5){	//y����
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
    // ��ͼ���Ե�ı߽�������Ϊ 0
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
 * Ӧ��˫��ֵ�������ݶȷ�ֵͼ��ת��Ϊ�߽�ͼ�񣬲�ʹ�ñ�Ե�����㷨�������߽�
 *
 * @param G �ݶȷ�ֵ���飬��ά���飬��СΪ PICTURE_H �� PICTURE_W
 * @param edges �߽�ͼ�����飬��ά���飬��СΪ PICTURE_H �� PICTURE_W
 * @param high_threshold ����ֵ�������ж�ǿ�߽����ֵ
 * @param low_threshold ����ֵ�������ж�ǿ�߽�����߽����ֵ (�Ͻ�һ�����½��2-3��)
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
                // ����ǿ�ȴ��ڵ��ڸ���ֵ������Ϊ��ǿ�߽�
                edges[index] = 255; // ��ɫ
            }
            else if (G[index] <= low_threshold)
            {
            	// ����ǿ��С�ڵ���ֵ������Ϊ�ǷǱ߽�
            	edges[index] = 0; // ��ɫ

            }
            else
            {
                // ����ǿ���ڸ���ֵ�͵���ֵ֮�䣬����Ϊ�����߽�
                // ��鵱ǰ������Χ��8������
                if (edges[(i - 1) * WIDTH + j - 1] == 255 || edges[(i - 1) * WIDTH + j] == 255 || edges[(i - 1) * WIDTH + j + 1] == 255 ||
                    edges[i * WIDTH + j - 1] == 255 || edges[i * WIDTH + j + 1] == 255 ||
                    edges[(i + 1) * WIDTH + j - 1] == 255 || edges[(i + 1) * WIDTH + j] == 255 || edges[(i + 1) * WIDTH + j + 1] == 255)
                {
                    // �����Χ����һ��������ǿ�߽磬�򽫵�ǰ���ر��Ϊǿ�߽�
                    edges[index] = 255;
                }
                else
                {
                    // ���򽫵�ǰ���ر��Ϊ�Ǳ߽�
                    edges[index] = 0;  //0 ��ɫ
                }
            }
        }
    }
}

*/
