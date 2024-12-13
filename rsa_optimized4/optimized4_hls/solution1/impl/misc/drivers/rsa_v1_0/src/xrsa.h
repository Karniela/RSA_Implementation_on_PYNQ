// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XRSA_H
#define XRSA_H

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
#include "xrsa_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XRsa_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XRsa;

typedef u32 word_type;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
} XRsa_P;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
} XRsa_Q;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
    u32 word_4;
    u32 word_5;
    u32 word_6;
    u32 word_7;
} XRsa_D;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
    u32 word_4;
    u32 word_5;
    u32 word_6;
    u32 word_7;
} XRsa_N;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
    u32 word_4;
    u32 word_5;
    u32 word_6;
    u32 word_7;
} XRsa_Y;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
    u32 word_4;
    u32 word_5;
    u32 word_6;
    u32 word_7;
} XRsa_X;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XRsa_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XRsa_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XRsa_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XRsa_ReadReg(BaseAddress, RegOffset) \
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
int XRsa_Initialize(XRsa *InstancePtr, u16 DeviceId);
XRsa_Config* XRsa_LookupConfig(u16 DeviceId);
int XRsa_CfgInitialize(XRsa *InstancePtr, XRsa_Config *ConfigPtr);
#else
int XRsa_Initialize(XRsa *InstancePtr, const char* InstanceName);
int XRsa_Release(XRsa *InstancePtr);
#endif

void XRsa_Start(XRsa *InstancePtr);
u32 XRsa_IsDone(XRsa *InstancePtr);
u32 XRsa_IsIdle(XRsa *InstancePtr);
u32 XRsa_IsReady(XRsa *InstancePtr);
void XRsa_EnableAutoRestart(XRsa *InstancePtr);
void XRsa_DisableAutoRestart(XRsa *InstancePtr);

void XRsa_Set_p(XRsa *InstancePtr, XRsa_P Data);
XRsa_P XRsa_Get_p(XRsa *InstancePtr);
void XRsa_Set_q(XRsa *InstancePtr, XRsa_Q Data);
XRsa_Q XRsa_Get_q(XRsa *InstancePtr);
void XRsa_Set_d(XRsa *InstancePtr, XRsa_D Data);
XRsa_D XRsa_Get_d(XRsa *InstancePtr);
void XRsa_Set_N(XRsa *InstancePtr, XRsa_N Data);
XRsa_N XRsa_Get_N(XRsa *InstancePtr);
void XRsa_Set_y(XRsa *InstancePtr, XRsa_Y Data);
XRsa_Y XRsa_Get_y(XRsa *InstancePtr);
XRsa_X XRsa_Get_x(XRsa *InstancePtr);
u32 XRsa_Get_x_vld(XRsa *InstancePtr);

void XRsa_InterruptGlobalEnable(XRsa *InstancePtr);
void XRsa_InterruptGlobalDisable(XRsa *InstancePtr);
void XRsa_InterruptEnable(XRsa *InstancePtr, u32 Mask);
void XRsa_InterruptDisable(XRsa *InstancePtr, u32 Mask);
void XRsa_InterruptClear(XRsa *InstancePtr, u32 Mask);
u32 XRsa_InterruptGetEnabled(XRsa *InstancePtr);
u32 XRsa_InterruptGetStatus(XRsa *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
