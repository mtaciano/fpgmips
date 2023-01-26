create_clock -name "CLOCK_50" -period 20.000ns [get_ports {CLOCK_50}]
create_clock -name "ClockDivider" -period 40.000ns [get_registers {ClockDivider:clock_divider_mod|output_clock}]

derive_pll_clocks
derive_clock_uncertainty
