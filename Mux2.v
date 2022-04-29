module Mux2 (
    selecao,
    entrada_1,
    entrada_2,
    saida
);

input selecao;
input [31:0] entrada_1;
input [31:0] entrada_2;

output reg [31:0] saida;

always @(*) begin
    case (selecao)
        1'b0: saida = entrada_1;
        1'b1: saida = entrada_2;
    endcase
end

endmodule
