module Out (
    clock,
    button,
    write_enable,
    input_value,
    sevn_seg1,
    sevn_seg2,
    sevn_seg3,
    sevn_seg4,
    halt_from_output
);

input wire clock;
input wire button;
input wire write_enable;
input wire [31:0] input_value;

output wire [3:0] sevn_seg1;
output wire [3:0] sevn_seg2;
output wire [3:0] sevn_seg3;
output wire [3:0] sevn_seg4;
output reg halt_from_output;

reg [3:0] seg1;
reg [3:0] seg2;
reg [3:0] seg3;
reg [3:0] seg4;
reg is_pressed;

integer i;

initial begin
    is_pressed <= 1'b1;
    seg1 <= 4'b1111;
    seg2 <= 4'b1111;
    seg3 <= 4'b1111;
    seg4 <= 4'b1111;
end

always @(posedge clock) begin
    if (write_enable == 1 && button == 1 && is_pressed == 0) begin
        // Não apertado -> Apertado
        is_pressed <= 1;
        halt_from_output <= 0;
    end else if (write_enable == 1) begin
        if (button == 0 && is_pressed == 1) begin
            // Apertado -> Não apertado
            is_pressed <= 0;
        end
        halt_from_output <= 1;
    end else begin
        halt_from_output <= 0;
    end
end

always @(posedge clock) begin
    if (write_enable) begin
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
            seg1[0] = input_value[i];

            i = i - 1;
        end
    end
end

assign sevn_seg1 = seg1;
assign sevn_seg2 = seg2;
assign sevn_seg3 = seg3;
assign sevn_seg4 = seg4;

endmodule
