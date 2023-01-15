module InstructionMemory
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=11)
(
    clock,
    address,
    output_instruction
);

input clock;
input [(DATA_WIDTH - 1):0] address;

output reg [(DATA_WIDTH - 1):0] output_instruction;

reg [(DATA_WIDTH - 1):0] memory [((2 ** ADDR_WIDTH) - 1):0];

initial begin
    $readmemb("sistema_operacional.txt", memory, 0, 511);
    $readmemb("programa1.txt", memory, 512, 1023);
    $readmemb("programa2.txt", memory, 1024, 1535);
    $readmemb("programa3.txt", memory, 1536, 2047);
end

always @(posedge clock) begin
    output_instruction <= memory[address];
end

endmodule
