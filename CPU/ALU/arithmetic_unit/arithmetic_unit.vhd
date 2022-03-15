library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arithmetic_unit is
	port
	(
		a : in std_logic_vector(31 downto 0);
        b : in std_logic_vector(31 downto 0);
        is_sub : in std_logic;
		cout : out std_logic;
        o : out std_logic_vector(31 downto 0)
	);
end arithmetic_unit;

architecture Behavioral of arithmetic_unit is
	component sub_converter is
		port 
		(
			i: in std_logic_vector(31 downto 0);
			is_sub: in std_logic;
			o: out std_logic_vector(31 downto 0)
		);
	end component;

	component adder_32bits is
		port
		(
			a : in std_logic_vector(31 downto 0);
			b : in std_logic_vector(31 downto 0);
			cin : in std_logic;
			cout : out std_logic;
			o : out std_logic_vector(31 downto 0)
		);
	end component;

	signal b_sub_compliant : std_logic_vector(31 downto 0);

begin
	sub_compliance: sub_converter port map (i => b, is_sub => is_sub, o => b_sub_compliant);

	u1: adder_32bits port map (a => a, b => b_sub_compliant, cin => is_sub, cout => cout, o => o);
end Behavioral;
