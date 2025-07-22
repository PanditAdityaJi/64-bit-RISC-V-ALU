source dc_setup.tcl
source constraints.sdc

compile_ultra -gate_clock

report_area > reports/area.rpt
report_timing > reports/timing.rpt
report_power > reports/power.rpt

write -format verilog -hierarchy -output netlist/alu64_synth.v
write_sdf -version 2.1 netlist/alu64.sdf
write_sdc constraints_out.sdc
