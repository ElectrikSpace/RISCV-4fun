library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_32bits is
	port
	(
		a : in std_logic_vector(31 downto 0);
        b : in std_logic_vector(31 downto 0);
        cin : in std_logic;
		cout : out std_logic;
        o : out std_logic_vector(31 downto 0)
	);
end adder_32bits;

architecture Behavioral of adder_32bits is
	signal tmp : std_logic_vector(32 downto 0);
begin
	tmp <= std_logic_vector(unsigned('0' & a) + unsigned('0' & b) + (cin & ""));
	o <= tmp(31 downto 0);
	cout <= tmp(32);
end Behavioral;
