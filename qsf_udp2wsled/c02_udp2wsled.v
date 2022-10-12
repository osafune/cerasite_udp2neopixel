// ===================================================================
// TITLE : CERASITE / UDP to NeoPixel Serial LED Controller
//
//   DEGISN : S.OSAFUNE (J-7SYSTEM WORKS LIMITED)
//   DATE   : 2022/09/28 -> 2022/10/11
//
// ===================================================================
//
// The MIT License (MIT)
// Copyright (c) 2022 J-7SYSTEM WORKS LIMITED.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is furnished to do
// so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

`default_nettype none

module c02_udp2wsled (
	output wire			OSC_OE,
	input wire			CLOCK_50,
//	input wire			RESET_N,	// JTAGEN (pullup)
	output wire			LED,

	// RMII interface
	input wire			RMII_CLK,	// PIO[1]
	input wire  [1:0]	RMII_RXD,	// PIO[10] : RXD0, PIO[9] : RXD1
	input wire			RMII_CRSDV,	// PIO[11]
	output wire [1:0]	RMII_TXD,	// PIO[7] : TXD0, PIO[6] : TXD1
	output wire			RMII_TXEN,	// PIO[8]

	// WSLED out
	output wire [3:0]	WSLED		// PIO[2:5] : WSLED[0:3]
);

	parameter MAC_ADDRESS	= 48'hfeffff000002;					// FE-FF-FF-00-00-02
	parameter IP_ADDRESS	= {8'd192, 8'd168, 8'd1, 8'd204};	// 192.168.1.204

	wire			reset_sig = 1'b0;
	wire			clk_50m_sig;
	wire			clk_6m25_sig;
	wire			pll_locked_sig;
	wire [2:0]		ethio_status_sig;


	assign OSC_OE = 1'b1;

	syspll
	u0 (
		.areset		(reset_sig),
		.inclk0		(CLOCK_50),
		.c0			(clk_50m_sig),
//		.c1			(clk_6m25_sig),
		.locked		(pll_locked_sig)
	);

	udp2wsled_core
	u1 (
		.reset_reset_n	(pll_locked_sig),	//   reset.reset_n
		.clk_50m_clk	(clk_50m_sig),		// clk_50m.clk
		.ethio_enable	(1'b1),				//   ethio.enable
		.ethio_status	(ethio_status_sig), //        .status
		.macaddr_value	(MAC_ADDRESS),		// macaddr.value
		.ipaddr_value	(IP_ADDRESS),		//  ipaddr.value
		.rmii_clk		(RMII_CLK),			//    rmii.clk
		.rmii_rxd		(RMII_RXD),			//        .rxd
		.rmii_crs_dv	(RMII_CRSDV),		//        .crs_dv
		.rmii_txd		(RMII_TXD),			//        .txd
		.rmii_tx_en		(RMII_TXEN),		//        .tx_en
		.wsled0_out		(WSLED[0]),			//  wsled0.out
		.wsled1_out		(WSLED[1]),			//  wsled1.out
		.wsled2_out		(WSLED[2]),			//  wsled2.out
		.wsled3_out		(WSLED[3])			//  wsled3.out
	);

	assign LED = ethio_status_sig[0];



endmodule
