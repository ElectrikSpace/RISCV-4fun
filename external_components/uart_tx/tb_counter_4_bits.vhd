library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_counter_4_bits is
end tb_counter_4_bits;

architecture test_bench of tb_counter_4_bits is

  component counter_4_bits is
    port (
      clk : in std_logic;
      clk_enable : in std_logic;
      reset : in std_logic;
      counter_value : out std_logic_vector(3 downto 0)
    );
  end component;

  signal clk_enable, reset, clk : std_logic;
  signal counter_value : std_logic_vector(3 downto 0);

begin

  used_counter_4_bits : counter_4_bits port map(
    clk => clk,
    clk_enable => clk_enable,
    reset => reset,
    counter_value => counter_value
  );

  process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  process
  begin
    wait for 200 ns;

    reset <= '0';
    clk_enable <= '0';
    wait for 10 ns;

    reset <= '1';
    wait for 100 ns;

    clk_enable <= '1';
    wait for 100 ns;

    reset <= '0';
    wait for 200 ns;

    clk_enable <= '0';
    wait for 100 ns;

    wait;
  end process;

end architecture;
