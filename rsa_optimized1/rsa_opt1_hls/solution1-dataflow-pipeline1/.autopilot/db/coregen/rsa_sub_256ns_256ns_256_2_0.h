// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __rsa_sub_256ns_256ns_256_2_0__HH__
#define __rsa_sub_256ns_256ns_256_2_0__HH__
#include "rsa_sub_256ns_256ns_256_2_0_Adder_4.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int dout_WIDTH>
SC_MODULE(rsa_sub_256ns_256ns_256_2_0) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    rsa_sub_256ns_256ns_256_2_0_Adder_4 rsa_sub_256ns_256ns_256_2_0_Adder_4_U;

    SC_CTOR(rsa_sub_256ns_256ns_256_2_0):  rsa_sub_256ns_256ns_256_2_0_Adder_4_U ("rsa_sub_256ns_256ns_256_2_0_Adder_4_U") {
        rsa_sub_256ns_256ns_256_2_0_Adder_4_U.clk(clk);
        rsa_sub_256ns_256ns_256_2_0_Adder_4_U.reset(reset);
        rsa_sub_256ns_256ns_256_2_0_Adder_4_U.ce(ce);
        rsa_sub_256ns_256ns_256_2_0_Adder_4_U.a(din0);
        rsa_sub_256ns_256ns_256_2_0_Adder_4_U.b(din1);
        rsa_sub_256ns_256ns_256_2_0_Adder_4_U.s(dout);

    }

};

#endif //