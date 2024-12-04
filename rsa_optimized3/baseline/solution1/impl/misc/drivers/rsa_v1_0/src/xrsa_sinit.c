// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xrsa.h"

extern XRsa_Config XRsa_ConfigTable[];

XRsa_Config *XRsa_LookupConfig(u16 DeviceId) {
	XRsa_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XRSA_NUM_INSTANCES; Index++) {
		if (XRsa_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XRsa_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XRsa_Initialize(XRsa *InstancePtr, u16 DeviceId) {
	XRsa_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XRsa_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XRsa_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

