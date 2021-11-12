// ==============================================================
// File generated on Fri Aug 27 16:20:35 +0800 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XEQUALIZE_HIST_H
#define XEQUALIZE_HIST_H

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
#include "xequalize_hist_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axilites_BaseAddress;
} XEqualize_hist_Config;
#endif

typedef struct {
    u32 Axilites_BaseAddress;
    u32 IsReady;
} XEqualize_hist;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XEqualize_hist_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XEqualize_hist_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XEqualize_hist_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XEqualize_hist_ReadReg(BaseAddress, RegOffset) \
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
int XEqualize_hist_Initialize(XEqualize_hist *InstancePtr, u16 DeviceId);
XEqualize_hist_Config* XEqualize_hist_LookupConfig(u16 DeviceId);
int XEqualize_hist_CfgInitialize(XEqualize_hist *InstancePtr, XEqualize_hist_Config *ConfigPtr);
#else
int XEqualize_hist_Initialize(XEqualize_hist *InstancePtr, const char* InstanceName);
int XEqualize_hist_Release(XEqualize_hist *InstancePtr);
#endif


void XEqualize_hist_Set_rows(XEqualize_hist *InstancePtr, u32 Data);
u32 XEqualize_hist_Get_rows(XEqualize_hist *InstancePtr);
void XEqualize_hist_Set_cols(XEqualize_hist *InstancePtr, u32 Data);
u32 XEqualize_hist_Get_cols(XEqualize_hist *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
