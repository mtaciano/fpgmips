module MemInst (
    endereco,
    clock,
    saida
);

input [31:0] endereco;
input clock;
integer inicializado = 0;

output [31:0] saida;

reg [31:0] memoriaI [31:0];

always @(posedge clock) begin
    if (~inicializado) begin
        $readmemb("out_bin.txt", memoriaI);

        inicializado <= 1;
    end
end

assign saida = memoriaI[endereco];

endmodule
