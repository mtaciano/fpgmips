module Mux2 (
    selecao,
    entrada1,
    entrada2,
    saida
);

input selecao;
input [31:0] entrada1;
input [31:0] entrada2;

output reg [31:0] saida;

always @(*) begin
    case (selecao)
        1'b0: saida = entrada1;
        1'b1: saida = entrada2;
        default: saida = 32'b0;
    endcase
end

endmodule
