library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port
	(
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		unit_selector : in std_logic_vector(1 downto 0);
		shift_unit_opcode : in std_logic_vector(1 downto 0);
		logic_unit_opcode : in std_logic_vector(1 downto 0);
		arithmetic_unit_opcode : in std_logic;
		comparator_unit_opcode : in std_logic_vector(2 downto 0);
		o : out std_logic_vector(31 downto 0)
	);
end ALU;

architecture Behavioral of ALU is
	component shift_unit is
		port
		(
	 	   	a : in std_logic_vector(31 downto 0);
			b : in std_logic_vector(31 downto 0);
			is_right_shift : in std_logic;
			is_arithmetic_shift : in std_logic;
			o : out std_logic_vector(31 downto 0)
		);
	end component;
	component logic_unit is
		port
		(
			a : in std_logic_vector(31 downto 0);
			b : in std_logic_vector(31 downto 0);
			o : out std_logic_vector(31 downto 0);
			opcode : in std_logic_vector(1 downto 0)
		);
	end component;
	component arithmetic_unit is
		port
		(
			a : in std_logic_vector(31 downto 0);
			b : in std_logic_vector(31 downto 0);
			is_sub : in std_logic;
			cout : out std_logic;
			o : out std_logic_vector(31 downto 0)
		);
	end component;
	component comparator_unit is
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
	end component;
	component multiplexer_128_to_32 is
		port
		(
			i : in std_logic_vector(127 downto 0);
			selector : in std_logic_vector(1 downto 0);
			o : out std_logic_vector(31 downto 0)
		);
	end component;

	signal sub_output : std_logic_vector(127 downto 0);

	signal alu_output : std_logic_vector(31 downto 0);

	signal arith_cout : std_logic;

	signal is_sub : std_logic;

begin
	is_sub <= arithmetic_unit_opcode OR (unit_selector(0) AND unit_selector(1));

	shift_unit_0: shift_unit port map (a => a, b => b, is_right_shift => shift_unit_opcode(1), is_arithmetic_shift => shift_unit_opcode(0), o => sub_output(31 downto 0));

	logic_unit_0: logic_unit port map (a => a, b => b, opcode => logic_unit_opcode, o => sub_output(63 downto 32));

	arithmetic_unit_0: arithmetic_unit port map (a => a, b => b, is_sub => is_sub, cout => arith_cout, o => sub_output(95 downto 64));

	comparator_unit_0: comparator_unit port map (a => a, b => b, sub_result => sub_output(95 downto 64), sub_cout => arith_cout, is_signed => comparator_unit_opcode(2), opcode => comparator_unit_opcode(1 downto 0), o => sub_output(96));
	sub_output(127 downto 97) <= (others => '0');

	mux: multiplexer_128_to_32 port map (i => sub_output, selector => unit_selector, o => o);

end Behavioral;
