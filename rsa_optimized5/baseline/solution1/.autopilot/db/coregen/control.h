// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of p
//        bit 31~0 - p[31:0] (Read/Write)
// 0x14 : Data signal of p
//        bit 31~0 - p[63:32] (Read/Write)
// 0x18 : Data signal of p
//        bit 31~0 - p[95:64] (Read/Write)
// 0x1c : Data signal of p
//        bit 31~0 - p[127:96] (Read/Write)
// 0x20 : reserved
// 0x24 : Data signal of q
//        bit 31~0 - q[31:0] (Read/Write)
// 0x28 : Data signal of q
//        bit 31~0 - q[63:32] (Read/Write)
// 0x2c : Data signal of q
//        bit 31~0 - q[95:64] (Read/Write)
// 0x30 : Data signal of q
//        bit 31~0 - q[127:96] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of d
//        bit 31~0 - d[31:0] (Read/Write)
// 0x3c : Data signal of d
//        bit 31~0 - d[63:32] (Read/Write)
// 0x40 : Data signal of d
//        bit 31~0 - d[95:64] (Read/Write)
// 0x44 : Data signal of d
//        bit 31~0 - d[127:96] (Read/Write)
// 0x48 : Data signal of d
//        bit 31~0 - d[159:128] (Read/Write)
// 0x4c : Data signal of d
//        bit 31~0 - d[191:160] (Read/Write)
// 0x50 : Data signal of d
//        bit 31~0 - d[223:192] (Read/Write)
// 0x54 : Data signal of d
//        bit 31~0 - d[255:224] (Read/Write)
// 0x58 : reserved
// 0x5c : Data signal of N
//        bit 31~0 - N[31:0] (Read/Write)
// 0x60 : Data signal of N
//        bit 31~0 - N[63:32] (Read/Write)
// 0x64 : Data signal of N
//        bit 31~0 - N[95:64] (Read/Write)
// 0x68 : Data signal of N
//        bit 31~0 - N[127:96] (Read/Write)
// 0x6c : Data signal of N
//        bit 31~0 - N[159:128] (Read/Write)
// 0x70 : Data signal of N
//        bit 31~0 - N[191:160] (Read/Write)
// 0x74 : Data signal of N
//        bit 31~0 - N[223:192] (Read/Write)
// 0x78 : Data signal of N
//        bit 31~0 - N[255:224] (Read/Write)
// 0x7c : reserved
// 0x80 : Data signal of y
//        bit 31~0 - y[31:0] (Read/Write)
// 0x84 : Data signal of y
//        bit 31~0 - y[63:32] (Read/Write)
// 0x88 : Data signal of y
//        bit 31~0 - y[95:64] (Read/Write)
// 0x8c : Data signal of y
//        bit 31~0 - y[127:96] (Read/Write)
// 0x90 : Data signal of y
//        bit 31~0 - y[159:128] (Read/Write)
// 0x94 : Data signal of y
//        bit 31~0 - y[191:160] (Read/Write)
// 0x98 : Data signal of y
//        bit 31~0 - y[223:192] (Read/Write)
// 0x9c : Data signal of y
//        bit 31~0 - y[255:224] (Read/Write)
// 0xa0 : reserved
// 0xa4 : Data signal of x
//        bit 31~0 - x[31:0] (Read)
// 0xa8 : Data signal of x
//        bit 31~0 - x[63:32] (Read)
// 0xac : Data signal of x
//        bit 31~0 - x[95:64] (Read)
// 0xb0 : Data signal of x
//        bit 31~0 - x[127:96] (Read)
// 0xb4 : Data signal of x
//        bit 31~0 - x[159:128] (Read)
// 0xb8 : Data signal of x
//        bit 31~0 - x[191:160] (Read)
// 0xbc : Data signal of x
//        bit 31~0 - x[223:192] (Read)
// 0xc0 : Data signal of x
//        bit 31~0 - x[255:224] (Read)
// 0xc4 : Control signal of x
//        bit 0  - x_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL 0x00
#define CONTROL_ADDR_GIE     0x04
#define CONTROL_ADDR_IER     0x08
#define CONTROL_ADDR_ISR     0x0c
#define CONTROL_ADDR_P_DATA  0x10
#define CONTROL_BITS_P_DATA  128
#define CONTROL_ADDR_Q_DATA  0x24
#define CONTROL_BITS_Q_DATA  128
#define CONTROL_ADDR_D_DATA  0x38
#define CONTROL_BITS_D_DATA  256
#define CONTROL_ADDR_N_DATA  0x5c
#define CONTROL_BITS_N_DATA  256
#define CONTROL_ADDR_Y_DATA  0x80
#define CONTROL_BITS_Y_DATA  256
#define CONTROL_ADDR_X_DATA  0xa4
#define CONTROL_BITS_X_DATA  256
#define CONTROL_ADDR_X_CTRL  0xc4
