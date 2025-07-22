module int_alu (
    input  logic [63:0] op_a,
    input  logic [63:0] op_b,
    input  logic [4:0]  opcode,
    output logic [63:0] result,
    output logic        valid
);
    always_comb begin
        valid = 1;
        unique case (opcode[2:0])
            3'b000: result = op_a + op_b;
            3'b001: result = op_a - op_b;
            3'b010: result = op_a & op_b;
            3'b011: result = op_a | op_b;
            3'b100: result = op_a ^ op_b;
            3'b101: result = op_a << op_b[5:0];
            3'b110: result = op_a >> op_b[5:0];
            default: result = 64'hDEAD_BEEF_DEAD_BEEF;
        endcase
    end
