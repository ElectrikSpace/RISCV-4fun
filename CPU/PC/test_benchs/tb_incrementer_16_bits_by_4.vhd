library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_incrementer_16_bits_by_4 is
end tb_incrementer_16_bits_by_4;

architecture test_bench of tb_incrementer_16_bits_by_4 is
  component incrementer_16_bits_by_4 is
    port
  	(
  		i : in std_logic_vector(15 downto 0);
      o : out std_logic_vector(15 downto 0)
  	);
  end component;

  signal i, o : std_logic_vector(15 downto 0);

  begin

    used_incrementer_16_bits_by_4 : incrementer_16_bits_by_4 port map (
      i => i,
      o => o
    );

    process
    begin
      i <= "0000000000000000";
      wait for 5 ns;

      i <= "0000000000000001";
      wait for 5 ns;

      i <= "1111111111111111";
      wait for 5 ns;

      i <= "1010101010010010";
      wait for 5 ns;

      wait;
    end process;
end architecture;
