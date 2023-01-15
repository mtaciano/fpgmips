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

output wire a, b, c, d, e, f, g;

reg [6:0] segmentos;

always @(*) begin
    case (in)
        4'b0000: segmentos = 7'b0000001; // 0
        4'b0001: segmentos = 7'b1001111; // 1
        4'b0010: segmentos = 7'b0010010; // 2
        4'b0011: segmentos = 7'b0000110; // 3
        4'b0100: segmentos = 7'b1001100; // 4
        4'b0101: segmentos = 7'b0100100; // 5
        4'b0110: segmentos = 7'b0100000; // 6
        4'b0111: segmentos = 7'b0001111; // 7
        4'b1000: segmentos = 7'b0000000; // 8
        4'b1001: segmentos = 7'b0000100; // 9
        default: segmentos = 7'b1111111; // OFF
    endcase
end

assign {a, b, c, d, e, f, g} = segmentos;

endmodule
