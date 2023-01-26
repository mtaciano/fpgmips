module DataMemory
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(
    clock,
    write_enable,
    input_data,
    address,
    pc,
    program_ended,
    output_data,
    output_saved_pc
);

input wire clock;
input wire write_enable;
input wire [(DATA_WIDTH - 1):0] input_data;
input wire [(DATA_WIDTH - 1):0] address;
input wire [(DATA_WIDTH - 1):0] pc;
input wire program_ended;

output wire [(DATA_WIDTH - 1):0] output_data;
output wire [(DATA_WIDTH - 1):0] output_saved_pc;

reg [(DATA_WIDTH - 1):0] addr;

reg [(DATA_WIDTH - 1):0] memory [((2 ** ADDR_WIDTH) - 1):0];
reg [(DATA_WIDTH - 1):0] saved_pc;

always @(negedge clock) begin
    if (pc >= 512 || program_ended == 1) begin
        saved_pc <= pc;
    end
end

always @(negedge clock) begin
    if (write_enable) begin
        memory[address] <= input_data;
    end

    addr <= address;
end

assign output_data = memory[addr];
assign output_saved_pc = saved_pc;

endmodule
