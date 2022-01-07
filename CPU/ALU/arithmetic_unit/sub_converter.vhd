library ieee;
use ieee.std_logic_1164.all;

entity sub_converter is
	port
	(
		i : in std_logic_vector(31 downto 0);
    is_sub : in std_logic;
    o : out std_logic_vector(31 downto 0)
	);
end sub_converter;

architecture Behavioral of sub_converter is
begin
	o(0) <= i(0) XOR is_sub;
	o(1) <= i(1) XOR is_sub;
	o(2) <= i(2) XOR is_sub;
	o(3) <= i(3) XOR is_sub;
	o(4) <= i(4) XOR is_sub;
	o(5) <= i(5) XOR is_sub;
	o(6) <= i(6) XOR is_sub;
	o(7) <= i(7) XOR is_sub;
	o(8) <= i(8) XOR is_sub;
	o(9) <= i(9) XOR is_sub;
	o(10) <= i(10) XOR is_sub;
	o(11) <= i(11) XOR is_sub;
	o(12) <= i(12) XOR is_sub;
	o(13) <= i(13) XOR is_sub;
	o(14) <= i(14) XOR is_sub;
	o(15) <= i(15) XOR is_sub;
	o(16) <= i(16) XOR is_sub;
	o(17) <= i(17) XOR is_sub;
	o(18) <= i(18) XOR is_sub;
	o(19) <= i(19) XOR is_sub;
	o(20) <= i(20) XOR is_sub;
	o(21) <= i(21) XOR is_sub;
	o(22) <= i(22) XOR is_sub;
	o(23) <= i(23) XOR is_sub;
	o(24) <= i(24) XOR is_sub;
	o(25) <= i(25) XOR is_sub;
	o(26) <= i(26) XOR is_sub;
	o(27) <= i(27) XOR is_sub;
	o(28) <= i(28) XOR is_sub;
	o(29) <= i(29) XOR is_sub;
	o(30) <= i(30) XOR is_sub;
	o(31) <= i(31) XOR is_sub;
end Behavioral;
