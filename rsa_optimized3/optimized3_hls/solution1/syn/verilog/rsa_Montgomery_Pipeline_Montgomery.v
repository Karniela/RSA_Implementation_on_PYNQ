// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rsa_Montgomery_Pipeline_Montgomery (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a,
        b_cast,
        zext_ln1495,
        zext_ln1495_1,
        add_ln186,
        m_V_out,
        m_V_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [255:0] a;
input  [0:0] b_cast;
input  [255:0] zext_ln1495;
input  [255:0] zext_ln1495_1;
input  [256:0] add_ln186;
output  [256:0] m_V_out;
output   m_V_out_ap_vld;

reg ap_idle;
reg m_V_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln22_fu_133_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [256:0] zext_ln1495_1_cast_fu_107_p1;
reg   [256:0] zext_ln1495_1_cast_reg_325;
wire   [257:0] zext_ln1495_cast_fu_111_p1;
reg   [257:0] zext_ln1495_cast_reg_330;
reg   [256:0] m_V_load_reg_338;
wire   [257:0] zext_ln22_fu_151_p1;
wire   [0:0] trunc_ln22_fu_155_p1;
reg   [0:0] trunc_ln22_reg_349;
wire   [0:0] or_ln30_fu_207_p2;
reg   [0:0] or_ln30_reg_359;
reg   [256:0] m_V_fu_58;
wire   [256:0] select_ln30_2_fu_277_p3;
reg   [256:0] ap_sig_allocacmp_m_V_load;
wire    ap_block_pp0_stage0;
wire    ap_loop_init;
reg   [8:0] i_02_fu_62;
wire   [8:0] i_5_fu_139_p2;
reg   [255:0] empty_fu_66;
wire   [255:0] zext_ln1669_1_fu_223_p1;
wire    ap_block_pp0_stage0_01001;
wire   [0:0] trunc_ln1497_fu_159_p1;
wire   [0:0] xor_ln541_fu_163_p2;
wire   [0:0] xor_ln901_fu_168_p2;
wire   [0:0] and_ln30_1_fu_185_p2;
wire   [256:0] select_ln30_fu_191_p3;
wire   [257:0] grp_fu_201_p1;
wire   [0:0] and_ln30_fu_179_p2;
wire   [254:0] r_V_fu_213_p4;
wire   [255:0] tmp_fu_237_p4;
wire   [257:0] grp_fu_201_p2;
wire   [257:0] grp_fu_174_p2;
wire   [256:0] tmp_2_fu_260_p4;
wire   [256:0] zext_ln1669_fu_246_p1;
wire   [256:0] tmp_1_fu_250_p4;
wire   [256:0] select_ln30_1_fu_270_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

rsa_add_258ns_258ns_258_2_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 258 ),
    .din1_WIDTH( 258 ),
    .dout_WIDTH( 258 ))
add_258ns_258ns_258_2_1_U5(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(zext_ln22_fu_151_p1),
    .din1(zext_ln1495_cast_reg_330),
    .ce(1'b1),
    .dout(grp_fu_174_p2)
);

rsa_add_258ns_258ns_258_2_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 258 ),
    .din1_WIDTH( 258 ),
    .dout_WIDTH( 258 ))
add_258ns_258ns_258_2_1_U6(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(zext_ln22_fu_151_p1),
    .din1(grp_fu_201_p1),
    .ce(1'b1),
    .dout(grp_fu_201_p2)
);

rsa_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            empty_fu_66 <= a;
        end else if (((icmp_ln22_fu_133_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            empty_fu_66 <= zext_ln1669_1_fu_223_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_02_fu_62 <= 9'd0;
        end else if (((icmp_ln22_fu_133_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_02_fu_62 <= i_5_fu_139_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            m_V_fu_58 <= 257'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            m_V_fu_58 <= select_ln30_2_fu_277_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln22_fu_133_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        m_V_load_reg_338 <= ap_sig_allocacmp_m_V_load;
        or_ln30_reg_359 <= or_ln30_fu_207_p2;
        trunc_ln22_reg_349 <= trunc_ln22_fu_155_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        zext_ln1495_1_cast_reg_325[255 : 0] <= zext_ln1495_1_cast_fu_107_p1[255 : 0];
        zext_ln1495_cast_reg_330[255 : 0] <= zext_ln1495_cast_fu_111_p1[255 : 0];
    end
end

always @ (*) begin
    if (((icmp_ln22_fu_133_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_m_V_load = select_ln30_2_fu_277_p3;
    end else begin
        ap_sig_allocacmp_m_V_load = m_V_fu_58;
    end
end

always @ (*) begin
    if (((icmp_ln22_fu_133_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        m_V_out_ap_vld = 1'b1;
    end else begin
        m_V_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln30_1_fu_185_p2 = (xor_ln901_fu_168_p2 & trunc_ln1497_fu_159_p1);

assign and_ln30_fu_179_p2 = (xor_ln541_fu_163_p2 & trunc_ln22_fu_155_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign grp_fu_201_p1 = select_ln30_fu_191_p3;

assign i_5_fu_139_p2 = (i_02_fu_62 + 9'd1);

assign icmp_ln22_fu_133_p2 = ((i_02_fu_62 == 9'd256) ? 1'b1 : 1'b0);

assign m_V_out = m_V_fu_58;

assign or_ln30_fu_207_p2 = (and_ln30_fu_179_p2 | and_ln30_1_fu_185_p2);

assign r_V_fu_213_p4 = {{empty_fu_66[255:1]}};

assign select_ln30_1_fu_270_p3 = ((trunc_ln22_reg_349[0:0] == 1'b1) ? tmp_2_fu_260_p4 : zext_ln1669_fu_246_p1);

assign select_ln30_2_fu_277_p3 = ((or_ln30_reg_359[0:0] == 1'b1) ? tmp_1_fu_250_p4 : select_ln30_1_fu_270_p3);

assign select_ln30_fu_191_p3 = ((and_ln30_1_fu_185_p2[0:0] == 1'b1) ? zext_ln1495_1_cast_reg_325 : add_ln186);

assign tmp_1_fu_250_p4 = {{grp_fu_201_p2[257:1]}};

assign tmp_2_fu_260_p4 = {{grp_fu_174_p2[257:1]}};

assign tmp_fu_237_p4 = {{m_V_load_reg_338[256:1]}};

assign trunc_ln1497_fu_159_p1 = ap_sig_allocacmp_m_V_load[0:0];

assign trunc_ln22_fu_155_p1 = empty_fu_66[0:0];

assign xor_ln541_fu_163_p2 = (trunc_ln1497_fu_159_p1 ^ b_cast);

assign xor_ln901_fu_168_p2 = (trunc_ln22_fu_155_p1 ^ 1'd1);

assign zext_ln1495_1_cast_fu_107_p1 = zext_ln1495_1;

assign zext_ln1495_cast_fu_111_p1 = zext_ln1495;

assign zext_ln1669_1_fu_223_p1 = r_V_fu_213_p4;

assign zext_ln1669_fu_246_p1 = tmp_fu_237_p4;

assign zext_ln22_fu_151_p1 = ap_sig_allocacmp_m_V_load;

always @ (posedge ap_clk) begin
    zext_ln1495_1_cast_reg_325[256] <= 1'b0;
    zext_ln1495_cast_reg_330[257:256] <= 2'b00;
end

endmodule //rsa_Montgomery_Pipeline_Montgomery
