module barrel_shifter (
    input  logic [63:0] in,
    input  logic [5:0]  shift_amt,
    input  logic        dir, // 0 = left, 1 = right
    output logic [63:0] out
);
    assign out = dir ? in >> shift_amt : in << shift_amt;
endmodule
