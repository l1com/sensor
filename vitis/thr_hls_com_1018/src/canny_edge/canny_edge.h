#ifndef CANNY_EDGE_H_
#define CANNY_EDGE_H_

int HEIGHT	;
int WIDTH	;
extern unsigned int const accumulator_addr;

void Hough(uint8_t *edges, int HEIGHT, int WIDTH, double *theta, int *rho);
void gaussianBlur(unsigned char *picture_in, int ksize, double sigma, unsigned char *picture_out, int HEIGHT, int WIDTH);
void sobel_gradient(unsigned char *picture, int16_t *gradient_h, int16_t *gradient_v, int HEIGHT, int WIDTH);

void calculate_gradient(int16_t *Gx,int16_t *Gy, uint16_t *G, float *theta, int HEIGHT, int WIDTH);
void non_maximum_suppression(uint16_t *G, float *theta, uint8_t *result, int HEIGHT, int WIDTH);
void apply_double_threshold(uint8_t *G, uint8_t *edges, int16_t high_threshold, int16_t low_threshold, int HEIGHT, int WIDTH);



#endif
