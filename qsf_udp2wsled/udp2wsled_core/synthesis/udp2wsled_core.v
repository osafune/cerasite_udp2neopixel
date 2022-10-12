// udp2wsled_core.v

// Generated using ACDS version 21.1 850

`timescale 1 ps / 1 ps
module udp2wsled_core (
		input  wire        clk_50m_clk,   // clk_50m.clk
		input  wire        ethio_enable,  //   ethio.enable
		output wire [2:0]  ethio_status,  //        .status
		input  wire [31:0] ipaddr_value,  //  ipaddr.value
		input  wire [47:0] macaddr_value, // macaddr.value
		input  wire        reset_reset_n, //   reset.reset_n
		input  wire        rmii_clk,      //    rmii.clk
		input  wire [1:0]  rmii_rxd,      //        .rxd
		input  wire        rmii_crs_dv,   //        .crs_dv
		output wire [1:0]  rmii_txd,      //        .txd
		output wire        rmii_tx_en,    //        .tx_en
		output wire        wsled0_out,    //  wsled0.out
		output wire        wsled1_out,    //  wsled1.out
		output wire        wsled2_out,    //  wsled2.out
		output wire        wsled3_out     //  wsled3.out
	);

	wire        peridot_ethio_0_src0_valid;     // peridot_ethio_0:aso_src0_valid -> peridot_serialled_0:in_valid
	wire  [7:0] peridot_ethio_0_src0_data;      // peridot_ethio_0:aso_src0_data -> peridot_serialled_0:in_data
	wire        peridot_ethio_0_src0_ready;     // peridot_serialled_0:in_ready -> peridot_ethio_0:aso_src0_ready
	wire        peridot_ethio_0_src1_valid;     // peridot_ethio_0:aso_src1_valid -> peridot_serialled_1:in_valid
	wire  [7:0] peridot_ethio_0_src1_data;      // peridot_ethio_0:aso_src1_data -> peridot_serialled_1:in_data
	wire        peridot_ethio_0_src1_ready;     // peridot_serialled_1:in_ready -> peridot_ethio_0:aso_src1_ready
	wire        peridot_ethio_0_src2_valid;     // peridot_ethio_0:aso_src2_valid -> peridot_serialled_2:in_valid
	wire  [7:0] peridot_ethio_0_src2_data;      // peridot_ethio_0:aso_src2_data -> peridot_serialled_2:in_data
	wire        peridot_ethio_0_src2_ready;     // peridot_serialled_2:in_ready -> peridot_ethio_0:aso_src2_ready
	wire        peridot_ethio_0_src3_valid;     // peridot_ethio_0:aso_src3_valid -> peridot_serialled_3:in_valid
	wire  [7:0] peridot_ethio_0_src3_data;      // peridot_ethio_0:aso_src3_data -> peridot_serialled_3:in_data
	wire        peridot_ethio_0_src3_ready;     // peridot_serialled_3:in_ready -> peridot_ethio_0:aso_src3_ready
	wire        rst_controller_reset_out_reset; // rst_controller:reset_out -> [peridot_ethio_0:rsi_reset_reset, peridot_serialled_0:reset, peridot_serialled_1:reset, peridot_serialled_2:reset, peridot_serialled_3:reset]

	peridot_ethio #(
		.RXFIFO_SIZE         (4096),
		.TXFIFO_SIZE         (4096),
		.FIFO_BLOCKSIZE      (64),
		.SUPPORT_SPEED_10M   (0),
		.SUPPORT_HARFDUPLEX  (0),
		.SUPPORT_PAUSEFRAME  (0),
		.MTU_SIZE            (1500),
		.ENABLE_UDP_CHECKSUM (0),
		.IGNORE_RXFCS_CHECK  (0),
		.FIXED_MAC_ADDRESS   (48'b000000000000000000000000000000000000000000000000),
		.FIXED_IP_ADDRESS    (32'b00000000000000000000000000000000),
		.FIXED_UDP_PORT      (16241),
		.FIXED_PAUSE_LESS    (0),
		.FIXED_PAUSE_VALUE   (0),
		.SUPPORT_MEMORYHOST  (0),
		.AVALONMM_FASTMODE   (0),
		.SUPPORT_STREAMFIFO  (1),
		.SRCFIFO_NUMBER      (4),
		.SINKFIFO_NUMBER     (0),
		.SRCFIFO_0_SIZE      (1024),
		.SRCFIFO_1_SIZE      (1024),
		.SRCFIFO_2_SIZE      (1024),
		.SRCFIFO_3_SIZE      (1024),
		.SINKFIFO_0_SIZE     (2048),
		.SINKFIFO_1_SIZE     (2048),
		.SINKFIFO_2_SIZE     (2048),
		.SINKFIFO_3_SIZE     (2048)
	) peridot_ethio_0 (
		.csi_clock_clk        (clk_50m_clk),                          //   clock.clk
		.rsi_reset_reset      (rst_controller_reset_out_reset),       //   reset.reset
		.aso_src0_ready       (peridot_ethio_0_src0_ready),           //    src0.ready
		.aso_src0_valid       (peridot_ethio_0_src0_valid),           //        .valid
		.aso_src0_data        (peridot_ethio_0_src0_data),            //        .data
		.aso_src1_ready       (peridot_ethio_0_src1_ready),           //    src1.ready
		.aso_src1_valid       (peridot_ethio_0_src1_valid),           //        .valid
		.aso_src1_data        (peridot_ethio_0_src1_data),            //        .data
		.aso_src2_ready       (peridot_ethio_0_src2_ready),           //    src2.ready
		.aso_src2_valid       (peridot_ethio_0_src2_valid),           //        .valid
		.aso_src2_data        (peridot_ethio_0_src2_data),            //        .data
		.aso_src3_ready       (peridot_ethio_0_src3_ready),           //    src3.ready
		.aso_src3_valid       (peridot_ethio_0_src3_valid),           //        .valid
		.aso_src3_data        (peridot_ethio_0_src3_data),            //        .data
		.coe_enable           (ethio_enable),                         //   ethio.enable
		.coe_status           (ethio_status),                         //        .status
		.coe_macaddr          (macaddr_value),                        // macaddr.value
		.coe_ipaddr           (ipaddr_value),                         //  ipaddr.value
		.coe_rmii_clk         (rmii_clk),                             //    rmii.clk
		.coe_rmii_rxd         (rmii_rxd),                             //        .rxd
		.coe_rmii_crsdv       (rmii_crs_dv),                          //        .crs_dv
		.coe_rmii_txd         (rmii_txd),                             //        .txd
		.coe_rmii_txen        (rmii_tx_en),                           //        .tx_en
		.avm_m1_waitrequest   (1'b0),                                 // (terminated)
		.avm_m1_address       (),                                     // (terminated)
		.avm_m1_read          (),                                     // (terminated)
		.avm_m1_readdata      (32'b00000000000000000000000000000000), // (terminated)
		.avm_m1_readdatavalid (1'b0),                                 // (terminated)
		.avm_m1_write         (),                                     // (terminated)
		.avm_m1_writedata     (),                                     // (terminated)
		.avm_m1_byteenable    (),                                     // (terminated)
		.asi_sink0_ready      (),                                     // (terminated)
		.asi_sink0_valid      (1'b0),                                 // (terminated)
		.asi_sink0_data       (8'b00000000),                          // (terminated)
		.asi_sink1_ready      (),                                     // (terminated)
		.asi_sink1_valid      (1'b0),                                 // (terminated)
		.asi_sink1_data       (8'b00000000),                          // (terminated)
		.asi_sink2_ready      (),                                     // (terminated)
		.asi_sink2_valid      (1'b0),                                 // (terminated)
		.asi_sink2_data       (8'b00000000),                          // (terminated)
		.asi_sink3_ready      (),                                     // (terminated)
		.asi_sink3_valid      (1'b0),                                 // (terminated)
		.asi_sink3_data       (8'b00000000),                          // (terminated)
		.coe_speed10m         (1'b0),                                 // (terminated)
		.coe_halfduplex       (1'b0),                                 // (terminated)
		.coe_udpport          (16'b0000000000000000),                 // (terminated)
		.coe_pause_less       (8'b00000000),                          // (terminated)
		.coe_pause_value      (16'b0000000000000000)                  // (terminated)
	);

	peridot_ethio_wsled #(
		.BIT_PERIOD_COUNT (63),
		.SYMBOL1_COUNT    (45),
		.SYMBOL0_COUNT    (18),
		.RESET_BITCOUNT   (223)
	) peridot_serialled_0 (
		.clk      (clk_50m_clk),                    //  clock.clk
		.reset    (rst_controller_reset_out_reset), //  reset.reset
		.in_ready (peridot_ethio_0_src0_ready),     //   sink.ready
		.in_valid (peridot_ethio_0_src0_valid),     //       .valid
		.in_data  (peridot_ethio_0_src0_data),      //       .data
		.wsled    (wsled0_out)                      // export.out
	);

	peridot_ethio_wsled #(
		.BIT_PERIOD_COUNT (63),
		.SYMBOL1_COUNT    (45),
		.SYMBOL0_COUNT    (18),
		.RESET_BITCOUNT   (223)
	) peridot_serialled_1 (
		.clk      (clk_50m_clk),                    //  clock.clk
		.reset    (rst_controller_reset_out_reset), //  reset.reset
		.in_ready (peridot_ethio_0_src1_ready),     //   sink.ready
		.in_valid (peridot_ethio_0_src1_valid),     //       .valid
		.in_data  (peridot_ethio_0_src1_data),      //       .data
		.wsled    (wsled1_out)                      // export.out
	);

	peridot_ethio_wsled #(
		.BIT_PERIOD_COUNT (63),
		.SYMBOL1_COUNT    (45),
		.SYMBOL0_COUNT    (18),
		.RESET_BITCOUNT   (223)
	) peridot_serialled_2 (
		.clk      (clk_50m_clk),                    //  clock.clk
		.reset    (rst_controller_reset_out_reset), //  reset.reset
		.in_ready (peridot_ethio_0_src2_ready),     //   sink.ready
		.in_valid (peridot_ethio_0_src2_valid),     //       .valid
		.in_data  (peridot_ethio_0_src2_data),      //       .data
		.wsled    (wsled2_out)                      // export.out
	);

	peridot_ethio_wsled #(
		.BIT_PERIOD_COUNT (63),
		.SYMBOL1_COUNT    (45),
		.SYMBOL0_COUNT    (18),
		.RESET_BITCOUNT   (223)
	) peridot_serialled_3 (
		.clk      (clk_50m_clk),                    //  clock.clk
		.reset    (rst_controller_reset_out_reset), //  reset.reset
		.in_ready (peridot_ethio_0_src3_ready),     //   sink.ready
		.in_valid (peridot_ethio_0_src3_valid),     //       .valid
		.in_data  (peridot_ethio_0_src3_data),      //       .data
		.wsled    (wsled3_out)                      // export.out
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_50m_clk),                    //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule