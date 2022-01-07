library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_multiplexer_32_to_16 is
end tb_multiplexer_32_to_16;

architecture test_bench of tb_multiplexer_32_to_16 is
  component multiplexer_32_to_16 is
    port
  	(
      i : in std_logic_vector(31 downto 0);
  		selector : in std_logic;
      o : out std_logic_vector(15 downto 0)
  	);
  end component;

  signal i : std_logic_vector(31 downto 0);
  signal selector : std_logic;
  signal o : std_logic_vector(15 downto 0);

  begin

    used_multiplexer_32_to_16 : multiplexer_32_to_16 port map (
      i => i,
      selector => selector,
      o => o
    );

    process
    begin
      i <= "00000000000001110000000000111111";

      selector <= '0';
      wait for 10 ns;

      selector <= '1';
      wait for 10 ns;

      wait;
    end process;
end architecture;
