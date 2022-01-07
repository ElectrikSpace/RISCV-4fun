library ieee;
use ieee.std_logic_1164.all;

entity encoder_4_to_2 is
	port
	(
    i : in std_logic_vector(3 downto 0);
    o : out std_logic_vector(1 downto 0)
	);
end encoder_4_to_2;

architecture Behavioral of encoder_4_to_2 is
begin
  o(0) <= i(1) OR i(3);
	o(1) <= i(2) OR i(3);
end Behavioral;
