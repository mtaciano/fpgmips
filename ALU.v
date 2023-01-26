module ALU (
    selection,
    x,
    y,
    is_negative,
    is_zero,
    output_result
);

input [2:0] selection;
input signed [31:0] x;
input signed [31:0] y;

output reg is_negative;
output reg is_zero;
output reg signed [31:0] output_result;

always @(*) begin
    case (selection)
        3'b000: output_result = x;
        3'b001: output_result = x + y;
        3'b010: output_result = x - y;
        // 3'b011: output_result = x & y;
        // 3'b100: output_result = x | y;
        3'b101: output_result = x * y;
        // 3'b110: output_result = x / y;
        // 3'b111: output_result = ~x;
        default: output_result = 32'b0;
    endcase

    if (output_result == 32'b0) begin
        is_zero = 1'b1;
    end else begin
        is_zero = 1'b0;
    end

    is_negative = output_result[31];
end

endmodule
