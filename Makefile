# Makefile for High-Performance 64-bit RISC-V ALU

TOP_MODULE = alu64
SYNTH_DIR = synth
SIM_DIR   = sim
RTL_DIR   = rtl
TECH_LIB  = $(SYNTH_DIR)/tech_libs/typical.db

# Compiler and simulation tools
VCS        = vcs
IVERILOG   = iverilog
VVP        = vvp
GTKWAVE    = gtkwave

# Simulation
sim:
	@echo "🔧 Running simulation..."
	$(IVERILOG) -g2012 -I $(RTL_DIR) -o alu64_tb.vvp $(SIM_DIR)/alu64_tb.sv $(RTL_DIR)/*.sv
	$(VVP) alu64_tb.vvp

wave:
	$(GTKWAVE) alu64_tb.vcd &

# Synthesis (Synopsys Design Compiler)
synth:
	@echo "⚙️  Running synthesis..."
	dc_shell -f $(SYNTH_DIR)/run_synth.tcl | tee synth.log

report:
	@echo "📄 Showing synthesis report..."
	cat reports/$(TOP_MODULE)_area.rpt
	cat reports/$(TOP_MODULE)_timing.rpt

clean:
	@echo "🧹 Cleaning build files..."
	rm -f *.vvp *.vcd *.fsdb *.log *.syn *.ddc *.mapped.v alu64_tb *.out *.db

zip:
	@echo "📦 Packaging project..."
	zip -r project.zip * .[^.]* -x \"*.vvp\" \"*.vcd\" \"*.log\" \"*.out\" \"*.zip\"

.PHONY: sim wave synth report clean zip
