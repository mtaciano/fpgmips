module Halt(
    halt1,
    halt2,
    reseta,
    haltOut
);

input wire halt1;
input wire halt2;
input wire reseta;
integer haltTotal = 0;

output wire haltOut;

always @(*) begin
    if (reseta) begin
        haltTotal = halt1;
    end else begin
        haltTotal = halt1 + halt2;
    end
end

assign haltOut = (haltTotal > 0) ? 1'b1 : 1'b0;

endmodule
