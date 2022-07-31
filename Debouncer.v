module Debouncer(
    clock,
    botao,
    saida
);

input clock; //clock
input botao; //botao
output reg saida; // saida

wire PB_down;
wire PB_up;
// First use two flip-flops to synchronize the PB signal the "clk" clock domain
reg PB_sync_0;  always @(posedge clock) PB_sync_0 <= ~botao;  // invert PB to make PB_sync_0 active high
reg PB_sync_1;  always @(posedge clock) PB_sync_1 <= PB_sync_0;

// Next declare a 16-bits counter
// reg [15:0] PB_cnt;
reg [16:0] PB_cnt;

// When the push-button is pushed or released, we increment the counter
// The counter has to be maxed out before we decide that the push-button state has changed

wire PB_idle = (saida==PB_sync_1);
wire PB_cnt_max = &PB_cnt;	// true when all bits of PB_cnt are 1's

always @(posedge clock)
if(PB_idle)
    PB_cnt <= 0;  // nothing's going on
else
begin
    PB_cnt <= PB_cnt + 16'd1;  // something's going on, increment the counter
    if(PB_cnt_max) saida <= ~saida;  // if the counter is maxed out, PB changed!
end

assign PB_down = ~PB_idle & PB_cnt_max & ~saida;
assign PB_up   = ~PB_idle & PB_cnt_max &  saida;
endmodule