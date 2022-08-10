module Out(
    entrada,
    clock,
    escrever,
    setseg1,
    setseg2,
    setseg3,
    setseg4
);

input [31:0] entrada;
input wire clock;
input wire escrever;
integer i;

reg [3:0] seg1;
reg [3:0] seg2;
reg [3:0] seg3;
reg [3:0] seg4;

output [3:0] setseg1;
output [3:0] setseg2;
output [3:0] setseg3;
output [3:0] setseg4;

initial begin
    seg1 = 4'b1111;
    seg2 = 4'b1111;
    seg3 = 4'b1111;
    seg4 = 4'b1111;
end

always @(posedge clock) begin
    if (escrever) begin
	     seg1 = 4'b0000;
        seg2 = 4'b0000;
        seg3 = 4'b0000;
        seg4 = 4'b0000;

        i = 15;
        while (i >= 0) begin
            if(seg4 >= 5) begin
                seg4 = seg4 + 4'd3;
            end
            if(seg3 >= 5) begin
                seg3 = seg3 + 4'd3;
            end
            if(seg2 >= 5) begin
                seg2 = seg2 + 4'd3;
            end
            if(seg1 >= 5) begin
                seg1 = seg1 + 4'd3;
            end
            seg4 = seg4 << 1;
            seg4[0] = seg3[3];
            seg3 = seg3 << 1;
            seg3[0] = seg2[3];
            seg2 = seg2 << 1;
            seg2[0] = seg1[3];
            seg1 = seg1 << 1;
            seg1[0] = entrada[i];

            i = i - 1;
        end
    end
end

assign setseg1 = seg1;
assign setseg2 = seg2;
assign setseg3 = seg3;
assign setseg4 = seg4;

endmodule
