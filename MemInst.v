module MemInst (
    endereco,
    clock,
    saida
);

input [31:0] endereco;
input clock;

output reg [31:0] saida;

reg [31:0] memoriaI [(2**11 - 1):0];

initial begin
    $readmemb("sistema_operacional.txt", memoriaI, 0, 511);
    $readmemb("programa1.txt", memoriaI, 512, 1023);
    $readmemb("programa2.txt", memoriaI, 1024, 1535);
    $readmemb("programa3.txt", memoriaI, 1536, 2047);
end

always @(posedge clock) begin
    saida <= memoriaI[endereco];
end

endmodule
