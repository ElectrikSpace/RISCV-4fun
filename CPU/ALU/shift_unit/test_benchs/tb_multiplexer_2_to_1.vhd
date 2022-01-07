library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_multiplexer_2_to_1 is
end tb_multiplexer_2_to_1;

architecture test_bench of tb_multiplexer_2_to_1 is
  component multiplexer_2_to_1 is
    port
  	(
  		a : in std_logic;
      b : in std_logic;
      selector : in std_logic;
      o : out std_logic
  	);
  end component;

  signal a, b, selector, o : std_logic;

  begin
    used_multiplexer: multiplexer_2_to_1 port map (
      a => a,
      b => b,
      selector => selector,
      o => o
    );
    process
    begin
      a <= '0';
      b <= '0';
      selector <= '0';
      wait for 5 ns;

      a <= '1';
      b <= '0';
      selector <= '0';
      wait for 5 ns;

      a <= '0';
      b <= '1';
      selector <= '0';
      wait for 5 ns;

      a <= '1';
      b <= '1';
      selector <= '0';
      wait for 5 ns;

      a <= '0';
      b <= '0';
      selector <= '1';
      wait for 5 ns;

      a <= '1';
      b <= '0';
      selector <= '1';
      wait for 5 ns;

      a <= '0';
      b <= '1';
      selector <= '1';
      wait for 5 ns;

      a <= '1';
      b <= '1';
      selector <= '1';
      wait for 5 ns;

      wait;
    end process;
end architecture;
