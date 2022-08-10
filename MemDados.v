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

reg [31:0] addr;
reg [31:0] memoriaD [(2**8 - 1):0];

always @(negedge clock) begin
    if (escrever) begin
        memoriaD[endereco] <= dados;
    end

    addr <= endereco;
end

assign saida = memoriaD[addr];

endmodule
