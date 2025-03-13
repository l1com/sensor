-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity canny_accel_AxiStream2Axi is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ldata1_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    ldata1_empty_n : IN STD_LOGIC;
    ldata1_read : OUT STD_LOGIC;
    m_axi_gmem2_AWVALID : OUT STD_LOGIC;
    m_axi_gmem2_AWREADY : IN STD_LOGIC;
    m_axi_gmem2_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem2_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem2_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_WVALID : OUT STD_LOGIC;
    m_axi_gmem2_WREADY : IN STD_LOGIC;
    m_axi_gmem2_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem2_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem2_WLAST : OUT STD_LOGIC;
    m_axi_gmem2_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_ARVALID : OUT STD_LOGIC;
    m_axi_gmem2_ARREADY : IN STD_LOGIC;
    m_axi_gmem2_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem2_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem2_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_RVALID : IN STD_LOGIC;
    m_axi_gmem2_RREADY : OUT STD_LOGIC;
    m_axi_gmem2_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem2_RLAST : IN STD_LOGIC;
    m_axi_gmem2_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_BVALID : IN STD_LOGIC;
    m_axi_gmem2_BREADY : OUT STD_LOGIC;
    m_axi_gmem2_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    dout_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    dout_empty_n : IN STD_LOGIC;
    dout_read : OUT STD_LOGIC;
    addrbound_V_read : IN STD_LOGIC_VECTOR (15 downto 0) );
end;


architecture behav of canny_accel_AxiStream2Axi is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ldata1_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal icmp_ln1379_reg_185 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem2_blk_n_AW : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal gmem2_blk_n_W : STD_LOGIC;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal icmp_ln1379_reg_185_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem2_blk_n_B : STD_LOGIC;
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal icmp_ln878_reg_165 : STD_LOGIC_VECTOR (0 downto 0);
    signal dout_blk_n : STD_LOGIC;
    signal i_V_reg_107 : STD_LOGIC_VECTOR (15 downto 0);
    signal icmp_ln878_fu_118_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln_reg_169 : STD_LOGIC_VECTOR (60 downto 0);
    signal i_V_2_fu_148_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state5_io : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln1379_fu_154_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_189 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal sext_ln1379_fu_134_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_state10 : BOOLEAN;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;


