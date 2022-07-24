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

        memoriaI[0] = 32'b10010_00001_0000000000000000000101; // LOADI 5 NO REG1
          memoriaI[1] = 32'b01110_00001_00001_00000000000001010; // SUBI REG4 - 10 (= -5)
          memoriaI[2] = 32'b01100_00001_00001_00000000000001010; // SUBI REG4 + 10 (= 5)
          memoriaI[3] = 32'b00001_000000000000000000000000000; // HLT

          // $readmemb("arquivo.txt", variavel);

          // teste

        inicializado <= 1;
    end
end

assign saida = memoriaI[endereco];

endmodule
