module ClockDivider(
    clockIn,
    halt,
    clockOut
);

input clockIn;
input halt;
output reg clockOut;

reg [27:0] counter = 28'd0;
parameter DIVISOR = 28'd1;
// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz

always @(posedge clockIn) begin
    if (halt) begin
        counter = counter;
        clockOut = clockOut;
    end else begin
        counter = counter + 28'b1;
        if (counter >= DIVISOR) begin
            counter = 28'b0;
            clockOut = ~clockOut;
        end
    end
end

endmodule

