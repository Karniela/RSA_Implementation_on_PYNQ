-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rsa_mod_product is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    b : IN STD_LOGIC_VECTOR (255 downto 0);
    N : IN STD_LOGIC_VECTOR (255 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (255 downto 0) );
end;


architecture behav of rsa_mod_product is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv9_100 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv257_lc_1 : STD_LOGIC_VECTOR (256 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln59_fu_79_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal conv_i_fu_58_p1 : STD_LOGIC_VECTOR (257 downto 0);
    signal conv_i_reg_156 : STD_LOGIC_VECTOR (257 downto 0);
    signal zext_ln186_fu_62_p1 : STD_LOGIC_VECTOR (256 downto 0);
    signal zext_ln186_reg_161 : STD_LOGIC_VECTOR (256 downto 0);
    signal icmp_ln1035_fu_102_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1035_reg_169 : STD_LOGIC_VECTOR (0 downto 0);
    signal t_V_2_fu_107_p2 : STD_LOGIC_VECTOR (256 downto 0);
    signal t_V_2_reg_174 : STD_LOGIC_VECTOR (256 downto 0);
    signal rhs_fu_34 : STD_LOGIC_VECTOR (256 downto 0);
    signal t_V_3_fu_123_p3 : STD_LOGIC_VECTOR (256 downto 0);
    signal zext_ln186_1_fu_54_p1 : STD_LOGIC_VECTOR (256 downto 0);
    signal ap_sig_allocacmp_rhs_load_1 : STD_LOGIC_VECTOR (256 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_sig_allocacmp_rhs_load : STD_LOGIC_VECTOR (256 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal i_fu_38 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_4_fu_85_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ret_V_fu_94_p3 : STD_LOGIC_VECTOR (257 downto 0);
    signal grp_fu_113_p0 : STD_LOGIC_VECTOR (256 downto 0);
    signal grp_fu_113_p2 : STD_LOGIC_VECTOR (256 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component rsa_sub_257ns_257ns_257_2_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (256 downto 0);
        din1 : IN STD_LOGIC_VECTOR (256 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (256 downto 0) );
    end component;


    component rsa_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    sub_257ns_257ns_257_2_1_U1 : component rsa_sub_257ns_257ns_257_2_1
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 257,
        din1_WIDTH => 257,
        dout_WIDTH => 257)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_113_p0,
        din1 => zext_ln186_reg_161,
        ce => ap_const_logic_1,
        dout => grp_fu_113_p2);

    flow_control_loop_pipe_sequential_init_U : component rsa_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    i_fu_38_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_38 <= ap_const_lv9_0;
                elsif (((icmp_ln59_fu_79_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_38 <= i_4_fu_85_p2;
                end if;
            end if; 
        end if;
    end process;

    rhs_fu_34_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    rhs_fu_34 <= zext_ln186_1_fu_54_p1;
                elsif ((ap_enable_reg_pp0_iter2 = ap_const_logic_1)) then 
                    rhs_fu_34 <= t_V_3_fu_123_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    conv_i_reg_156(255 downto 0) <= conv_i_fu_58_p1(255 downto 0);
                    zext_ln186_reg_161(255 downto 0) <= zext_ln186_fu_62_p1(255 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln59_fu_79_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln1035_reg_169 <= icmp_ln1035_fu_102_p2;
                    t_V_2_reg_174(256 downto 1) <= t_V_2_fu_107_p2(256 downto 1);
            end if;
        end if;
    end process;
    conv_i_reg_156(257 downto 256) <= "00";
    zext_ln186_reg_161(256) <= '0';
    t_V_2_reg_174(0) <= '0';

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln59_fu_79_p2)
    begin
        if (((icmp_ln59_fu_79_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= ap_sig_allocacmp_rhs_load(256 - 1 downto 0);

    ap_sig_allocacmp_rhs_load_assign_proc : process(ap_enable_reg_pp0_iter2, rhs_fu_34, t_V_3_fu_123_p3, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            ap_sig_allocacmp_rhs_load <= t_V_3_fu_123_p3;
        else 
            ap_sig_allocacmp_rhs_load <= rhs_fu_34;
        end if; 
    end process;


    ap_sig_allocacmp_rhs_load_1_assign_proc : process(ap_enable_reg_pp0_iter2, rhs_fu_34, t_V_3_fu_123_p3, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            ap_sig_allocacmp_rhs_load_1 <= t_V_3_fu_123_p3;
        else 
            ap_sig_allocacmp_rhs_load_1 <= rhs_fu_34;
        end if; 
    end process;

    conv_i_fu_58_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(N),258));
    grp_fu_113_p0 <= std_logic_vector(shift_left(unsigned(ap_sig_allocacmp_rhs_load_1),to_integer(unsigned('0' & ap_const_lv257_lc_1(31-1 downto 0)))));
    i_4_fu_85_p2 <= std_logic_vector(unsigned(i_fu_38) + unsigned(ap_const_lv9_1));
    icmp_ln1035_fu_102_p2 <= "1" when (unsigned(ret_V_fu_94_p3) > unsigned(conv_i_reg_156)) else "0";
    icmp_ln59_fu_79_p2 <= "1" when (i_fu_38 = ap_const_lv9_100) else "0";
    ret_V_fu_94_p3 <= (ap_sig_allocacmp_rhs_load_1 & ap_const_lv1_0);
    t_V_2_fu_107_p2 <= std_logic_vector(shift_left(unsigned(ap_sig_allocacmp_rhs_load_1),to_integer(unsigned('0' & ap_const_lv257_lc_1(31-1 downto 0)))));
    t_V_3_fu_123_p3 <= 
        grp_fu_113_p2 when (icmp_ln1035_reg_169(0) = '1') else 
        t_V_2_reg_174;
    zext_ln186_1_fu_54_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(b),257));
    zext_ln186_fu_62_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(N),257));
end behav;
