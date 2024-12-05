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
    a : IN STD_LOGIC_VECTOR (255 downto 0);
    b : IN STD_LOGIC_VECTOR (255 downto 0);
    N : IN STD_LOGIC_VECTOR (255 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (255 downto 0) );
end;


architecture behav of rsa_mod_product is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv257_lc_1 : STD_LOGIC_VECTOR (256 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv9_100 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv257_lc_2 : STD_LOGIC_VECTOR (256 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv32_FF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal conv_i167_fu_77_p1 : STD_LOGIC_VECTOR (257 downto 0);
    signal conv_i167_reg_274 : STD_LOGIC_VECTOR (257 downto 0);
    signal zext_ln1496_fu_81_p1 : STD_LOGIC_VECTOR (256 downto 0);
    signal zext_ln1496_reg_280 : STD_LOGIC_VECTOR (256 downto 0);
    signal lhs_load_1_reg_289 : STD_LOGIC_VECTOR (256 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln13_fu_108_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1035_fu_151_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1035_reg_308 : STD_LOGIC_VECTOR (0 downto 0);
    signal t_V_1_fu_156_p2 : STD_LOGIC_VECTOR (256 downto 0);
    signal t_V_1_reg_313 : STD_LOGIC_VECTOR (256 downto 0);
    signal grp_fu_131_p2 : STD_LOGIC_VECTOR (257 downto 0);
    signal ret_V_reg_319 : STD_LOGIC_VECTOR (257 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_fu_137_p2 : STD_LOGIC_VECTOR (256 downto 0);
    signal m_V_reg_324 : STD_LOGIC_VECTOR (256 downto 0);
    signal m_V_3_fu_216_p3 : STD_LOGIC_VECTOR (256 downto 0);
    signal m_V_3_reg_330 : STD_LOGIC_VECTOR (256 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal lhs_fu_36 : STD_LOGIC_VECTOR (256 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal lhs_1_fu_40 : STD_LOGIC_VECTOR (256 downto 0);
    signal t_V_2_fu_181_p3 : STD_LOGIC_VECTOR (256 downto 0);
    signal zext_ln186_fu_73_p1 : STD_LOGIC_VECTOR (256 downto 0);
    signal i_fu_44 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_2_fu_114_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal empty_fu_48 : STD_LOGIC_VECTOR (255 downto 0);
    signal zext_ln1669_fu_233_p1 : STD_LOGIC_VECTOR (255 downto 0);
    signal grp_fu_131_p0 : STD_LOGIC_VECTOR (257 downto 0);
    signal grp_fu_131_p1 : STD_LOGIC_VECTOR (257 downto 0);
    signal ret_V_1_fu_143_p3 : STD_LOGIC_VECTOR (257 downto 0);
    signal grp_fu_162_p0 : STD_LOGIC_VECTOR (256 downto 0);
    signal grp_fu_162_p2 : STD_LOGIC_VECTOR (256 downto 0);
    signal icmp_ln1031_fu_199_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln1497_fu_195_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln1031_fu_203_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_176_p2 : STD_LOGIC_VECTOR (256 downto 0);
    signal m_V_2_fu_209_p3 : STD_LOGIC_VECTOR (256 downto 0);
    signal r_V_fu_223_p4 : STD_LOGIC_VECTOR (254 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component rsa_add_258ns_258ns_258_2_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (257 downto 0);
        din1 : IN STD_LOGIC_VECTOR (257 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (257 downto 0) );
    end component;


    component rsa_add_257ns_257ns_257_2_1 IS
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



begin
    add_258ns_258ns_258_2_1_U1 : component rsa_add_258ns_258ns_258_2_1
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 258,
        din1_WIDTH => 258,
        dout_WIDTH => 258)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_131_p0,
        din1 => grp_fu_131_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_131_p2);

    add_257ns_257ns_257_2_1_U2 : component rsa_add_257ns_257ns_257_2_1
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 257,
        din1_WIDTH => 257,
        dout_WIDTH => 257)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => lhs_fu_36,
        din1 => lhs_1_fu_40,
        ce => ap_const_logic_1,
        dout => grp_fu_137_p2);

    sub_257ns_257ns_257_2_1_U3 : component rsa_sub_257ns_257ns_257_2_1
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 257,
        din1_WIDTH => 257,
        dout_WIDTH => 257)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_162_p0,
        din1 => zext_ln1496_reg_280,
        ce => ap_const_logic_1,
        dout => grp_fu_162_p2);

    sub_257ns_257ns_257_2_1_U4 : component rsa_sub_257ns_257ns_257_2_1
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 257,
        din1_WIDTH => 257,
        dout_WIDTH => 257)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_137_p2,
        din1 => zext_ln1496_reg_280,
        ce => ap_const_logic_1,
        dout => grp_fu_176_p2);





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


    empty_fu_48_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                empty_fu_48 <= a;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                empty_fu_48 <= zext_ln1669_fu_233_p1;
            end if; 
        end if;
    end process;

    i_fu_44_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_fu_44 <= ap_const_lv9_0;
            elsif (((icmp_ln13_fu_108_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i_fu_44 <= i_2_fu_114_p2;
            end if; 
        end if;
    end process;

    lhs_1_fu_40_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                lhs_1_fu_40 <= zext_ln186_fu_73_p1;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                lhs_1_fu_40 <= t_V_2_fu_181_p3;
            end if; 
        end if;
    end process;

    lhs_fu_36_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                lhs_fu_36 <= ap_const_lv257_lc_1;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                lhs_fu_36 <= m_V_3_reg_330;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                    conv_i167_reg_274(255 downto 0) <= conv_i167_fu_77_p1(255 downto 0);
                    zext_ln1496_reg_280(255 downto 0) <= zext_ln1496_fu_81_p1(255 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln13_fu_108_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                icmp_ln1035_reg_308 <= icmp_ln1035_fu_151_p2;
                lhs_load_1_reg_289 <= lhs_fu_36;
                    t_V_1_reg_313(256 downto 1) <= t_V_1_fu_156_p2(256 downto 1);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                m_V_3_reg_330 <= m_V_3_fu_216_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                m_V_reg_324 <= grp_fu_137_p2;
                ret_V_reg_319 <= grp_fu_131_p2;
            end if;
        end if;
    end process;
    conv_i167_reg_274(257 downto 256) <= "00";
    zext_ln1496_reg_280(256) <= '0';
    t_V_1_reg_313(0) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln13_fu_108_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln13_fu_108_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    and_ln1031_fu_203_p2 <= (trunc_ln1497_fu_195_p1 and icmp_ln1031_fu_199_p2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln13_fu_108_p2)
    begin
        if ((((icmp_ln13_fu_108_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln13_fu_108_p2)
    begin
        if (((icmp_ln13_fu_108_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= lhs_fu_36(256 - 1 downto 0);
    conv_i167_fu_77_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(N),258));
    grp_fu_131_p0 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lhs_fu_36),258));
    grp_fu_131_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lhs_1_fu_40),258));
    grp_fu_162_p0 <= std_logic_vector(shift_left(unsigned(lhs_1_fu_40),to_integer(unsigned('0' & ap_const_lv257_lc_2(31-1 downto 0)))));
    i_2_fu_114_p2 <= std_logic_vector(unsigned(i_fu_44) + unsigned(ap_const_lv9_1));
    icmp_ln1031_fu_199_p2 <= "1" when (unsigned(ret_V_reg_319) < unsigned(conv_i167_reg_274)) else "0";
    icmp_ln1035_fu_151_p2 <= "1" when (unsigned(ret_V_1_fu_143_p3) > unsigned(conv_i167_reg_274)) else "0";
    icmp_ln13_fu_108_p2 <= "1" when (i_fu_44 = ap_const_lv9_100) else "0";
    m_V_2_fu_209_p3 <= 
        m_V_reg_324 when (and_ln1031_fu_203_p2(0) = '1') else 
        grp_fu_176_p2;
    m_V_3_fu_216_p3 <= 
        m_V_2_fu_209_p3 when (trunc_ln1497_fu_195_p1(0) = '1') else 
        lhs_load_1_reg_289;
    r_V_fu_223_p4 <= empty_fu_48(255 downto 1);
    ret_V_1_fu_143_p3 <= (lhs_1_fu_40 & ap_const_lv1_0);
    t_V_1_fu_156_p2 <= std_logic_vector(shift_left(unsigned(lhs_1_fu_40),to_integer(unsigned('0' & ap_const_lv257_lc_2(31-1 downto 0)))));
    t_V_2_fu_181_p3 <= 
        grp_fu_162_p2 when (icmp_ln1035_reg_308(0) = '1') else 
        t_V_1_reg_313;
    trunc_ln1497_fu_195_p1 <= empty_fu_48(1 - 1 downto 0);
    zext_ln1496_fu_81_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(N),257));
    zext_ln1669_fu_233_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_fu_223_p4),256));
    zext_ln186_fu_73_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(b),257));
end behav;