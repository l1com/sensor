-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity canny_accel_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    gradx_mat_42_dout : IN STD_LOGIC_VECTOR (127 downto 0);
    gradx_mat_42_empty_n : IN STD_LOGIC;
    gradx_mat_42_read : OUT STD_LOGIC;
    grady_mat_45_dout : IN STD_LOGIC_VECTOR (127 downto 0);
    grady_mat_45_empty_n : IN STD_LOGIC;
    grady_mat_45_read : OUT STD_LOGIC;
    gradx1_mat_43_din : OUT STD_LOGIC_VECTOR (127 downto 0);
    gradx1_mat_43_full_n : IN STD_LOGIC;
    gradx1_mat_43_write : OUT STD_LOGIC;
    gradx2_mat_44_din : OUT STD_LOGIC_VECTOR (127 downto 0);
    gradx2_mat_44_full_n : IN STD_LOGIC;
    gradx2_mat_44_write : OUT STD_LOGIC;
    grady1_mat_46_din : OUT STD_LOGIC_VECTOR (127 downto 0);
    grady1_mat_46_full_n : IN STD_LOGIC;
    grady1_mat_46_write : OUT STD_LOGIC;
    grady2_mat_47_din : OUT STD_LOGIC_VECTOR (127 downto 0);
    grady2_mat_47_full_n : IN STD_LOGIC;
    grady2_mat_47_write : OUT STD_LOGIC;
    img_height_dout : IN STD_LOGIC_VECTOR (9 downto 0);
    img_height_empty_n : IN STD_LOGIC;
    img_height_read : OUT STD_LOGIC;
    img_width_dout : IN STD_LOGIC_VECTOR (10 downto 0);
    img_width_empty_n : IN STD_LOGIC;
    img_width_read : OUT STD_LOGIC;
    img_height_out_din : OUT STD_LOGIC_VECTOR (9 downto 0);
    img_height_out_full_n : IN STD_LOGIC;
    img_height_out_write : OUT STD_LOGIC;
    img_height_out1_din : OUT STD_LOGIC_VECTOR (9 downto 0);
    img_height_out1_full_n : IN STD_LOGIC;
    img_height_out1_write : OUT STD_LOGIC;
    img_width_out_din : OUT STD_LOGIC_VECTOR (10 downto 0);
    img_width_out_full_n : IN STD_LOGIC;
    img_width_out_write : OUT STD_LOGIC );
end;


