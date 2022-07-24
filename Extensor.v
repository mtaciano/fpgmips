module Extensor (
    selecao,
    entrada_1,
    entrada_2,
    saida
);

input [16:0] entrada_1;
input [21:0] entrada_2;
input selecao;

output reg [31:0] saida;

always @(*) begin
    case (selecao)
        1'b0: begin
            saida = { {15{entrada_1[16]}}, entrada_1};
        end
        1'b1: begin
            saida = { {10{entrada_2[21]}}, entrada_2};
        end
        default: saida = 32'b0;
    endcase
end

endmodule
