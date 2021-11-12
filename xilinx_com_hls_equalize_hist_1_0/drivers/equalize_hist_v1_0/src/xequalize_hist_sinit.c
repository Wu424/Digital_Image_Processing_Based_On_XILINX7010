// ==============================================================
// File generated on Fri Aug 27 16:20:35 +0800 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xequalize_hist.h"

extern XEqualize_hist_Config XEqualize_hist_ConfigTable[];

XEqualize_hist_Config *XEqualize_hist_LookupConfig(u16 DeviceId) {
	XEqualize_hist_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XEQUALIZE_HIST_NUM_INSTANCES; Index++) {
		if (XEqualize_hist_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XEqualize_hist_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XEqualize_hist_Initialize(XEqualize_hist *InstancePtr, u16 DeviceId) {
	XEqualize_hist_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XEqualize_hist_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XEqualize_hist_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

