library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_2_to_1 is
	port
	(
		a : in std_logic;
    b : in std_logic;
    selector : in std_logic;
    o : out std_logic
	);
end multiplexer_2_to_1;

architecture Behavioral of multiplexer_2_to_1 is
begin
  with selector select o <=
    a when '1',
    b when '0',
    'X' when others;
end Behavioral;
