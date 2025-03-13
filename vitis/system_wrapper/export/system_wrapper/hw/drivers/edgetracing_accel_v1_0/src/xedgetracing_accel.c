// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xedgetracing_accel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XEdgetracing_accel_CfgInitialize(XEdgetracing_accel *InstancePtr, XEdgetracing_accel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XEdgetracing_accel_Start(XEdgetracing_accel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XEdgetracing_accel_IsDone(XEdgetracing_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XEdgetracing_accel_IsIdle(XEdgetracing_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XEdgetracing_accel_IsReady(XEdgetracing_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XEdgetracing_accel_EnableAutoRestart(XEdgetracing_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XEdgetracing_accel_DisableAutoRestart(XEdgetracing_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XEdgetracing_accel_Set_img_inp(XEdgetracing_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IMG_INP_DATA, (u32)(Data));
    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IMG_INP_DATA + 4, (u32)(Data >> 32));
}

u64 XEdgetracing_accel_Get_img_inp(XEdgetracing_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IMG_INP_DATA);
    Data += (u64)XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IMG_INP_DATA + 4) << 32;
    return Data;
}

void XEdgetracing_accel_Set_img_out(XEdgetracing_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IMG_OUT_DATA, (u32)(Data));
    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IMG_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XEdgetracing_accel_Get_img_out(XEdgetracing_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IMG_OUT_DATA);
    Data += (u64)XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IMG_OUT_DATA + 4) << 32;
    return Data;
}

void XEdgetracing_accel_Set_rows(XEdgetracing_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_ROWS_DATA, Data);
}

u32 XEdgetracing_accel_Get_rows(XEdgetracing_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_ROWS_DATA);
    return Data;
}

void XEdgetracing_accel_Set_cols(XEdgetracing_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_COLS_DATA, Data);
}

u32 XEdgetracing_accel_Get_cols(XEdgetracing_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_COLS_DATA);
    return Data;
}

void XEdgetracing_accel_InterruptGlobalEnable(XEdgetracing_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_GIE, 1);
}

void XEdgetracing_accel_InterruptGlobalDisable(XEdgetracing_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_GIE, 0);
}

void XEdgetracing_accel_InterruptEnable(XEdgetracing_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IER);
    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IER, Register | Mask);
}

void XEdgetracing_accel_InterruptDisable(XEdgetracing_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IER);
    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XEdgetracing_accel_InterruptClear(XEdgetracing_accel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEdgetracing_accel_WriteReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_ISR, Mask);
}

u32 XEdgetracing_accel_InterruptGetEnabled(XEdgetracing_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_IER);
}

u32 XEdgetracing_accel_InterruptGetStatus(XEdgetracing_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEdgetracing_accel_ReadReg(InstancePtr->Control_BaseAddress, XEDGETRACING_ACCEL_CONTROL_ADDR_ISR);
}

