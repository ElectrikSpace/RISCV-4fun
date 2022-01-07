library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
	port
	(
			a: in std_logic;
			c_in: in std_logic;
			o: out std_logic;
			c_out: out std_logic
	 );
end half_adder;

architecture Behavioral of half_adder is
begin
	o <= a XOR c_in;
	c_out <= a AND c_in;
end Behavioral;
