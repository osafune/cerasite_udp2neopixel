# ------------------------------------------
# Create generated clocks based on PLLs
# ------------------------------------------

derive_pll_clocks
derive_clock_uncertainty



# ---------------------------------------------
# Original Clock
# ---------------------------------------------

create_clock -period "50.000 MHz" -name {CLOCK_50} {CLOCK_50}
create_clock -period "50.000 MHz" [get_ports RMII_CLK]



# ---------------------------------------------
# false path
# ---------------------------------------------

