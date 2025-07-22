# Synopsys DC Setup for 7nm synthesis
set search_path [list ../rtl ./tech_libs]
set link_path [list ./tech_libs/typical.db]

# Read RTL
read_verilog ../rtl/alu64.sv
read_verilog ../rtl/fpu64.sv
read_verilog ../rtl/vector_unit.sv
read_verilog ../rtl/crypto_unit.sv
read_verilog ../rtl/booth_multiplier.sv
read_verilog ../rtl/wallace_tree.sv
read_verilog ../rtl/barrel_shifter.sv
read_verilog ../rtl/branch_predictor.sv

# Elaborate top-level design
current_design alu64
elaborate alu64
