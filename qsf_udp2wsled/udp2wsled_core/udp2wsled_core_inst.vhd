	component udp2wsled_core is
		port (
			clk_50m_clk   : in  std_logic                     := 'X';             -- clk
			ethio_enable  : in  std_logic                     := 'X';             -- enable
			ethio_status  : out std_logic_vector(2 downto 0);                     -- status
			ipaddr_value  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- value
			macaddr_value : in  std_logic_vector(47 downto 0) := (others => 'X'); -- value
			reset_reset_n : in  std_logic                     := 'X';             -- reset_n
			rmii_clk      : in  std_logic                     := 'X';             -- clk
			rmii_rxd      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rxd
			rmii_crs_dv   : in  std_logic                     := 'X';             -- crs_dv
			rmii_txd      : out std_logic_vector(1 downto 0);                     -- txd
			rmii_tx_en    : out std_logic;                                        -- tx_en
			wsled0_out    : out std_logic;                                        -- out
			wsled1_out    : out std_logic;                                        -- out
			wsled2_out    : out std_logic;                                        -- out
			wsled3_out    : out std_logic                                         -- out
		);
	end component udp2wsled_core;

	u0 : component udp2wsled_core
		port map (
			clk_50m_clk   => CONNECTED_TO_clk_50m_clk,   -- clk_50m.clk
			ethio_enable  => CONNECTED_TO_ethio_enable,  --   ethio.enable
			ethio_status  => CONNECTED_TO_ethio_status,  --        .status
			ipaddr_value  => CONNECTED_TO_ipaddr_value,  --  ipaddr.value
			macaddr_value => CONNECTED_TO_macaddr_value, -- macaddr.value
			reset_reset_n => CONNECTED_TO_reset_reset_n, --   reset.reset_n
			rmii_clk      => CONNECTED_TO_rmii_clk,      --    rmii.clk
			rmii_rxd      => CONNECTED_TO_rmii_rxd,      --        .rxd
			rmii_crs_dv   => CONNECTED_TO_rmii_crs_dv,   --        .crs_dv
			rmii_txd      => CONNECTED_TO_rmii_txd,      --        .txd
			rmii_tx_en    => CONNECTED_TO_rmii_tx_en,    --        .tx_en
			wsled0_out    => CONNECTED_TO_wsled0_out,    --  wsled0.out
			wsled1_out    => CONNECTED_TO_wsled1_out,    --  wsled1.out
			wsled2_out    => CONNECTED_TO_wsled2_out,    --  wsled2.out
			wsled3_out    => CONNECTED_TO_wsled3_out     --  wsled3.out
		);

