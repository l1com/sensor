# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\FPGA\MPSoC-P4\ov5640\thr_hls_compact_1280_800\vitis\system_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\FPGA\MPSoC-P4\ov5640\thr_hls_compact_1280_800\vitis\system_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {system_wrapper}\
-hw {D:\FPGA\MPSoC-P4\ov5640\thr_hls_compact_1280_800\vitis\system_wrapper.xsa}\
-arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {D:/FPGA/MPSoC-P4/ov5640/thr_hls_compact_1280_800/vitis}

platform write
domain create -name {standalone_psu_cortexa53_0} -display-name {standalone_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {empty_application}
platform generate -domains 
platform active {system_wrapper}
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {standalone_psu_cortexa53_0}
platform generate -quick
bsp reload
bsp setlib -name xilffs -ver 4.4
bsp config use_lfn "1"
bsp write
bsp reload
catch {bsp regenerate}
platform generate
platform active {system_wrapper}
platform config -updatehw {D:/FPGA/MPSoC-P4/ov5640/thr_hls_compact_1280_800/vitis/system_wrapper.xsa}
bsp reload
platform clean
platform config -updatehw {D:/FPGA/MPSoC-P4/ov5640/thr_hls_compact_1280_800/vitis/system_wrapper.xsa}
platform clean
bsp reload
catch {bsp regenerate}
catch {bsp regenerate}
platform clean
platform clean
platform clean
platform clean
platform clean
platform generate
platform generate
platform generate
platform clean
platform generate
