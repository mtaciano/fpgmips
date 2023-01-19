module Mux3 (
    selecao,
    entrada1,
    entrada2,
    entrada3,
    saida
);

input [1:0] selecao;
input [31:0] entrada1;
input [31:0] entrada2;
input [31:0] entrada3;

output reg [31:0] saida;

always @(*) begin
    case (selecao[1:0])
        2'b00: saida = entrada1;
        2'b01: saida = entrada2;
        2'b10: saida = entrada3;
        default: saida = 32'b0;
    endcase
end

endmodule
