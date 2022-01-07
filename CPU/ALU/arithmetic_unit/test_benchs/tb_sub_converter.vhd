library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_sub_converter is
end tb_sub_converter;

architecture test_bench of tb_sub_converter is
  component sub_converter is
    port
    (
      i : in std_logic_vector(31 downto 0);
      is_sub : in std_logic;
      o : out std_logic_vector(31 downto 0)
    );
  end component;

  signal i, o: std_logic_vector(31 downto 0);
  signal is_sub: std_logic;

  begin
    used_sub_converter: sub_converter port map (
      i => i,
      is_sub => is_sub,
      o => o
    );

    process
    begin
      i <= "00000000000000000000000000001011";
      is_sub <= '0';
      wait for 5 ns;

      is_sub <= '1';
      wait for 5 ns;

      i <= "10101010101010101010101010101010";
      is_sub <= '0';
      wait for 5 ns;

      is_sub <= '1';
      wait for 5 ns;

      wait;

    end process;
end architecture;
