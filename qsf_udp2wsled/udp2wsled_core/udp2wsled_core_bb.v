
module udp2wsled_core (
	clk_50m_clk,
	ethio_enable,
	ethio_status,
	ipaddr_value,
	macaddr_value,
	reset_reset_n,
	rmii_clk,
	rmii_rxd,
	rmii_crs_dv,
	rmii_txd,
	rmii_tx_en,
	wsled0_out,
	wsled1_out,
	wsled2_out,
	wsled3_out);	

	input		clk_50m_clk;
	input		ethio_enable;
	output	[2:0]	ethio_status;
	input	[31:0]	ipaddr_value;
	input	[47:0]	macaddr_value;
	input		reset_reset_n;
	input		rmii_clk;
	input	[1:0]	rmii_rxd;
	input		rmii_crs_dv;
	output	[1:0]	rmii_txd;
	output		rmii_tx_en;
	output		wsled0_out;
	output		wsled1_out;
	output		wsled2_out;
	output		wsled3_out;
endmodule
