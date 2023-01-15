module Input (
    clock,
    button,
    output_enable,
    switches,
    halt_from_input,
    output_value
);

input wire clock;
input wire button;
input wire output_enable;
input wire [17:0] switches;

output reg halt_from_input;
output reg [17:0] output_value;

reg is_pressed;

initial begin
    is_pressed <= 1'b0;
end

always @(posedge clock) begin
    if (output_enable == 1 && button == 1 && is_pressed == 0) begin
        // Não apertado -> Apertado
        output_value <= switches;
        is_pressed <= 1;
        halt_from_input <= 0;
    end else if (output_enable == 1) begin
        if (button == 0 && is_pressed == 1) begin
            // Apertado -> Não apertado
            is_pressed <= 0;
        end
        halt_from_input <= 1;
    end else begin
        halt_from_input <= 0;
    end
end

endmodule
