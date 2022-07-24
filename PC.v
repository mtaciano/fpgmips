module PC (
    clock,
    jump,
    pcControl,
    reseta,
    endereco,
    saida,
    halt
);

input halt;
input clock;
input jump;
input pcControl;
input reseta;
input [31:0] endereco;

output reg [31:0] saida;
initial begin
    saida = 32'b0;
end

always @(posedge clock) begin
    if (reseta) begin
        saida = 32'b0;
    end else if (jump == 1) begin
        saida = endereco;
    end else if (halt == 1) begin
        saida = saida; // Continua rodando o HLT
    end else begin
        saida = saida + 1; // O PC nesse processador precisa adicionar apenas 1
    end
end

endmodule
