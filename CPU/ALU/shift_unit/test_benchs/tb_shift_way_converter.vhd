library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_shift_way_converter is
end tb_shift_way_converter;

architecture test_bench of tb_shift_way_converter is
  component shift_way_converter is
    port
  	(
  		a : in std_logic_vector(31 downto 0);
      is_right_shift : in std_logic;
      o : out std_logic_vector(31 downto 0)
  	);
  end component;

  signal a, o : std_logic_vector(31 downto 0);
  signal is_right_shift : std_logic;

  begin
    used_shift_way_converter: shift_way_converter port map (
      a => a,
      is_right_shift => is_right_shift,
      o => o
    );

    process
    begin
      a <= "10101100111100000101001100001111";
      is_right_shift <= '0';
      wait for 5 ns;

      is_right_shift <= '1';
      wait for 5 ns;

      wait;
    end process;
end architecture;
