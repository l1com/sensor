// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xedgetracing_accel.h"

extern XEdgetracing_accel_Config XEdgetracing_accel_ConfigTable[];

XEdgetracing_accel_Config *XEdgetracing_accel_LookupConfig(u16 DeviceId) {
	XEdgetracing_accel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XEDGETRACING_ACCEL_NUM_INSTANCES; Index++) {
		if (XEdgetracing_accel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XEdgetracing_accel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XEdgetracing_accel_Initialize(XEdgetracing_accel *InstancePtr, u16 DeviceId) {
	XEdgetracing_accel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XEdgetracing_accel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XEdgetracing_accel_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