begin




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
                elsif ((not(((m_axi_gmem2_BVALID = ap_const_logic_0) and (icmp_ln878_reg_165 = ap_const_lv1_0))) and (ap_const_logic_1 = ap_CS_fsm_state10))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((m_axi_gmem2_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
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
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then
                    if ((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3)) then 
                        ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                    elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                        ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                    end if;
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
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                elsif (((m_axi_gmem2_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_V_reg_107_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln1379_fu_154_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                i_V_reg_107 <= i_V_2_fu_148_p2;
            elsif (((m_axi_gmem2_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i_V_reg_107 <= ap_const_lv16_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln1379_reg_185 <= icmp_ln1379_fu_154_p2;
                icmp_ln1379_reg_185_pp0_iter1_reg <= icmp_ln1379_reg_185;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                icmp_ln878_reg_165 <= icmp_ln878_fu_118_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln1379_reg_185 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_reg_189 <= ldata1_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (icmp_ln878_fu_118_p2 = ap_const_lv1_0))) then
                trunc_ln_reg_169 <= dout_dout(63 downto 3);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, m_axi_gmem2_AWREADY, m_axi_gmem2_BVALID, dout_empty_n, ap_enable_reg_pp0_iter1, ap_CS_fsm_state2, ap_enable_reg_pp0_iter2, ap_CS_fsm_state10, icmp_ln878_reg_165, icmp_ln878_fu_118_p2, ap_enable_reg_pp0_iter0, icmp_ln1379_fu_154_p2, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((dout_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1) and (icmp_ln878_fu_118_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                elsif ((not(((dout_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1) and (icmp_ln878_fu_118_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((m_axi_gmem2_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((icmp_ln1379_fu_154_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) and not(((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((((icmp_ln1379_fu_154_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0)))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                if ((not(((m_axi_gmem2_BVALID = ap_const_logic_0) and (icmp_ln878_reg_165 = ap_const_lv1_0))) and (ap_const_logic_1 = ap_CS_fsm_state10))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(7);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ldata1_empty_n, ap_enable_reg_pp0_iter1, icmp_ln1379_reg_185)
    begin
                ap_block_pp0_stage0_01001 <= ((ldata1_empty_n = ap_const_logic_0) and (icmp_ln1379_reg_185 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ldata1_empty_n, ap_enable_reg_pp0_iter1, icmp_ln1379_reg_185, ap_enable_reg_pp0_iter2, ap_block_state5_io)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_const_boolean_1 = ap_block_state5_io) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ldata1_empty_n = ap_const_logic_0) and (icmp_ln1379_reg_185 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ldata1_empty_n, ap_enable_reg_pp0_iter1, icmp_ln1379_reg_185, ap_enable_reg_pp0_iter2, ap_block_state5_io)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_const_boolean_1 = ap_block_state5_io) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ldata1_empty_n = ap_const_logic_0) and (icmp_ln1379_reg_185 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, dout_empty_n)
    begin
                ap_block_state1 <= ((dout_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_block_state10_assign_proc : process(m_axi_gmem2_BVALID, icmp_ln878_reg_165)
    begin
                ap_block_state10 <= ((m_axi_gmem2_BVALID = ap_const_logic_0) and (icmp_ln878_reg_165 = ap_const_lv1_0));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter1_assign_proc : process(ldata1_empty_n, icmp_ln1379_reg_185)
    begin
                ap_block_state4_pp0_stage0_iter1 <= ((ldata1_empty_n = ap_const_logic_0) and (icmp_ln1379_reg_185 = ap_const_lv1_0));
    end process;


    ap_block_state5_io_assign_proc : process(m_axi_gmem2_WREADY, icmp_ln1379_reg_185_pp0_iter1_reg)
    begin
                ap_block_state5_io <= ((m_axi_gmem2_WREADY = ap_const_logic_0) and (icmp_ln1379_reg_185_pp0_iter1_reg = ap_const_lv1_0));
    end process;

        ap_block_state5_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter0_state3_assign_proc : process(icmp_ln1379_fu_154_p2)
    begin
        if ((icmp_ln1379_fu_154_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, m_axi_gmem2_BVALID, ap_CS_fsm_state10, icmp_ln878_reg_165)
    begin
        if ((not(((m_axi_gmem2_BVALID = ap_const_logic_0) and (icmp_ln878_reg_165 = ap_const_lv1_0))) and (ap_const_logic_1 = ap_CS_fsm_state10))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(m_axi_gmem2_BVALID, ap_CS_fsm_state10, icmp_ln878_reg_165)
    begin
        if ((not(((m_axi_gmem2_BVALID = ap_const_logic_0) and (icmp_ln878_reg_165 = ap_const_lv1_0))) and (ap_const_logic_1 = ap_CS_fsm_state10))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    dout_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dout_empty_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dout_blk_n <= dout_empty_n;
        else 
            dout_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    dout_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dout_empty_n)
    begin
        if ((not(((dout_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dout_read <= ap_const_logic_1;
        else 
            dout_read <= ap_const_logic_0;
        end if; 
    end process;


    gmem2_blk_n_AW_assign_proc : process(m_axi_gmem2_AWREADY, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            gmem2_blk_n_AW <= m_axi_gmem2_AWREADY;
        else 
            gmem2_blk_n_AW <= ap_const_logic_1;
        end if; 
    end process;


    gmem2_blk_n_B_assign_proc : process(m_axi_gmem2_BVALID, ap_CS_fsm_state10, icmp_ln878_reg_165)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) and (icmp_ln878_reg_165 = ap_const_lv1_0))) then 
            gmem2_blk_n_B <= m_axi_gmem2_BVALID;
        else 
            gmem2_blk_n_B <= ap_const_logic_1;
        end if; 
    end process;


    gmem2_blk_n_W_assign_proc : process(m_axi_gmem2_WREADY, ap_block_pp0_stage0, ap_enable_reg_pp0_iter2, icmp_ln1379_reg_185_pp0_iter1_reg)
    begin
        if (((icmp_ln1379_reg_185_pp0_iter1_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            gmem2_blk_n_W <= m_axi_gmem2_WREADY;
        else 
            gmem2_blk_n_W <= ap_const_logic_1;
        end if; 
    end process;

    i_V_2_fu_148_p2 <= std_logic_vector(unsigned(i_V_reg_107) + unsigned(ap_const_lv16_1));
    icmp_ln1379_fu_154_p2 <= "1" when (i_V_reg_107 = addrbound_V_read) else "0";
    icmp_ln878_fu_118_p2 <= "1" when (addrbound_V_read = ap_const_lv16_0) else "0";

    ldata1_blk_n_assign_proc : process(ldata1_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln1379_reg_185)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln1379_reg_185 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
            ldata1_blk_n <= ldata1_empty_n;
        else 
            ldata1_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ldata1_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln1379_reg_185, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln1379_reg_185 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
            ldata1_read <= ap_const_logic_1;
        else 
            ldata1_read <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem2_ARADDR <= ap_const_lv64_0;
    m_axi_gmem2_ARBURST <= ap_const_lv2_0;
    m_axi_gmem2_ARCACHE <= ap_const_lv4_0;
    m_axi_gmem2_ARID <= ap_const_lv1_0;
    m_axi_gmem2_ARLEN <= ap_const_lv32_0;
    m_axi_gmem2_ARLOCK <= ap_const_lv2_0;
    m_axi_gmem2_ARPROT <= ap_const_lv3_0;
    m_axi_gmem2_ARQOS <= ap_const_lv4_0;
    m_axi_gmem2_ARREGION <= ap_const_lv4_0;
    m_axi_gmem2_ARSIZE <= ap_const_lv3_0;
    m_axi_gmem2_ARUSER <= ap_const_lv1_0;
    m_axi_gmem2_ARVALID <= ap_const_logic_0;
    m_axi_gmem2_AWADDR <= sext_ln1379_fu_134_p1;
    m_axi_gmem2_AWBURST <= ap_const_lv2_0;
    m_axi_gmem2_AWCACHE <= ap_const_lv4_0;
    m_axi_gmem2_AWID <= ap_const_lv1_0;
    m_axi_gmem2_AWLEN <= std_logic_vector(IEEE.numeric_std.resize(unsigned(addrbound_V_read),32));
    m_axi_gmem2_AWLOCK <= ap_const_lv2_0;
    m_axi_gmem2_AWPROT <= ap_const_lv3_0;
    m_axi_gmem2_AWQOS <= ap_const_lv4_0;
    m_axi_gmem2_AWREGION <= ap_const_lv4_0;
    m_axi_gmem2_AWSIZE <= ap_const_lv3_0;
    m_axi_gmem2_AWUSER <= ap_const_lv1_0;

    m_axi_gmem2_AWVALID_assign_proc : process(m_axi_gmem2_AWREADY, ap_CS_fsm_state2)
    begin
        if (((m_axi_gmem2_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_gmem2_AWVALID <= ap_const_logic_1;
        else 
            m_axi_gmem2_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_gmem2_BREADY_assign_proc : process(m_axi_gmem2_BVALID, ap_CS_fsm_state10, icmp_ln878_reg_165)
    begin
        if ((not(((m_axi_gmem2_BVALID = ap_const_logic_0) and (icmp_ln878_reg_165 = ap_const_lv1_0))) and (ap_const_logic_1 = ap_CS_fsm_state10) and (icmp_ln878_reg_165 = ap_const_lv1_0))) then 
            m_axi_gmem2_BREADY <= ap_const_logic_1;
        else 
            m_axi_gmem2_BREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem2_RREADY <= ap_const_logic_0;
    m_axi_gmem2_WDATA <= tmp_reg_189;
    m_axi_gmem2_WID <= ap_const_lv1_0;
    m_axi_gmem2_WLAST <= ap_const_logic_0;
    m_axi_gmem2_WSTRB <= ap_const_lv8_FF;
    m_axi_gmem2_WUSER <= ap_const_lv1_0;

    m_axi_gmem2_WVALID_assign_proc : process(ap_enable_reg_pp0_iter2, icmp_ln1379_reg_185_pp0_iter1_reg, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln1379_reg_185_pp0_iter1_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            m_axi_gmem2_WVALID <= ap_const_logic_1;
        else 
            m_axi_gmem2_WVALID <= ap_const_logic_0;
        end if; 
    end process;

        sext_ln1379_fu_134_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_reg_169),64));

end behav;
