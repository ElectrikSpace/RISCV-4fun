library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_32_to_16 is
	port
	(
    i : in std_logic_vector(31 downto 0);
		selector : in std_logic;
    o : out std_logic_vector(15 downto 0)
	);
end multiplexer_32_to_16;

architecture Behavioral of multiplexer_32_to_16 is
begin
  with selector select o <=
    i(15 downto 0) when '0',
    i(31 downto 16) when '1',
    "XXXXXXXXXXXXXXXX" when others;
end Behavioral;
