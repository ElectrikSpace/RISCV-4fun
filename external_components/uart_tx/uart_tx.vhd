library ieee;
use ieee.std_logic_1164.all;

entity uart_tx is
  port(
    memory_clk : in std_logic;
    uart_clk : in std_logic;
    reset : in std_logic;
    memory_wren : in std_logic;
    memory_address : in std_logic_vector(31 downto 0);
    memory_in_bus : in std_logic_vector(31 downto 0);
    uart_out_bus : out std_logic_vector(31 downto 0);
    tx : out std_logic
  );
end uart_tx;

architecture Behavioral of uart_tx is

  component memory_clk_state_machine is
    port (
      memory_clk : in std_logic;
      reset : in std_logic;
      new_request : in std_logic;
      uart_machine_running : in std_logic;
      busy_flag : out std_logic;
      reset_uart_machine : out std_logic;
      data_register_clk_enable : out std_logic
    );
  end component;

  component counter_4_bits is
    port (
      clk : in std_logic;
      clk_enable : in std_logic;
      reset : in std_logic;
      counter_value : out std_logic_vector(3 downto 0)
    );
  end component;

  component address_decoder is
    port (
     address_bus : in std_logic_vector(15 downto 0);
     xc000 : out std_logic;
     xc001 : out std_logic
    );
  end component;

  component multiplexer_16_to_1 is
    port (
      i : in std_logic_vector(15 downto 0);
      selector : in std_logic_vector(3 downto 0);
      o : out std_logic
    );
  end component;

  signal memory_address_register : std_logic_vector(15 downto 0);
  signal memory_wren_register : std_logic := '0';
  signal memory_data_register : std_logic_vector(7 downto 0);
  signal counter_value : std_logic_vector(3 downto 0);
  signal mux_input : std_logic_vector(15 downto 0) := "1111111111111100";
  signal internal_reset : std_logic;
  signal mux_output : std_logic;
  signal data_register_clk_enable : std_logic;
  signal output_register_clk_enable : std_logic;
  signal counter_clk_enable : std_logic;
  signal is_counter_0000 : std_logic;
  signal is_counter_1011 : std_logic;
  signal is_address_xc000 : std_logic;
  signal is_address_xc001 : std_logic;
  signal busy_flag : std_logic;
  signal tx_signal : std_logic := '1';
  signal memory_address_real : std_logic_vector(15 downto 0);
  signal new_request : std_logic;
  signal reset_uart_machine : std_logic;
  -- signal counter_reset : std_logic := '0';

begin

  memory_address_real <= memory_address(15 downto 0);

  mux_input(15 downto 10) <= "111111";
  mux_input(1 downto 0) <= "00";

  is_counter_0000 <= (NOT counter_value(3)) AND (NOT counter_value(2)) AND (NOT counter_value(1)) AND (NOT counter_value(0));

  is_counter_1011 <= counter_value(3) AND (NOT counter_value(2)) AND counter_value(1) AND counter_value(0);

  output_register_clk_enable <= (NOT is_counter_0000) AND (NOT is_counter_1011);

  new_request <= memory_wren_register AND is_address_xc000;

  counter_clk_enable <= NOT is_counter_1011;

  internal_reset <= reset_uart_machine;

  tx <= tx_signal;

  memory_clk_state_machine_instance : memory_clk_state_machine port map (
    memory_clk => memory_clk,
    reset => reset,
    new_request => new_request,
    uart_machine_running => counter_clk_enable,
    busy_flag => busy_flag,
    reset_uart_machine => reset_uart_machine,
    data_register_clk_enable => data_register_clk_enable
  );

  counter : counter_4_bits port map(
    clk => uart_clk,
    clk_enable => counter_clk_enable,
    reset => internal_reset,
    -- reset => counter_reset,
    counter_value => counter_value
  );

  decoder : address_decoder port map(
    address_bus => memory_address_register,
    xc000 => is_address_xc000,
    xc001 => is_address_xc001
  );

  multiplexer : multiplexer_16_to_1 port map(
    i => mux_input,
    selector => counter_value,
    o => mux_output
  );

  process(uart_clk)
  begin
    if rising_edge(uart_clk) then
      if output_register_clk_enable='1' then
        tx_signal <= mux_output;
      end if;
    end if;
  end process;

  process(memory_clk)
  begin
    if rising_edge(memory_clk) then
      memory_address_register <= memory_address_real;
      memory_data_register <= memory_in_bus(7 downto 0);
    end if;
  end process;

  process(memory_clk)
  begin
    if rising_edge(memory_clk) then
      if reset='1' then
        memory_wren_register <= '0';
      else
        memory_wren_register <= memory_wren;
      end if;
    end if;
  end process;

  process(memory_clk)
  begin
    if rising_edge(memory_clk) then
      if data_register_clk_enable='1' then
        mux_input(9 downto 2) <= memory_data_register;
      end if;
    end if;
  end process;

  uart_out_bus(8) <= busy_flag AND is_address_xc001;
  uart_out_bus(31 downto 9) <= (others => '0');
  uart_out_bus(7 downto 0) <= (others => '0');

end architecture;
