library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_logic_block is
end tb_logic_block;

architecture test_bench of tb_logic_block is
  component logic_block is
    port
  	(
  		a : in std_logic;
      b : in std_logic;
      a_lower_b : out std_logic;
      a_lower_equal_b : out std_logic
  	);
  end component;

  signal a, b, a_lower_b, a_lower_equal_b: std_logic;

  begin
    used_logick_bloc: logic_block port map (
      a => a,
      b => b,
      a_lower_b => a_lower_b,
      a_lower_equal_b => a_lower_equal_b
    );
    process
    begin
      a <= '0';
      b <= '0';
      wait for 5 ns;

      a <= '1';
      wait for 5 ns;

      b <= '1';
      wait for 5 ns;

      a <= '0';
      wait for 5 ns;

      wait;
    end process;
end architecture;
