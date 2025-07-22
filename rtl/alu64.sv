module alu64 (
    input  logic        clk,
    input  logic [63:0] op_a,
    input  logic [63:0] op_b,
    input  logic [4:0]  opcode,
    output logic [63:0] result,
    output logic        valid
);

    logic [63:0] int_result, fpu_result, vec_result, crypto_result;
    logic        int_valid, fpu_valid, vec_valid, crypto_valid;

    int_alu       u_int_alu      (.op_a(op_a), .op_b(op_b), .opcode(opcode), .result(int_result), .valid(int_valid));
    fpu           u_fpu          (.op_a(op_a), .op_b(op_b), .opcode(opcode), .result(fpu_result), .valid(fpu_valid));
    vector_unit   u_vector       (.op_a(op_a), .op_b(op_b), .opcode(opcode), .result(vec_result), .valid(vec_valid));
    crypto_accel  u_crypto       (.op_a(op_a), .op_b(op_b), .opcode(opcode), .result(crypto_result), .valid(crypto_valid));

    always_comb begin
        unique case (opcode[4:3])
            2'b00: begin result = int_result;    valid = int_valid;    end
            2'b01: begin result = fpu_result;    valid = fpu_valid;    end
            2'b10: begin result = vec_result;    valid = vec_valid;    end
            2'b11: begin result = crypto_result; valid = crypto_valid; end
        endcase
    end
