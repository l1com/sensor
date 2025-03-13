# aclk {FREQ_HZ 149998505 CLK_DOMAIN system_zynq_ultra_ps_e_0_0_pl_clk1 PHASE 0.000} aclk1 {FREQ_HZ 99999001 CLK_DOMAIN system_zynq_ultra_ps_e_0_0_pl_clk0 PHASE 0.000}
# Clock Domain: system_zynq_ultra_ps_e_0_0_pl_clk1
create_clock -name aclk -period 6.667 [get_ports aclk]
# Clock Domain: system_zynq_ultra_ps_e_0_0_pl_clk0
create_clock -name aclk1 -period 10.000 [get_ports aclk1]
# Generated clocks
