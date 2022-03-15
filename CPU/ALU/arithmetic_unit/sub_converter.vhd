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
	signal extended_is_sub : std_logic_vector(31 downto 0);
begin
	extended_is_sub <= (others => is_sub);
	o <= i XOR extended_is_sub;
end Behavioral;