architecture behav of canny_accel_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal gradx_mat_42_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal icmp_ln75_reg_240 : STD_LOGIC_VECTOR (0 downto 0);
    signal grady_mat_45_blk_n : STD_LOGIC;
    signal gradx1_mat_43_blk_n : STD_LOGIC;
    signal gradx2_mat_44_blk_n : STD_LOGIC;
    signal grady1_mat_46_blk_n : STD_LOGIC;
    signal grady2_mat_47_blk_n : STD_LOGIC;
    signal img_height_blk_n : STD_LOGIC;
    signal img_width_blk_n : STD_LOGIC;
    signal img_height_out_blk_n : STD_LOGIC;
    signal img_height_out1_blk_n : STD_LOGIC;
    signal img_width_out_blk_n : STD_LOGIC;
    signal col_V_reg_173 : STD_LOGIC_VECTOR (7 downto 0);
    signal img_height_read_reg_216 : STD_LOGIC_VECTOR (9 downto 0);
    signal img_width_assign_cast_reg_221 : STD_LOGIC_VECTOR (7 downto 0);
    signal row_V_3_fu_194_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal row_V_3_reg_226 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln69_fu_200_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal col_V_9_fu_205_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln75_fu_211_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal row_V_reg_162 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
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
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln69_fu_200_p2 = ap_const_lv1_1))) then 
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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln69_fu_200_p2 = ap_const_lv1_0))) then 
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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln69_fu_200_p2 = ap_const_lv1_0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    col_V_reg_173_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln75_fu_211_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                col_V_reg_173 <= col_V_9_fu_205_p2;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln69_fu_200_p2 = ap_const_lv1_0))) then 
                col_V_reg_173 <= ap_const_lv8_0;
            end if; 
        end if;
    end process;

    row_V_reg_162_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                row_V_reg_162 <= row_V_3_reg_226;
            elsif ((not(((ap_start = ap_const_logic_0) or (img_width_out_full_n = ap_const_logic_0) or (img_height_out1_full_n = ap_const_logic_0) or (img_height_out_full_n = ap_const_logic_0) or (img_width_empty_n = ap_const_logic_0) or (img_height_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                row_V_reg_162 <= ap_const_lv10_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln75_reg_240 <= icmp_ln75_fu_211_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                img_height_read_reg_216 <= img_height_dout;
                img_width_assign_cast_reg_221 <= img_width_dout(10 downto 3);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                row_V_3_reg_226 <= row_V_3_fu_194_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, img_height_empty_n, img_width_empty_n, img_height_out_full_n, img_height_out1_full_n, img_width_out_full_n, ap_CS_fsm_state2, icmp_ln69_fu_200_p2, ap_enable_reg_pp0_iter0, icmp_ln75_fu_211_p2, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (img_width_out_full_n = ap_const_logic_0) or (img_height_out1_full_n = ap_const_logic_0) or (img_height_out_full_n = ap_const_logic_0) or (img_width_empty_n = ap_const_logic_0) or (img_height_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln69_fu_200_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln75_fu_211_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln75_fu_211_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state5 <= ap_CS_fsm(3);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(gradx_mat_42_empty_n, grady_mat_45_empty_n, gradx1_mat_43_full_n, gradx2_mat_44_full_n, grady1_mat_46_full_n, grady2_mat_47_full_n, ap_enable_reg_pp0_iter1, icmp_ln75_reg_240)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady2_mat_47_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady1_mat_46_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx2_mat_44_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx1_mat_43_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx_mat_42_empty_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady_mat_45_empty_n = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(gradx_mat_42_empty_n, grady_mat_45_empty_n, gradx1_mat_43_full_n, gradx2_mat_44_full_n, grady1_mat_46_full_n, grady2_mat_47_full_n, ap_enable_reg_pp0_iter1, icmp_ln75_reg_240)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady2_mat_47_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady1_mat_46_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx2_mat_44_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx1_mat_43_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx_mat_42_empty_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady_mat_45_empty_n = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(gradx_mat_42_empty_n, grady_mat_45_empty_n, gradx1_mat_43_full_n, gradx2_mat_44_full_n, grady1_mat_46_full_n, grady2_mat_47_full_n, ap_enable_reg_pp0_iter1, icmp_ln75_reg_240)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady2_mat_47_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady1_mat_46_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx2_mat_44_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx1_mat_43_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx_mat_42_empty_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady_mat_45_empty_n = ap_const_logic_0))));
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, img_height_empty_n, img_width_empty_n, img_height_out_full_n, img_height_out1_full_n, img_width_out_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (img_width_out_full_n = ap_const_logic_0) or (img_height_out1_full_n = ap_const_logic_0) or (img_height_out_full_n = ap_const_logic_0) or (img_width_empty_n = ap_const_logic_0) or (img_height_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter1_assign_proc : process(gradx_mat_42_empty_n, grady_mat_45_empty_n, gradx1_mat_43_full_n, gradx2_mat_44_full_n, grady1_mat_46_full_n, grady2_mat_47_full_n, icmp_ln75_reg_240)
    begin
                ap_block_state4_pp0_stage0_iter1 <= (((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady2_mat_47_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady1_mat_46_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx2_mat_44_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx1_mat_43_full_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (gradx_mat_42_empty_n = ap_const_logic_0)) or ((icmp_ln75_reg_240 = ap_const_lv1_0) and (grady_mat_45_empty_n = ap_const_logic_0)));
    end process;


    ap_condition_pp0_exit_iter0_state3_assign_proc : process(icmp_ln75_fu_211_p2)
    begin
        if ((icmp_ln75_fu_211_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2, icmp_ln69_fu_200_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln69_fu_200_p2 = ap_const_lv1_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln69_fu_200_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln69_fu_200_p2 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    col_V_9_fu_205_p2 <= std_logic_vector(unsigned(col_V_reg_173) + unsigned(ap_const_lv8_1));

    gradx1_mat_43_blk_n_assign_proc : process(gradx1_mat_43_full_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln75_reg_240)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            gradx1_mat_43_blk_n <= gradx1_mat_43_full_n;
        else 
            gradx1_mat_43_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    gradx1_mat_43_din <= gradx_mat_42_dout;

    gradx1_mat_43_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln75_reg_240, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            gradx1_mat_43_write <= ap_const_logic_1;
        else 
            gradx1_mat_43_write <= ap_const_logic_0;
        end if; 
    end process;


    gradx2_mat_44_blk_n_assign_proc : process(gradx2_mat_44_full_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln75_reg_240)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            gradx2_mat_44_blk_n <= gradx2_mat_44_full_n;
        else 
            gradx2_mat_44_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    gradx2_mat_44_din <= gradx_mat_42_dout;

    gradx2_mat_44_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln75_reg_240, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            gradx2_mat_44_write <= ap_const_logic_1;
        else 
            gradx2_mat_44_write <= ap_const_logic_0;
        end if; 
    end process;


    gradx_mat_42_blk_n_assign_proc : process(gradx_mat_42_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln75_reg_240)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            gradx_mat_42_blk_n <= gradx_mat_42_empty_n;
        else 
            gradx_mat_42_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    gradx_mat_42_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln75_reg_240, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            gradx_mat_42_read <= ap_const_logic_1;
        else 
            gradx_mat_42_read <= ap_const_logic_0;
        end if; 
    end process;


    grady1_mat_46_blk_n_assign_proc : process(grady1_mat_46_full_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln75_reg_240)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grady1_mat_46_blk_n <= grady1_mat_46_full_n;
        else 
            grady1_mat_46_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    grady1_mat_46_din <= grady_mat_45_dout;

    grady1_mat_46_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln75_reg_240, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grady1_mat_46_write <= ap_const_logic_1;
        else 
            grady1_mat_46_write <= ap_const_logic_0;
        end if; 
    end process;


    grady2_mat_47_blk_n_assign_proc : process(grady2_mat_47_full_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln75_reg_240)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grady2_mat_47_blk_n <= grady2_mat_47_full_n;
        else 
            grady2_mat_47_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    grady2_mat_47_din <= grady_mat_45_dout;

    grady2_mat_47_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln75_reg_240, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grady2_mat_47_write <= ap_const_logic_1;
        else 
            grady2_mat_47_write <= ap_const_logic_0;
        end if; 
    end process;


    grady_mat_45_blk_n_assign_proc : process(grady_mat_45_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln75_reg_240)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grady_mat_45_blk_n <= grady_mat_45_empty_n;
        else 
            grady_mat_45_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    grady_mat_45_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln75_reg_240, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln75_reg_240 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grady_mat_45_read <= ap_const_logic_1;
        else 
            grady_mat_45_read <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln69_fu_200_p2 <= "1" when (row_V_reg_162 = img_height_read_reg_216) else "0";
    icmp_ln75_fu_211_p2 <= "1" when (col_V_reg_173 = img_width_assign_cast_reg_221) else "0";

    img_height_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_height_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_height_blk_n <= img_height_empty_n;
        else 
            img_height_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    img_height_out1_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_height_out1_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_height_out1_blk_n <= img_height_out1_full_n;
        else 
            img_height_out1_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    img_height_out1_din <= img_height_dout;

    img_height_out1_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_height_empty_n, img_width_empty_n, img_height_out_full_n, img_height_out1_full_n, img_width_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_width_out_full_n = ap_const_logic_0) or (img_height_out1_full_n = ap_const_logic_0) or (img_height_out_full_n = ap_const_logic_0) or (img_width_empty_n = ap_const_logic_0) or (img_height_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_height_out1_write <= ap_const_logic_1;
        else 
            img_height_out1_write <= ap_const_logic_0;
        end if; 
    end process;


    img_height_out_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_height_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_height_out_blk_n <= img_height_out_full_n;
        else 
            img_height_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    img_height_out_din <= img_height_dout;

    img_height_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_height_empty_n, img_width_empty_n, img_height_out_full_n, img_height_out1_full_n, img_width_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_width_out_full_n = ap_const_logic_0) or (img_height_out1_full_n = ap_const_logic_0) or (img_height_out_full_n = ap_const_logic_0) or (img_width_empty_n = ap_const_logic_0) or (img_height_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_height_out_write <= ap_const_logic_1;
        else 
            img_height_out_write <= ap_const_logic_0;
        end if; 
    end process;


    img_height_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_height_empty_n, img_width_empty_n, img_height_out_full_n, img_height_out1_full_n, img_width_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_width_out_full_n = ap_const_logic_0) or (img_height_out1_full_n = ap_const_logic_0) or (img_height_out_full_n = ap_const_logic_0) or (img_width_empty_n = ap_const_logic_0) or (img_height_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_height_read <= ap_const_logic_1;
        else 
            img_height_read <= ap_const_logic_0;
        end if; 
    end process;


    img_width_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_width_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_width_blk_n <= img_width_empty_n;
        else 
            img_width_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    img_width_out_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_width_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_width_out_blk_n <= img_width_out_full_n;
        else 
            img_width_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    img_width_out_din <= img_width_dout;

    img_width_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_height_empty_n, img_width_empty_n, img_height_out_full_n, img_height_out1_full_n, img_width_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_width_out_full_n = ap_const_logic_0) or (img_height_out1_full_n = ap_const_logic_0) or (img_height_out_full_n = ap_const_logic_0) or (img_width_empty_n = ap_const_logic_0) or (img_height_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_width_out_write <= ap_const_logic_1;
        else 
            img_width_out_write <= ap_const_logic_0;
        end if; 
    end process;


    img_width_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, img_height_empty_n, img_width_empty_n, img_height_out_full_n, img_height_out1_full_n, img_width_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_width_out_full_n = ap_const_logic_0) or (img_height_out1_full_n = ap_const_logic_0) or (img_height_out_full_n = ap_const_logic_0) or (img_width_empty_n = ap_const_logic_0) or (img_height_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_width_read <= ap_const_logic_1;
        else 
            img_width_read <= ap_const_logic_0;
        end if; 
    end process;

    row_V_3_fu_194_p2 <= std_logic_vector(unsigned(row_V_reg_162) + unsigned(ap_const_lv10_1));
end behav;
