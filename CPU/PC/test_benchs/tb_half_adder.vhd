library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_half_adder is
end tb_half_adder;

architecture test_bench of tb_half_adder is
  component half_adder is
    port
  	(
  			a: in std_logic;
  			c_in: in std_logic;
  			o: out std_logic;
  			c_out: out std_logic
     );
  end component;

  signal a, c_in, o, c_out : std_logic;

  begin

    used_half_adder : half_adder port map (
      a => a,
      c_in => c_in,
      o => o,
      c_out => c_out
    );

    process
    begin
      a <= '0';
      c_in <= '0';
      wait for 5 ns;

      a <= '0';
      c_in <= '1';
      wait for 5 ns;

      a <= '1';
      c_in <= '0';
      wait for 5 ns;

      a <= '1';
      c_in <= '1';
      wait for 5 ns;

      wait;
    end process;
end architecture;
