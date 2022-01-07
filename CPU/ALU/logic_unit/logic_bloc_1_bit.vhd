library ieee;
use ieee.std_logic_1164.all;

entity logic_bloc_1_bit is
	port
	(
		a : in std_logic;
    b : in std_logic;
    o : out std_logic;
    opcode : in std_logic_vector(1 downto 0)
	);
end logic_bloc_1_bit;

architecture Behavioral of logic_bloc_1_bit is

  signal sub_o : std_logic_vector(3 downto 0);

begin
  sub_o(0) <= a OR b;
  sub_o(1) <= a AND b;
  sub_o(2) <= a XOR b;
  sub_o(3) <= NOT a;

	with opcode select o <=
		sub_o(0) when "00",
		sub_o(1) when "01",
		sub_o(2) when "10",
		sub_o(3) when "11",
		'X' when others;

end Behavioral;
