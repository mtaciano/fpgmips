module Extensor (
    selecao,
    entrada_1,
    entrada_2,
    entrada_in,
    saida
);

input [1:0] selecao;
input [16:0] entrada_1;
input [21:0] entrada_2;
input [17:0] entrada_in;

output reg [31:0] saida;

always @(*) begin
    case (selecao)
        2'b00: begin
            saida = { {15{entrada_1[16]}}, entrada_1};
        end
        2'b01: begin
            saida = { {10{entrada_2[21]}}, entrada_2};
        end
          2'b10: begin
            saida = { {14{entrada_in[17]}}, entrada_in};
        end
        default: saida = 32'b0;
    endcase
end

endmodule
