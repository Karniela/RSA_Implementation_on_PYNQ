// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rsa_Block_entry45_proc2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        y,
        d,
        N,
        x,
        x_ap_vld
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [255:0] y;
input  [255:0] d;
input  [255:0] N;
output  [255:0] x;
output   x_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[255:0] x;
reg x_ap_vld;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    grp_mod_exp_fu_39_ap_start;
wire    grp_mod_exp_fu_39_ap_done;
wire    grp_mod_exp_fu_39_ap_idle;
wire    grp_mod_exp_fu_39_ap_ready;
wire   [255:0] grp_mod_exp_fu_39_ap_return;
reg    grp_mod_exp_fu_39_ap_start_reg;
reg    ap_block_state1_ignore_call3;
wire    ap_CS_fsm_state2;
reg    ap_block_state1;
reg   [255:0] x_preg;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
#0 grp_mod_exp_fu_39_ap_start_reg = 1'b0;
#0 x_preg = 256'd0;
end

rsa_mod_exp grp_mod_exp_fu_39(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_mod_exp_fu_39_ap_start),
    .ap_done(grp_mod_exp_fu_39_ap_done),
    .ap_idle(grp_mod_exp_fu_39_ap_idle),
    .ap_ready(grp_mod_exp_fu_39_ap_ready),
    .y(y),
    .d(d),
    .N(N),
    .ap_return(grp_mod_exp_fu_39_ap_return)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((grp_mod_exp_fu_39_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_mod_exp_fu_39_ap_start_reg <= 1'b0;
    end else begin
        if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_mod_exp_fu_39_ap_start_reg <= 1'b1;
        end else if ((grp_mod_exp_fu_39_ap_ready == 1'b1)) begin
            grp_mod_exp_fu_39_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        x_preg <= 256'd0;
    end else begin
        if (((grp_mod_exp_fu_39_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            x_preg <= grp_mod_exp_fu_39_ap_return;
        end
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_mod_exp_fu_39_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_mod_exp_fu_39_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((grp_mod_exp_fu_39_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((grp_mod_exp_fu_39_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        x = grp_mod_exp_fu_39_ap_return;
    end else begin
        x = x_preg;
    end
end

always @ (*) begin
    if (((grp_mod_exp_fu_39_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        x_ap_vld = 1'b1;
    end else begin
        x_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_mod_exp_fu_39_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state1_ignore_call3 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_mod_exp_fu_39_ap_start = grp_mod_exp_fu_39_ap_start_reg;

endmodule //rsa_Block_entry45_proc2
