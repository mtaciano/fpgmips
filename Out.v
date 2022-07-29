module Out(
    entrada,
    escrever,
    setseg1,
    setseg2,
    setseg3,
    setseg4
);

input [31:0] entrada;
input wire escrever;
integer i;

output reg [3:0] setseg1;
output reg [3:0] setseg2;
output reg [3:0] setseg3;
output reg [3:0] setseg4;

always @(entrada) begin
    setseg1 = 4'b0000;
    setseg2 = 4'b0000;
    setseg3 = 4'b0000;
    setseg4 = 4'b0000;

    if (escrever) begin
        for(i = 15; i >= 0; i = i - 1) begin
            if(setseg4 >= 5) begin
                setseg4 = setseg4 + 4'd3;
            end
            if(setseg3 >= 5) begin
                setseg3 = setseg3 + 4'd3;
            end
            if(setseg2 >= 5) begin
                setseg2 = setseg2 + 4'd3;
            end
            if(setseg1 >= 5) begin
                setseg1 = setseg1 + 4'd3;
            end
            setseg4 = setseg4 << 1;
            setseg4[0] = setseg3[3];
            setseg3 = setseg3 << 1;
            setseg3[0] = setseg2[3];
            setseg2 = setseg2 << 1;
            setseg2[0] = setseg1[3];
            setseg1 = setseg1 << 1;
            setseg1[0] = entrada[i];
        end
    end
end

endmodule
