library ieee;
use ieee.std_logic_1164.all;

entity logic_block is
	port
	(
		a : in std_logic;
    b : in std_logic;
		a_lower_b : out std_logic;
		a_lower_equal_b : out std_logic
	);
end logic_block;

architecture Behavioral of logic_block is
	signal na: std_logic;
begin
	na <= NOT a;
  a_lower_b <= na AND b;
  a_lower_equal_b <= na OR b ;
end Behavioral;
