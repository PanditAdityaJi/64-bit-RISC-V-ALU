SIM_TOOL="vcs"  # Change to iverilog if needed

if [ "$SIM_TOOL" == "vcs" ]; then
    vcs -full64 -sverilog -debug_all -f run_tb.f -o simv && ./simv
elif [ "$SIM_TOOL" == "iverilog" ]; then
    iverilog -g2012 -o alu64_tb.out -f run_tb.f && vvp alu64_tb.out
else
    echo "Unsupported SIM_TOOL"
    exit 1
fi

`timescale 1ns / 1ps

module alu64_tb;
  logic clk = 0;
  logic rst;
  logic [63:0] op_a, op_b, result;
  logic [3:0] opcode;
  logic valid;

  alu64 dut (
    .clk(clk),
    .rst(rst),
    .op_a(op_a),
    .op_b(op_b),
    .opcode(opcode),
    .valid(valid),
    .result(result)
  );

  always #0.2 clk = ~clk; // 2.5 GHz clock

  initial begin
    rst = 1;
    #1;
    rst = 0;
    op_a = 64'h0000_0000_0000_0005;
    op_b = 64'h0000_0000_0000_0003;
    opcode = 4'b0000; // ADD
    valid = 1;
    #1;
    $display("ADD: %h", result);

    opcode = 4'b0001; // SUB
    #1;
    $display("SUB: %h", result);

    $finish;
  end
endmodule

`timescale 1ns / 1ps

module fpu_tb;
  logic clk = 0;
  logic rst;
  logic [31:0] fop_a, fop_b, fresult;
  logic [2:0] fopcode;
  logic valid;

  fpu dut (
    .clk(clk),
    .rst(rst),
    .fop_a(fop_a),
    .fop_b(fop_b),
    .fopcode(fopcode),
    .valid(valid),
    .fresult(fresult)
  );

  always #0.2 clk = ~clk;

  initial begin
    rst = 1;
    #1;
    rst = 0;
    fop_a = 32'h40400000; // 3.0
    fop_b = 32'h40000000; // 2.0
    fopcode = 3'b000; // ADD
    valid = 1;
    #1;
    $display("FADD: %h", fresult);
    $finish;
  end
endmodule
