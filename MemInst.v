module MemInst (
    endereco,
    clock,
    saida
);

input [31:0] endereco;
input clock;

output reg [31:0] saida;

reg [31:0] memoriaI [(2**9 - 1):0];

initial begin
    $readmemb("out_bin.txt", memoriaI);
end

always @(posedge clock) begin
    saida <= memoriaI[endereco];
end

endmodule
