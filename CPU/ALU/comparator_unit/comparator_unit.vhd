library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.or_reduce;

entity comparator_unit is
	port
	(
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);	
		sub_result : in std_logic_vector(31 downto 0);
   		sub_cout : in std_logic;
		is_signed : in std_logic;
		opcode: in std_logic_vector(1 downto 0);
   		o : out std_logic
	);
end comparator_unit;

architecture Behavioral of comparator_unit is
	component multiplexer_4_to_1 is
		port
		(
			i : in std_logic_vector(3 downto 0);
			selector : in std_logic_vector(1 downto 0);
			o : out std_logic
		);
	end component;

	signal a_sign, b_sign : std_logic;
  	signal a_lower_b, a_equals_b, a_not_equals_b, a_greater_equal_b : std_logic;
	signal output_vector : std_logic_vector(3 downto 0);

begin
	-- sign extend a
	a_sign <= is_signed AND a(31);
	-- sign extend b with sub invert
	b_sign <= NOT(is_signed AND b(31));

	a_equals_b <= NOT(or_reduce(sub_result));
	a_lower_b <= (a_sign XOR b_sign XOR sub_cout) AND NOT(a_equals_b);
	a_not_equals_b <= NOT a_equals_b;
	a_greater_equal_b <= NOT a_lower_b;

	output_vector(0) <= a_lower_b;
	output_vector(1) <= a_equals_b;
	output_vector(2) <= a_not_equals_b;
	output_vector(3) <= a_greater_equal_b;

	mux: multiplexer_4_to_1 port map(i => output_vector, selector => opcode, o => o);
end Behavioral;
