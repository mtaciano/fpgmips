module Mux3 (
    selecao,
    entrada_1,
    entrada_2,
    entrada_3,
    saida
);

input [1:0] selecao;
input [31:0] entrada_1;
input [31:0] entrada_2;
input [31:0] entrada_3;

output reg [31:0] saida;

always @(*) begin
    case (selecao[1:0])
        2'b00: saida = entrada_1;
        2'b01: saida = entrada_2;
        2'b10: saida = entrada_3;
        default: saida = 32'b0;
    endcase
end

endmodule
