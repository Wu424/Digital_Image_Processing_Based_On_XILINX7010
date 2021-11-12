// ==============================================================
// File generated on Fri Aug 27 16:20:35 +0800 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xequalize_hist.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XEqualize_hist_CfgInitialize(XEqualize_hist *InstancePtr, XEqualize_hist_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XEqualize_hist_Set_rows(XEqualize_hist *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEqualize_hist_WriteReg(InstancePtr->Axilites_BaseAddress, XEQUALIZE_HIST_AXILITES_ADDR_ROWS_DATA, Data);
}

u32 XEqualize_hist_Get_rows(XEqualize_hist *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEqualize_hist_ReadReg(InstancePtr->Axilites_BaseAddress, XEQUALIZE_HIST_AXILITES_ADDR_ROWS_DATA);
    return Data;
}

void XEqualize_hist_Set_cols(XEqualize_hist *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEqualize_hist_WriteReg(InstancePtr->Axilites_BaseAddress, XEQUALIZE_HIST_AXILITES_ADDR_COLS_DATA, Data);
}

u32 XEqualize_hist_Get_cols(XEqualize_hist *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEqualize_hist_ReadReg(InstancePtr->Axilites_BaseAddress, XEQUALIZE_HIST_AXILITES_ADDR_COLS_DATA);
    return Data;
}

