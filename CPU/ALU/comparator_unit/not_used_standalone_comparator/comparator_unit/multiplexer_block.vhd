library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_block is
	port
	(
		i_a_lower_b : in std_logic_vector(1 downto 0);
    i_a_lower_equal_b : in std_logic_vector(1 downto 0);
    o_a_lower_b : out std_logic;
    o_a_lower_equal_b : out std_logic
	);
end multiplexer_block;

architecture Behavioral of multiplexer_block is
begin
  with i_a_lower_b(0) select o_a_lower_b <=
    i_a_lower_equal_b(1) when '1',
    i_a_lower_b(1) when '0',
    'X' when others;
  with i_a_lower_equal_b(0) select o_a_lower_equal_b <=
    i_a_lower_equal_b(1) when '1',
    i_a_lower_b(1) when '0',
    'X' when others;
end Behavioral;
