module Halt(
    halt1,
    halt2,
    haltOut
);

input wire halt1;
input wire halt2;

output wire haltOut;

reg [1:0] haltTotal;

initial begin
    haltTotal <= 2'b0;
end

always @(*) begin
    haltTotal = halt1 + halt2;
end

assign haltOut = (haltTotal > 2'b0) ? 1'b1 : 1'b0;

endmodule
