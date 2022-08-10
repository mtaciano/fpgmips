module In(
    switch,
    escreveInput,
    botao,
    haltIn,
    saida
);

input wire [17:0] switch;
input wire escreveInput;
input wire botao;

output reg haltIn;
output reg [17:0] saida;

always @(*) begin
    if (escreveInput == 1 && botao == 1) begin
        saida <= switch;
		  haltIn <= 0;
    end else if(escreveInput == 1 && botao == 0) begin
        saida <= 18'b0;
		  haltIn <= 1;
    end else begin
        saida <= 18'b0;
		  haltIn <= 0;
    end
end

endmodule
