module Display7Seg(
    in,
    a,
    b,
    c,
    d,
    e,
    f,
    g
);

input wire [3:0] in;
reg [6:0] segmentos;

output wire a, b, c, d, e, f, g;

always @(*) begin
    case (in)
        4'b0000: segmentos = 7'b0000001;
        4'b0001: segmentos = 7'b1001111;
        4'b0010: segmentos = 7'b0010010;
        4'b0011: segmentos = 7'b0000110;
        4'b0100: segmentos = 7'b1001100;
        4'b0101: segmentos = 7'b0100100;
        4'b0110: segmentos = 7'b0100000;
        4'b0111: segmentos = 7'b0001111;
        4'b1000: segmentos = 7'b0000000;
        4'b1001: segmentos = 7'b0000100;
        default: segmentos = 7'b1111111;
    endcase
end

assign {a, b, c, d, e, f, g} = segmentos;

endmodule
