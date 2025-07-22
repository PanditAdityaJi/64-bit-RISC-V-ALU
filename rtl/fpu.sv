module fpu (
    input  logic [63:0] op_a,
    input  logic [63:0] op_b,
    input  logic [4:0]  opcode,
    output logic [63:0] result,
    output logic        valid
);

    assign result = 64'd0;
    assign valid  = 1;
endmodule

module vector_unit (
    input  logic [63:0] op_a,
    input  logic [63:0] op_b,
    input  logic [4:0]  opcode,
    output logic [63:0] result,
    output logic        valid
);
    always_comb begin
        valid = 1;
        result = {op_a[63:48]+op_b[63:48], op_a[47:32]+op_b[47:32],
                  op_a[31:16]+op_b[31:16], op_a[15:0]+op_b[15:0]};
    end
