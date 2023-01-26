module Debouncer (
    clock,
    button,
    output_button
);

input clock;
input button;

output reg output_button;

// First use two flip-flops to synchronize
// the button signal the input clock domain
reg button_sync0;
reg button_sync1;

// Invert PB to make button_sync0 active high
always @(posedge clock) begin
    button_sync0 <= ~button;
end

always @(posedge clock) begin
    button_sync1 <= button_sync0;
end

// Next declare a 17 bits counter
reg [16:0] counter;

// When the push-button is pushed or released, we increment the counter

// The counter has to be maxed out before we decide that
// the push-button state has changed

wire button_idle = (output_button == button_sync1);
wire counter_max = &counter; // True when all bits of counter are 1's

always @(posedge clock) begin
    if (button_idle) begin
        counter <= 0; // Nothing's going on
    end else begin
        // Something's going on, increment the counter
        counter <= counter + 17'd1;

        if (counter_max) begin
            // If the counter is maxed out, the button changed
            output_button <= ~output_button;
        end
    end
end

endmodule
