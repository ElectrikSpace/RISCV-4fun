library ieee;
use ieee.std_logic_1164.all;

entity IO_manager is
  port (
    memory_clk : in std_logic;
    uart_clk : in std_logic;
    reset : in std_logic;
    memory_wren : in std_logic;
    memory_address : in std_logic_vector(31 downto 0);
    memory_in_bus : in std_logic_vector(31 downto 0);
    IO_out_bus : out std_logic_vector(31 downto 0);
    tx : out std_logic
  );
end IO_manager;

architecture Behavioral of IO_manager is

  component uart_tx is
    port(
      uart_clk : in std_logic;
      memory_clk : in std_logic;
      reset : in std_logic;
      memory_wren : in std_logic;
      memory_address : in std_logic_vector(31 downto 0);
      memory_in_bus : in std_logic_vector(31 downto 0);
      uart_out_bus : out std_logic_vector(31 downto 0);
      tx : out std_logic
    );
  end component;

begin

  uart_tx_instance : uart_tx port map (
    uart_clk => uart_clk,
    memory_clk => memory_clk,
    reset => reset,
    memory_wren => memory_wren,
    memory_address => memory_address,
    memory_in_bus => memory_in_bus,
    uart_out_bus => IO_out_bus,
    tx => tx
  );

end architecture;
