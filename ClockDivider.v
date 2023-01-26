module ClockDivider
#(parameter DIVISOR = 28'd1)
(
    input_clock,
    halt,
    output_clock
);

input input_clock;
input halt;

output reg output_clock;

reg [27:0] counter;

// The frequency of the output_clock
// equals the frequency of the input_clock divided by DIVISOR
// For example: input_clock = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output output_clock = 50Mhz/50.000.000 = 1Hz

initial begin
    counter <= 28'b0;
    output_clock <= 1'b0;
end

always @(posedge input_clock) begin
    if (halt == 0) begin
        counter = counter + 28'b1;

        if (counter >= DIVISOR) begin
            counter = 28'b0;
            output_clock = ~output_clock;
        end
    end
end

endmodule

