module PC
#(parameter ADDR_WIDTH=32)
(
    clock,
    halt,
    jump,
    reset,
    write_quantum,
    quantum,
    jump_address,
    output_address,
    program_ended
);

input wire clock;
input wire halt;
input wire jump;
input wire reset;
input wire write_quantum;
input wire [(ADDR_WIDTH - 1):0] quantum;
input wire [(ADDR_WIDTH - 1):0] jump_address;

output reg [(ADDR_WIDTH - 1):0] output_address;
output reg program_ended;

reg [(ADDR_WIDTH - 1):0] current_quantum;
reg [(ADDR_WIDTH - 1):0] max_quantum;

initial begin
    program_ended <= 1'b0;
    current_quantum <= 32'b0;
    max_quantum <= 32'b0;
    output_address <= 32'b0;
end

always @(posedge clock) begin
    if (write_quantum) begin
        max_quantum <= quantum;
    end
end

always @(posedge clock) begin
    if (reset == 1) begin
        program_ended <= 1'b1;
        current_quantum <= 32'b0;
        output_address <= 32'b0;
    end else if (halt == 1) begin
        program_ended <= 1'b1;
        current_quantum <= 32'b0;
        output_address <= 32'b0;
    end else if (max_quantum != 0 && current_quantum >= max_quantum) begin
        // Estouro de quantum, voltar pro sistema operacional
        program_ended <= 1'b0;
        current_quantum <= 32'b0;
        output_address <= 32'b0;
    end else if (jump == 1) begin
        program_ended <= 1'b0;
        // Apenas executar se não estiver no sistema operacional
        if (max_quantum != 0 && output_address >= 512) begin
            current_quantum <= current_quantum + 1;
        end else begin
            current_quantum <= 32'b0;
        end
        output_address <= jump_address;
    end else begin
        program_ended <= 1'b0;
        // Apenas executar se não estiver no sistema operacional
        if (max_quantum != 0 && output_address >= 512) begin
            current_quantum <= current_quantum + 1;
        end else begin
            current_quantum <= 32'b0;
        end
        output_address <= output_address + 1;
    end
end

endmodule
