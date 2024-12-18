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
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    y : IN STD_LOGIC_VECTOR (127 downto 0);
    d : IN STD_LOGIC_VECTOR (127 downto 0);
    N : IN STD_LOGIC_VECTOR (127 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (127 downto 0) );
end;


architecture behav of rsa_mod_exp is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (6 downto 0) := "0000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (6 downto 0) := "0000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (6 downto 0) := "0001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (6 downto 0) := "0100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv128_lc_2 : STD_LOGIC_VECTOR (127 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv8_80 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal reg_95 : STD_LOGIC_VECTOR (127 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal icmp_ln72_fu_124_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln1497_fu_136_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal i_10_fu_130_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_10_reg_213 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln1497_reg_218 : STD_LOGIC_VECTOR (0 downto 0);
    signal m_V_load_1_reg_222 : STD_LOGIC_VECTOR (127 downto 0);
    signal grp_Montgomery_fu_76_ap_return : STD_LOGIC_VECTOR (127 downto 0);
    signal m_V_4_reg_227 : STD_LOGIC_VECTOR (127 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ref_tmp5_reg_232 : STD_LOGIC_VECTOR (127 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal grp_mod_product_mont_fu_68_ap_start : STD_LOGIC;
    signal grp_mod_product_mont_fu_68_ap_done : STD_LOGIC;
    signal grp_mod_product_mont_fu_68_ap_idle : STD_LOGIC;
    signal grp_mod_product_mont_fu_68_ap_ready : STD_LOGIC;
    signal grp_mod_product_mont_fu_68_ap_return : STD_LOGIC_VECTOR (127 downto 0);
    signal grp_Montgomery_fu_76_ap_start : STD_LOGIC;
    signal grp_Montgomery_fu_76_ap_done : STD_LOGIC;
    signal grp_Montgomery_fu_76_ap_idle : STD_LOGIC;
    signal grp_Montgomery_fu_76_ap_ready : STD_LOGIC;
    signal grp_Montgomery_fu_76_a : STD_LOGIC_VECTOR (127 downto 0);
    signal grp_mod_product_mont_fu_68_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_Montgomery_fu_76_ap_start_reg : STD_LOGIC := '0';
    signal t_V_7_fu_34 : STD_LOGIC_VECTOR (127 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal i_04_fu_38 : STD_LOGIC_VECTOR (7 downto 0);
    signal empty_fu_42 : STD_LOGIC_VECTOR (127 downto 0);
    signal zext_ln1669_fu_158_p1 : STD_LOGIC_VECTOR (127 downto 0);
    signal m_V_fu_46 : STD_LOGIC_VECTOR (127 downto 0);
    signal r_V_fu_148_p4 : STD_LOGIC_VECTOR (126 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component rsa_mod_product_mont IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        b : IN STD_LOGIC_VECTOR (127 downto 0);
        N : IN STD_LOGIC_VECTOR (127 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (127 downto 0) );
    end component;


    component rsa_Montgomery IS
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
    end component;



begin
    grp_mod_product_mont_fu_68 : component rsa_mod_product_mont
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_mod_product_mont_fu_68_ap_start,
        ap_done => grp_mod_product_mont_fu_68_ap_done,
        ap_idle => grp_mod_product_mont_fu_68_ap_idle,
        ap_ready => grp_mod_product_mont_fu_68_ap_ready,
        b => y,
        N => N,
        ap_return => grp_mod_product_mont_fu_68_ap_return);

    grp_Montgomery_fu_76 : component rsa_Montgomery
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_Montgomery_fu_76_ap_start,
        ap_done => grp_Montgomery_fu_76_ap_done,
        ap_idle => grp_Montgomery_fu_76_ap_idle,
        ap_ready => grp_Montgomery_fu_76_ap_ready,
        N => N,
        a => grp_Montgomery_fu_76_a,
        b => reg_95,
        ap_return => grp_Montgomery_fu_76_ap_return);





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


    grp_Montgomery_fu_76_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_Montgomery_fu_76_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state5) or ((trunc_ln1497_fu_136_p1 = ap_const_lv1_1) and (icmp_ln72_fu_124_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
                    grp_Montgomery_fu_76_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_Montgomery_fu_76_ap_ready = ap_const_logic_1)) then 
                    grp_Montgomery_fu_76_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_mod_product_mont_fu_68_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_mod_product_mont_fu_68_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    grp_mod_product_mont_fu_68_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_mod_product_mont_fu_68_ap_ready = ap_const_logic_1)) then 
                    grp_mod_product_mont_fu_68_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    empty_fu_42_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                empty_fu_42 <= d;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                empty_fu_42 <= zext_ln1669_fu_158_p1;
            end if; 
        end if;
    end process;

    i_04_fu_38_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_04_fu_38 <= ap_const_lv8_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                i_04_fu_38 <= i_10_reg_213;
            end if; 
        end if;
    end process;

    m_V_fu_46_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                m_V_fu_46 <= ap_const_lv128_lc_2;
            elsif (((trunc_ln1497_reg_218 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                m_V_fu_46 <= m_V_4_reg_227;
            end if; 
        end if;
    end process;

    t_V_7_fu_34_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_mod_product_mont_fu_68_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                t_V_7_fu_34 <= grp_mod_product_mont_fu_68_ap_return;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                t_V_7_fu_34 <= ref_tmp5_reg_232;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                i_10_reg_213 <= i_10_fu_130_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                m_V_4_reg_227 <= grp_Montgomery_fu_76_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((trunc_ln1497_fu_136_p1 = ap_const_lv1_1) and (icmp_ln72_fu_124_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                m_V_load_1_reg_222 <= m_V_fu_46;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                ref_tmp5_reg_232 <= grp_Montgomery_fu_76_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state5) or ((trunc_ln1497_fu_136_p1 = ap_const_lv1_1) and (icmp_ln72_fu_124_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then
                reg_95 <= t_V_7_fu_34;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln72_fu_124_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                trunc_ln1497_reg_218 <= trunc_ln1497_fu_136_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state3, icmp_ln72_fu_124_p2, trunc_ln1497_fu_136_p1, ap_CS_fsm_state4, ap_CS_fsm_state6, grp_mod_product_mont_fu_68_ap_done, grp_Montgomery_fu_76_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_mod_product_mont_fu_68_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((icmp_ln72_fu_124_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((trunc_ln1497_fu_136_p1 = ap_const_lv1_0) and (icmp_ln72_fu_124_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                if (((grp_Montgomery_fu_76_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                if (((grp_Montgomery_fu_76_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when others =>  
                ap_NS_fsm <= "XXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_mod_product_mont_fu_68_ap_done)
    begin
        if ((grp_mod_product_mont_fu_68_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_Montgomery_fu_76_ap_done)
    begin
        if ((grp_Montgomery_fu_76_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_ST_fsm_state6_blk_assign_proc : process(grp_Montgomery_fu_76_ap_done)
    begin
        if ((grp_Montgomery_fu_76_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state7_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3, icmp_ln72_fu_124_p2)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)) or ((icmp_ln72_fu_124_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3, icmp_ln72_fu_124_p2)
    begin
        if (((icmp_ln72_fu_124_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= m_V_fu_46;

    grp_Montgomery_fu_76_a_assign_proc : process(reg_95, m_V_load_1_reg_222, ap_CS_fsm_state4, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            grp_Montgomery_fu_76_a <= reg_95;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_Montgomery_fu_76_a <= m_V_load_1_reg_222;
        else 
            grp_Montgomery_fu_76_a <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    grp_Montgomery_fu_76_ap_start <= grp_Montgomery_fu_76_ap_start_reg;
    grp_mod_product_mont_fu_68_ap_start <= grp_mod_product_mont_fu_68_ap_start_reg;
    i_10_fu_130_p2 <= std_logic_vector(unsigned(i_04_fu_38) + unsigned(ap_const_lv8_1));
    icmp_ln72_fu_124_p2 <= "1" when (i_04_fu_38 = ap_const_lv8_80) else "0";
    r_V_fu_148_p4 <= empty_fu_42(127 downto 1);
    trunc_ln1497_fu_136_p1 <= empty_fu_42(1 - 1 downto 0);
    zext_ln1669_fu_158_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_fu_148_p4),128));
end behav;
