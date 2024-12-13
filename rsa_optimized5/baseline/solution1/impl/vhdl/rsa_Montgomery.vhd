-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rsa_Montgomery is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    N : IN STD_LOGIC_VECTOR (127 downto 0);
    a : IN STD_LOGIC_VECTOR (127 downto 0);
    b : IN STD_LOGIC_VECTOR (127 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (127 downto 0) );
end;


architecture behav of rsa_Montgomery is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal grp_Montgomery_Pipeline_Montgomery_fu_34_ap_start : STD_LOGIC;
    signal grp_Montgomery_Pipeline_Montgomery_fu_34_ap_done : STD_LOGIC;
    signal grp_Montgomery_Pipeline_Montgomery_fu_34_ap_idle : STD_LOGIC;
    signal grp_Montgomery_Pipeline_Montgomery_fu_34_ap_ready : STD_LOGIC;
    signal grp_Montgomery_Pipeline_Montgomery_fu_34_m_V_7_0_out : STD_LOGIC_VECTOR (129 downto 0);
    signal grp_Montgomery_Pipeline_Montgomery_fu_34_m_V_7_0_out_ap_vld : STD_LOGIC;
    signal grp_Montgomery_Pipeline_Montgomery_fu_34_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal zext_ln1031_fu_48_p1 : STD_LOGIC_VECTOR (129 downto 0);
    signal trunc_ln186_fu_57_p1 : STD_LOGIC_VECTOR (127 downto 0);
    signal icmp_ln1031_fu_51_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sub_ln39_fu_61_p2 : STD_LOGIC_VECTOR (127 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component rsa_Montgomery_Pipeline_Montgomery IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        a : IN STD_LOGIC_VECTOR (127 downto 0);
        b : IN STD_LOGIC_VECTOR (127 downto 0);
        N : IN STD_LOGIC_VECTOR (127 downto 0);
        m_V_7_0_out : OUT STD_LOGIC_VECTOR (129 downto 0);
        m_V_7_0_out_ap_vld : OUT STD_LOGIC );
    end component;



begin
    grp_Montgomery_Pipeline_Montgomery_fu_34 : component rsa_Montgomery_Pipeline_Montgomery
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_Montgomery_Pipeline_Montgomery_fu_34_ap_start,
        ap_done => grp_Montgomery_Pipeline_Montgomery_fu_34_ap_done,
        ap_idle => grp_Montgomery_Pipeline_Montgomery_fu_34_ap_idle,
        ap_ready => grp_Montgomery_Pipeline_Montgomery_fu_34_ap_ready,
        a => a,
        b => b,
        N => N,
        m_V_7_0_out => grp_Montgomery_Pipeline_Montgomery_fu_34_m_V_7_0_out,
        m_V_7_0_out_ap_vld => grp_Montgomery_Pipeline_Montgomery_fu_34_m_V_7_0_out_ap_vld);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_Montgomery_Pipeline_Montgomery_fu_34_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_Montgomery_Pipeline_Montgomery_fu_34_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_Montgomery_Pipeline_Montgomery_fu_34_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_Montgomery_Pipeline_Montgomery_fu_34_ap_ready = ap_const_logic_1)) then 
                    grp_Montgomery_Pipeline_Montgomery_fu_34_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_Montgomery_Pipeline_Montgomery_fu_34_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_Montgomery_Pipeline_Montgomery_fu_34_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_Montgomery_Pipeline_Montgomery_fu_34_ap_done)
    begin
        if ((grp_Montgomery_Pipeline_Montgomery_fu_34_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= 
        trunc_ln186_fu_57_p1 when (icmp_ln1031_fu_51_p2(0) = '1') else 
        sub_ln39_fu_61_p2;
    grp_Montgomery_Pipeline_Montgomery_fu_34_ap_start <= grp_Montgomery_Pipeline_Montgomery_fu_34_ap_start_reg;
    icmp_ln1031_fu_51_p2 <= "1" when (unsigned(grp_Montgomery_Pipeline_Montgomery_fu_34_m_V_7_0_out) < unsigned(zext_ln1031_fu_48_p1)) else "0";
    sub_ln39_fu_61_p2 <= std_logic_vector(unsigned(trunc_ln186_fu_57_p1) - unsigned(N));
    trunc_ln186_fu_57_p1 <= grp_Montgomery_Pipeline_Montgomery_fu_34_m_V_7_0_out(128 - 1 downto 0);
    zext_ln1031_fu_48_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(N),130));
end behav;