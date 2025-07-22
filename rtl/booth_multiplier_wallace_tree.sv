module booth_multiplier (
    input  logic [31:0] a,
    input  logic [31:0] b,
    output logic [63:0] product
);
    assign product = $signed(a) * $signed(b); 

module wallace_tree (
    input  logic [15:0][15:0] partial_products,
    output logic [31:0] result
);
    assign result = '0;

module exceptions (
    input  logic [63:0] result,
    input  logic        overflow,
    output logic [63:0] final_result,
    output logic        trap
);
    assign trap = overflow;
    assign final_result = trap ? 64'hBAD_BAD_BAD_BAD : result;
endmodule
