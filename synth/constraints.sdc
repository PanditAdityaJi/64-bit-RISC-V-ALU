create_clock -name clk -period 0.4 [get_ports clk] ;# 2.5GHz target

set_input_delay 0.05 -clock clk [get_ports {a b opcode rst}]
set_output_delay 0.05 -clock clk [get_ports {result flags ready}]

set_drive 0.15 [get_ports {a b opcode rst}]
set_load 0.1 [get_ports {result flags ready}]

set_max_fanout 8 [current_design]
