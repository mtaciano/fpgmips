module Registradores (
    endereco_L1,
    endereco_L2,
    endereco_E,
    dados,
    clock,
    escreve_R,
    resultado_RS,
    resultado_RD,
    resultado_RT
);

input [4:0] endereco_L1;
input [4:0] endereco_L2;
input [4:0] endereco_E;
input [31:0] dados;
input clock, escreve_R;

output [31:0] resultado_RS;
output [31:0] resultado_RD;
output [31:0] resultado_RT;

reg [31:0] registradores [31:0];

always @(posedge clock) begin
    if (escreve_R) begin
        registradores[endereco_E] <= dados;
    end
end

assign resultado_RD = registradores[endereco_E];
assign resultado_RS = registradores[endereco_L1];
assign resultado_RT = registradores[endereco_L2];

endmodule
