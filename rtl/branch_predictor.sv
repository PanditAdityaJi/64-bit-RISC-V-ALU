module branch_predictor (
    input  logic        clk,
    input  logic        reset,
    input  logic        branch_taken,
    output logic        prediction
);
    logic history;
    always_ff @(posedge clk or posedge reset) begin
        if (reset) history <= 0;
        else       history <= branch_taken;
    end
    assign prediction = history;
endmodule
