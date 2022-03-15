library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_4_to_1 is
	port
	(
		i : in std_logic_vector(3 downto 0);
    selector : in std_logic_vector(1 downto 0);
    o : out std_logic
	);
end multiplexer_4_to_1;

architecture Behavioral of multiplexer_4_to_1 is
begin
  with selector select o <=
    i(0) when "00",
    i(1) when "01",
    i(2) when "10",
    i(3) when "11",
    'X' when others;
end Behavioral;
