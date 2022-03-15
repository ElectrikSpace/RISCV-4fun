library ieee;
use ieee.std_logic_1164.all;

entity logic_block_signed is
	port
	(
		a : in std_logic;
    b : in std_logic;
    is_signed : in std_logic;
    a_lower_b : out std_logic;
    a_lower_equal_b : out std_logic
	);
end logic_block_signed;

architecture Behavioral of logic_block_signed is
  signal sa, nsa, sb: std_logic;
begin
  sa <= is_signed XOR a;
  sb <= is_signed XOR b;
  nsa <= NOT sa;
  a_lower_b <= nsa AND sb;
  a_lower_equal_b <= nsa OR sb ;
end Behavioral;
