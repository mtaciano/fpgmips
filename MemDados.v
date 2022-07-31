module MemDados (
    dados,
    endereco,
    clock,
    escrever,
    saida
);

input [31:0] dados;
input [31:0] endereco;
input clock, escrever;

output [31:0] saida;

reg [31:0] memoriaD [255:0];

always @(posedge clock) begin
    if (escrever) begin
        memoriaD[endereco] = dados;
    end
end

assign saida = memoriaD[endereco];

endmodule
