library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_128_to_32 is
	port
	(
    i : in std_logic_vector(127 downto 0);
		selector : in std_logic_vector(1 downto 0);
    o : out std_logic_vector(31 downto 0)
	);
end multiplexer_128_to_32;

architecture Behavioral of multiplexer_128_to_32 is
begin
  with selector select o <=
    i(31 downto 0) when "00",
    i(63 downto 32) when "01",
    i(95 downto 64) when "10",
		i(127 downto 96) when "11",
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;
end Behavioral;
