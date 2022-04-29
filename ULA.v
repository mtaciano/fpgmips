module ULA (
    selecao,
    var_X,
    var_Y,
    resultado,
    flag_N,
    flag_Z
);

input [2:0] selecao;
input [31:0] var_X, var_Y;

output reg [31:0] resultado;
output reg flag_N;
output reg flag_Z;

always @(selecao or var_X or var_Y) begin
    case (selecao[2:0])
        3'b000: resultado = var_X;
        3'b001: resultado = var_X + var_Y;
        3'b010: resultado = var_X - var_Y;
        3'b011: resultado = var_X & var_Y;
        3'b100: resultado = var_X | var_Y;
        3'b101: resultado = var_X << var_Y;
        3'b110: resultado = var_X >> var_Y;
        3'b111: resultado = ~var_X;
    endcase
	 
	 if (resultado == 0) begin
        flag_Z = 1;
    end else begin
        flag_Z = 0;
    end
	 
	 flag_N = resultado[31];
	 
end

endmodule
