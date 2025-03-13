// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XEDGETRACING_ACCEL_H
#define XEDGETRACING_ACCEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xedgetracing_accel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XEdgetracing_accel_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XEdgetracing_accel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XEdgetracing_accel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XEdgetracing_accel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XEdgetracing_accel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XEdgetracing_accel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XEdgetracing_accel_Initialize(XEdgetracing_accel *InstancePtr, u16 DeviceId);
XEdgetracing_accel_Config* XEdgetracing_accel_LookupConfig(u16 DeviceId);
int XEdgetracing_accel_CfgInitialize(XEdgetracing_accel *InstancePtr, XEdgetracing_accel_Config *ConfigPtr);
#else
int XEdgetracing_accel_Initialize(XEdgetracing_accel *InstancePtr, const char* InstanceName);
int XEdgetracing_accel_Release(XEdgetracing_accel *InstancePtr);
#endif

void XEdgetracing_accel_Start(XEdgetracing_accel *InstancePtr);
u32 XEdgetracing_accel_IsDone(XEdgetracing_accel *InstancePtr);
u32 XEdgetracing_accel_IsIdle(XEdgetracing_accel *InstancePtr);
u32 XEdgetracing_accel_IsReady(XEdgetracing_accel *InstancePtr);
void XEdgetracing_accel_EnableAutoRestart(XEdgetracing_accel *InstancePtr);
void XEdgetracing_accel_DisableAutoRestart(XEdgetracing_accel *InstancePtr);

void XEdgetracing_accel_Set_img_inp(XEdgetracing_accel *InstancePtr, u64 Data);
u64 XEdgetracing_accel_Get_img_inp(XEdgetracing_accel *InstancePtr);
void XEdgetracing_accel_Set_img_out(XEdgetracing_accel *InstancePtr, u64 Data);
u64 XEdgetracing_accel_Get_img_out(XEdgetracing_accel *InstancePtr);
void XEdgetracing_accel_Set_rows(XEdgetracing_accel *InstancePtr, u32 Data);
u32 XEdgetracing_accel_Get_rows(XEdgetracing_accel *InstancePtr);
void XEdgetracing_accel_Set_cols(XEdgetracing_accel *InstancePtr, u32 Data);
u32 XEdgetracing_accel_Get_cols(XEdgetracing_accel *InstancePtr);

void XEdgetracing_accel_InterruptGlobalEnable(XEdgetracing_accel *InstancePtr);
void XEdgetracing_accel_InterruptGlobalDisable(XEdgetracing_accel *InstancePtr);
void XEdgetracing_accel_InterruptEnable(XEdgetracing_accel *InstancePtr, u32 Mask);
void XEdgetracing_accel_InterruptDisable(XEdgetracing_accel *InstancePtr, u32 Mask);
void XEdgetracing_accel_InterruptClear(XEdgetracing_accel *InstancePtr, u32 Mask);
u32 XEdgetracing_accel_InterruptGetEnabled(XEdgetracing_accel *InstancePtr);
u32 XEdgetracing_accel_InterruptGetStatus(XEdgetracing_accel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
