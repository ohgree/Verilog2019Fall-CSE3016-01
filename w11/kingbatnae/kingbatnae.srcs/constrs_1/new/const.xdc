set_property IOSTANDARD LVCMOS18 [get_ports d]
set_property IOSTANDARD LVCMOS18 [get_ports en]
set_property IOSTANDARD LVCMOS18 [get_ports q]
set_property IOSTANDARD LVCMOS18 [get_ports qbar]
set_property PACKAGE_PIN L3 [get_ports d]
set_property PACKAGE_PIN J4 [get_ports en]
set_property PACKAGE_PIN F15 [get_ports q]
set_property PACKAGE_PIN F13 [get_ports qbar]

set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells <cellname>]]



set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {en_IBUF}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clk_IBUF}]

set_property PACKAGE_PIN J4 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports clk]
