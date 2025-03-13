//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�http://www.openedv.com/forum.php
//�Ա����̣�https://zhengdianyuanzi.tmall.com
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2023-2033
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           emio_sccb_cfg
// Created by:          ����ԭ��
// Created date:        2023��9��26��10:17:45
// Version:             V1.0
// Descriptions:        SCCB����
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

#include"xgpiops.h"
#include"sleep.h"

#ifndef sccb_EMIO_CFG_
#define sccb_EMIO_CFG_

#define EMIO_SCL0_NUM 78
#define EMIO_SDA0_NUM 79

#define EMIO_SCL1_NUM 80
#define EMIO_SDA1_NUM 81

#define EMIO_SCL2_NUM 82	//������
#define EMIO_SDA2_NUM 83	//������

//#define EMIO_SCL3_NUM 80	//������
//#define EMIO_SDA3_NUM 81	//������

#define CAM0_CH0      0  //CAM0
#define CAM1_CH1      1  //CAM1
#define CAM2_CH2      2  //������
//#define CAM1_CH3      3  //������

void emio_init(void);
void sccb_start(u8 cam_ch);
void sccb_stop(u8 cam_ch);
void sccb_ack(u8 cam_ch);
void sccb_send_byte(u8 cam,u8 txd);
u8  sccb_rece_byte(u8 cam);

#endif /* sccb_EMIO_CFG_ */
