# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\FPGA\MPSoC-P4\ov5640\thr_hls_compact_1280_800\vitis\thr_hls_com_1018_system\_ide\scripts\debugger_thr_hls_com_1018-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\FPGA\MPSoC-P4\ov5640\thr_hls_compact_1280_800\vitis\thr_hls_com_1018_system\_ide\scripts\debugger_thr_hls_com_1018-default.tcl
# 
connect -url tcp:127.0.0.1:3121
source D:/Xilinx/Vitis/2020.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS1 210512180081" && level==0 && jtag_device_ctx=="jsn-JTAG-HS1-210512180081-14711093-0"}
fpga -file D:/FPGA/MPSoC-P4/ov5640/thr_hls_compact_1280_800/vitis/thr_hls_com_1018/_ide/bitstream/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/FPGA/MPSoC-P4/ov5640/thr_hls_compact_1280_800/vitis/system_wrapper/export/system_wrapper/hw/system_wrapper.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow D:/FPGA/MPSoC-P4/ov5640/thr_hls_compact_1280_800/vitis/system_wrapper/export/system_wrapper/sw/system_wrapper/boot/fsbl.elf
set bp_50_2_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_50_2_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow D:/FPGA/MPSoC-P4/ov5640/thr_hls_compact_1280_800/vitis/thr_hls_com_1018/Debug/thr_hls_com_1018.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
