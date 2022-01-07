library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_CPU is
end tb_CPU;

architecture test_bench of tb_CPU is

  component CPU is
    port (
      cpu_clk : in std_logic;
      uart_clk : in std_logic;
      reset_button : in std_logic;
      tx : out std_logic
    );
  end component;

  signal cpu_clk, uart_clk, reset_button, tx : std_logic;

begin

  CPU_instance : CPU port map (
    cpu_clk => cpu_clk,
    uart_clk => uart_clk,
    reset_button => reset_button,
    tx => tx
  );

  process
  begin
    cpu_clk <= '0';
    wait for 10 ns;
    cpu_clk <= '1';
    wait for 10 ns;
  end process;

  process
  begin
    uart_clk <= '0';
    wait for 50 ns;
    uart_clk <= '1';
    wait for 50 ns;
  end process;

  process
  begin
      reset_button <= '0';
      wait for 100 ns;
      reset_button <= '1';

      wait for 100 us;
  end process;

end architecture;
