-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rsa_mod_exp is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    y : IN STD_LOGIC_VECTOR (255 downto 0);
    d : IN STD_LOGIC_VECTOR (255 downto 0);
    N : IN STD_LOGIC_VECTOR (255 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (255 downto 0) );
end;


architecture behav of rsa_mod_exp is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv256_lc_2 : STD_LOGIC_VECTOR (255 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv9_100 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv32_FF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011111111";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal reg_85 : STD_LOGIC_VECTOR (255 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln42_fu_114_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln1497_fu_126_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_mod_product_fu_66_ap_done : STD_LOGIC;
    signal trunc_ln1497_reg_204 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_on_subcall_done : BOOLEAN;
    signal i_4_fu_120_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_4_reg_199 : STD_LOGIC_VECTOR (8 downto 0);
    signal m_V_load_1_reg_208 : STD_LOGIC_VECTOR (255 downto 0);
    signal grp_mod_product_fu_66_ap_start : STD_LOGIC;
    signal grp_mod_product_fu_66_ap_idle : STD_LOGIC;
    signal grp_mod_product_fu_66_ap_ready : STD_LOGIC;
    signal grp_mod_product_fu_66_a : STD_LOGIC_VECTOR (255 downto 0);
    signal grp_mod_product_fu_66_ap_return : STD_LOGIC_VECTOR (255 downto 0);
    signal grp_mod_product_fu_66_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal t_fu_32 : STD_LOGIC_VECTOR (255 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal i_fu_36 : STD_LOGIC_VECTOR (8 downto 0);
    signal shr_i4_fu_40 : STD_LOGIC_VECTOR (255 downto 0);
    signal zext_ln1669_fu_149_p1 : STD_LOGIC_VECTOR (255 downto 0);
    signal m_V_fu_44 : STD_LOGIC_VECTOR (255 downto 0);
    signal r_V_fu_139_p4 : STD_LOGIC_VECTOR (254 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component rsa_mod_product IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        a : IN STD_LOGIC_VECTOR (255 downto 0);
        b : IN STD_LOGIC_VECTOR (255 downto 0);
        N : IN STD_LOGIC_VECTOR (255 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (255 downto 0) );
    end component;



begin
    grp_mod_product_fu_66 : component rsa_mod_product
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_mod_product_fu_66_ap_start,
        ap_done => grp_mod_product_fu_66_ap_done,
        ap_idle => grp_mod_product_fu_66_ap_idle,
        ap_ready => grp_mod_product_fu_66_ap_ready,
        a => grp_mod_product_fu_66_a,
        b => reg_85,
        N => N,
        ap_return => grp_mod_product_fu_66_ap_return);





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


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((icmp_ln42_fu_114_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_mod_product_fu_66_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_mod_product_fu_66_ap_start_reg <= ap_const_logic_0;
            else
                if ((((ap_const_boolean_0 = ap_block_state3_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state3)) or ((trunc_ln1497_fu_126_p1 = ap_const_lv1_1) and (icmp_ln42_fu_114_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
                    grp_mod_product_fu_66_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_mod_product_fu_66_ap_ready = ap_const_logic_1)) then 
                    grp_mod_product_fu_66_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_fu_36_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_fu_36 <= ap_const_lv9_0;
            elsif (((ap_const_boolean_0 = ap_block_state3_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                i_fu_36 <= i_4_reg_199;
            end if; 
        end if;
    end process;

    m_V_fu_44_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                m_V_fu_44 <= ap_const_lv256_lc_2;
            elsif (((ap_const_boolean_0 = ap_block_state3_on_subcall_done) and (trunc_ln1497_reg_204 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                m_V_fu_44 <= grp_mod_product_fu_66_ap_return;
            end if; 
        end if;
    end process;

    shr_i4_fu_40_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                shr_i4_fu_40 <= d;
            elsif (((grp_mod_product_fu_66_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                shr_i4_fu_40 <= zext_ln1669_fu_149_p1;
            end if; 
        end if;
    end process;

    t_fu_32_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                t_fu_32 <= y;
            elsif (((grp_mod_product_fu_66_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                t_fu_32 <= grp_mod_product_fu_66_ap_return;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_4_reg_199 <= i_4_fu_120_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((trunc_ln1497_fu_126_p1 = ap_const_lv1_1) and (icmp_ln42_fu_114_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                m_V_load_1_reg_208 <= m_V_fu_44;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_boolean_0 = ap_block_state3_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state3)) or ((trunc_ln1497_fu_126_p1 = ap_const_lv1_1) and (icmp_ln42_fu_114_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then
                reg_85 <= t_fu_32;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln42_fu_114_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                trunc_ln1497_reg_204 <= trunc_ln1497_fu_126_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln42_fu_114_p2, ap_CS_fsm_state3, grp_mod_product_fu_66_ap_done, ap_block_state3_on_subcall_done, ap_CS_fsm_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln42_fu_114_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_boolean_0 = ap_block_state3_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if (((grp_mod_product_fu_66_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg)
    begin
        if (((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(ap_block_state3_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state3_on_subcall_done)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state4_blk_assign_proc : process(grp_mod_product_fu_66_ap_done)
    begin
        if ((grp_mod_product_fu_66_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state3_on_subcall_done_assign_proc : process(grp_mod_product_fu_66_ap_done, trunc_ln1497_reg_204)
    begin
                ap_block_state3_on_subcall_done <= ((trunc_ln1497_reg_204 = ap_const_lv1_1) and (grp_mod_product_fu_66_ap_done = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2, icmp_ln42_fu_114_p2)
    begin
        if (((icmp_ln42_fu_114_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
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


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln42_fu_114_p2)
    begin
        if (((icmp_ln42_fu_114_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= m_V_fu_44;

    grp_mod_product_fu_66_a_assign_proc : process(reg_85, ap_CS_fsm_state3, trunc_ln1497_reg_204, m_V_load_1_reg_208, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_mod_product_fu_66_a <= reg_85;
        elsif (((trunc_ln1497_reg_204 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            grp_mod_product_fu_66_a <= m_V_load_1_reg_208;
        else 
            grp_mod_product_fu_66_a <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    grp_mod_product_fu_66_ap_start <= grp_mod_product_fu_66_ap_start_reg;
    i_4_fu_120_p2 <= std_logic_vector(unsigned(i_fu_36) + unsigned(ap_const_lv9_1));
    icmp_ln42_fu_114_p2 <= "1" when (i_fu_36 = ap_const_lv9_100) else "0";
    r_V_fu_139_p4 <= shr_i4_fu_40(255 downto 1);
    trunc_ln1497_fu_126_p1 <= shr_i4_fu_40(1 - 1 downto 0);
    zext_ln1669_fu_149_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_fu_139_p4),256));
end behav;
