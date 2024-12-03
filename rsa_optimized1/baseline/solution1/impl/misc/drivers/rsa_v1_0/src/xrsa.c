// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xrsa.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XRsa_CfgInitialize(XRsa *InstancePtr, XRsa_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XRsa_Start(XRsa *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_AP_CTRL) & 0x80;
    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XRsa_IsDone(XRsa *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XRsa_IsIdle(XRsa *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XRsa_IsReady(XRsa *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XRsa_EnableAutoRestart(XRsa *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XRsa_DisableAutoRestart(XRsa *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_AP_CTRL, 0);
}

void XRsa_Set_d(XRsa *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_D_DATA, Data);
}

u32 XRsa_Get_d(XRsa *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_D_DATA);
    return Data;
}

void XRsa_Set_N(XRsa *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_N_DATA, Data);
}

u32 XRsa_Get_N(XRsa *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_N_DATA);
    return Data;
}

void XRsa_Set_y(XRsa *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_Y_DATA, Data);
}

u32 XRsa_Get_y(XRsa *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_Y_DATA);
    return Data;
}

u32 XRsa_Get_x(XRsa *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_X_DATA);
    return Data;
}

u32 XRsa_Get_x_vld(XRsa *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_X_CTRL);
    return Data & 0x1;
}

void XRsa_InterruptGlobalEnable(XRsa *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_GIE, 1);
}

void XRsa_InterruptGlobalDisable(XRsa *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_GIE, 0);
}

void XRsa_InterruptEnable(XRsa *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_IER);
    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_IER, Register | Mask);
}

void XRsa_InterruptDisable(XRsa *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_IER);
    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_IER, Register & (~Mask));
}

void XRsa_InterruptClear(XRsa *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRsa_WriteReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_ISR, Mask);
}

u32 XRsa_InterruptGetEnabled(XRsa *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_IER);
}

u32 XRsa_InterruptGetStatus(XRsa *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRsa_ReadReg(InstancePtr->Control_BaseAddress, XRSA_CONTROL_ADDR_ISR);
}

