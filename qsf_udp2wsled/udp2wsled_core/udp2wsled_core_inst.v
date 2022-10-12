	udp2wsled_core u0 (
		.clk_50m_clk   (<connected-to-clk_50m_clk>),   // clk_50m.clk
		.ethio_enable  (<connected-to-ethio_enable>),  //   ethio.enable
		.ethio_status  (<connected-to-ethio_status>),  //        .status
		.ipaddr_value  (<connected-to-ipaddr_value>),  //  ipaddr.value
		.macaddr_value (<connected-to-macaddr_value>), // macaddr.value
		.reset_reset_n (<connected-to-reset_reset_n>), //   reset.reset_n
		.rmii_clk      (<connected-to-rmii_clk>),      //    rmii.clk
		.rmii_rxd      (<connected-to-rmii_rxd>),      //        .rxd
		.rmii_crs_dv   (<connected-to-rmii_crs_dv>),   //        .crs_dv
		.rmii_txd      (<connected-to-rmii_txd>),      //        .txd
		.rmii_tx_en    (<connected-to-rmii_tx_en>),    //        .tx_en
		.wsled0_out    (<connected-to-wsled0_out>),    //  wsled0.out
		.wsled1_out    (<connected-to-wsled1_out>),    //  wsled1.out
		.wsled2_out    (<connected-to-wsled2_out>),    //  wsled2.out
		.wsled3_out    (<connected-to-wsled3_out>)     //  wsled3.out
	);

