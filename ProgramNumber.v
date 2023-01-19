module ProgramNumber (
    in,
    a,
    b,
    c,
    d,
    e,
    f,
    g
);

input wire [31:0] in;

output wire a, b, c, d, e, f, g;

reg [6:0] segmentos;

always @(in) begin
    if (in < 512) begin
        segmentos = 7'b0000001; // 0
    end else if (in < 1024) begin
        segmentos = 7'b1001111; // 1
    end else if (in < 1536) begin
        segmentos = 7'b0010010; // 2
    end else begin
        segmentos = 7'b0000110; // 3
    end
end

assign {a, b, c, d, e, f, g} = segmentos;

endmodule
