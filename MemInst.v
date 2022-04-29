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

        memoriaI[0] = 32'b00000000000000000000000000000000; // NOP
        memoriaI[1] = 32'b10010000010000000000000000001010; // LOAD 10 NO REG1
        memoriaI[2] = 32'b10010000100000000000000000000100; // LOAD 4 NO REG2
        memoriaI[3] = 32'b01011000110000100010000000000000; // ADD REG1 + REG2
        memoriaI[4] = 32'b01100000110001100000000000000010; // ADDI REG3 + 2
        memoriaI[5] = 32'b10100000000000000000000000001010; // JI para 10
        memoriaI[6] = 32'b00000000000000000000000000000000; // NOP
        memoriaI[7] = 32'b00000000000000000000000000000000; // NOP
        memoriaI[8] = 32'b00000000000000000000000000000000; // NOP
        memoriaI[9] = 32'b00000000000000000000000000000000; // NOP
        memoriaI[10] = 32'b01001000110001100000000000000010; // SR >> 2 (REG3/4)

        inicializado <= 1;
    end
end

assign saida = memoriaI[endereco];

endmodule
