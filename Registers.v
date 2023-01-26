module Registers (
    clock,
    write_enable,
    address_l1,
    address_l2,
    address_e,
    data,
    output_rs,
    output_rd,
    output_rt
);

input wire clock;
input wire write_enable;
input wire [4:0] address_l1; // TODO: o que é 'l1'
input wire [4:0] address_l2; // TODO: o que é 'l2'
input wire [4:0] address_e; // TODO: o que é 'e'
input wire [31:0] data;

//output wire [31:0] output_rs;
//output wire [31:0] output_rd;
//output wire [31:0] output_rt;
output reg [31:0] output_rs;
output reg [31:0] output_rd;
output reg [31:0] output_rt;

reg [31:0] registers [31:0];

always @(posedge clock) begin
    if (write_enable) begin
        registers[address_e] <= data;
    end
end

always @(*) begin
    output_rd <= registers[address_e];
end

always @(address_l1) begin
    output_rs <= registers[address_l1];
end

always @(address_l2) begin
    output_rt <= registers[address_l2];
end

//assign output_rd = registers[address_e];
//assign output_rs = registers[address_l1];
//assign output_rt = registers[address_l2];

endmodule
