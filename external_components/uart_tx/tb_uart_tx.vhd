library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_uart_tx is
end tb_uart_tx;

architecture test_bench of tb_uart_tx is

  component uart_tx is
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
  end component;

  signal memory_wren, uart_clk, memory_clk : std_logic;
  signal reset : std_logic;
  signal memory_address : std_logic_vector(31 downto 0);
  signal memory_in_bus : std_logic_vector(31 downto 0);
  signal uart_out_bus : std_logic_vector(31 downto 0);
  signal tx : std_logic;

begin

  used_uart_tx : uart_tx port map(
    memory_clk => memory_clk,
    uart_clk => uart_clk,
    reset => reset,
    memory_wren => memory_wren,
    memory_address => memory_address,
    memory_in_bus => memory_in_bus,
    uart_out_bus => uart_out_bus,
    tx => tx
  );

  process
  begin
    uart_clk <= '0';
    wait for 10 ns;
    uart_clk <= '1';
    wait for 10 ns;
  end process;

  process
  begin
    memory_clk <= '0';
    wait for 5 ns;
    memory_clk <= '1';
    wait for 5 ns;
  end process;

  process
  begin
    memory_address(31 downto 16) <= "XXXXXXXXXXXXXXXX";
    memory_in_bus(31 downto 8) <= "XXXXXXXXXXXXXXXXXXXXXXXX";
    -- reset <= '1';
    -- wait for 20 ns;
    reset <= '0';

    memory_wren <= '0';
    memory_address(15 downto 0) <= "0000000000000000";
    memory_in_bus(7 downto 0) <= "01011000";

    wait for 50 ns;

    memory_address(15 downto 0) <= "1100000000000001";
    wait for 10 ns;

    memory_address(15 downto 0) <= "1100000000000000";
    memory_in_bus(7 downto 0) <= "01011000";
    wait for 10 ns;

    memory_wren <= '1';
    wait for 10 ns;

    memory_address(15 downto 0) <= "1100000000000001";
    memory_wren <= '0';
    wait for 500 ns;

    memory_address(15 downto 0) <= "1100000000000001";
    wait for 10 ns;

    memory_address(15 downto 0) <= "1100000000000000";
    memory_in_bus(7 downto 0) <= "01011000";
    wait for 10 ns;

    memory_wren <= '1';
    wait for 10 ns;

    memory_address(15 downto 0) <= "1100000000000000";
    memory_in_bus(7 downto 0) <= "01011000";
    memory_wren <= '1';
    wait for 10 ns;

    memory_address(15 downto 0) <= "1100000000000001";
    memory_in_bus(7 downto 0) <= "01011000";
    memory_wren <= '0';
    wait for 10 ns;

    memory_wren <= '0';
    wait for 200 ns;

    wait;
  end process;

end architecture;
