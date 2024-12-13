-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rsa_mont_update_m_a is
port (
    ap_ready : OUT STD_LOGIC;
    temp : IN STD_LOGIC_VECTOR (129 downto 0);
    a_V_read : IN STD_LOGIC_VECTOR (127 downto 0);
    ap_return_0 : OUT STD_LOGIC_VECTOR (129 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (127 downto 0) );
end;


architecture behav of rsa_mont_update_m_a is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_81 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010000001";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_logic_0 : STD_LOGIC := '0';

attribute shreg_extract : string;
    signal r_V_fu_32_p4 : STD_LOGIC_VECTOR (128 downto 0);
    signal r_V_3_fu_46_p4 : STD_LOGIC_VECTOR (126 downto 0);
    signal zext_ln1669_fu_42_p1 : STD_LOGIC_VECTOR (129 downto 0);
    signal zext_ln1669_1_fu_56_p1 : STD_LOGIC_VECTOR (127 downto 0);


begin



    ap_ready <= ap_const_logic_1;
    ap_return_0 <= zext_ln1669_fu_42_p1;
    ap_return_1 <= zext_ln1669_1_fu_56_p1;
    r_V_3_fu_46_p4 <= a_V_read(127 downto 1);
    r_V_fu_32_p4 <= temp(129 downto 1);
    zext_ln1669_1_fu_56_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_3_fu_46_p4),128));
    zext_ln1669_fu_42_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_fu_32_p4),130));
end behav;