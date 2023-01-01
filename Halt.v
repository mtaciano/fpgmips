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
    case (reseta)
        1'b1: haltTotal = halt1;
        1'b0: haltTotal = halt1 + halt2;
    endcase
end

assign haltOut = (haltTotal > 0) ? 1'b1 : 1'b0;

endmodule
