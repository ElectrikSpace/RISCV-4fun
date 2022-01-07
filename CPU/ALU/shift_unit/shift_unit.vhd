library ieee;
use ieee.std_logic_1164.all;

entity shift_unit is
	port
	(
    a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		is_right_shift : in std_logic;
		is_arithmetic_shift : in std_logic;
    o : out std_logic_vector(31 downto 0)
	);
end shift_unit;

architecture Behavioral of shift_unit is
	component multiplexer_row_b0 is
    port (a: in std_logic_vector(31 downto 0);
          selector: in std_logic;
					shifted_bit: in std_logic;
          o: out std_logic_vector(32 downto 0)
				 );
	end component;
	component multiplexer_row_b1 is
    port (a: in std_logic_vector(31 downto 0);
          selector: in std_logic;
					shifted_bit: in std_logic;
          o: out std_logic_vector(33 downto 0)
				 );
	end component;
	component multiplexer_row_b2 is
    port (a: in std_logic_vector(31 downto 0);
          selector: in std_logic;
					shifted_bit: in std_logic;
          o: out std_logic_vector(35 downto 0)
				 );
	end component;
	component multiplexer_row_b3 is
    port (a: in std_logic_vector(31 downto 0);
          selector: in std_logic;
					shifted_bit: in std_logic;
          o: out std_logic_vector(39 downto 0)
				 );
	end component;
	component multiplexer_row_b4 is
    port (a: in std_logic_vector(31 downto 0);
          selector: in std_logic;
					shifted_bit: in std_logic;
          o: out std_logic_vector(47 downto 0)
				 );
	end component;
	component shift_way_converter is
    port (a: in std_logic_vector(31 downto 0);
          is_right_shift: in std_logic;
          o: out std_logic_vector(31 downto 0)
				 );
	end component;
	signal s1: std_logic;
	signal shifted_bits: std_logic_vector(4 downto 0);
	signal converted_input: std_logic_vector(31 downto 0);
	signal stage_b0: std_logic_vector(32 downto 0);
	signal stage_b1: std_logic_vector(33 downto 0);
	signal stage_b2: std_logic_vector(35 downto 0);
	signal stage_b3: std_logic_vector(39 downto 0);
	signal stage_b4: std_logic_vector(47 downto 0);
	signal shifted_output: std_logic_vector(31 downto 0);
begin
	input_converter: shift_way_converter port map (a => a, is_right_shift => is_right_shift, o => converted_input);
	s1 <= converted_input(0) AND is_right_shift AND is_arithmetic_shift;
	shifted_bits(0) <= s1 AND b(0);
	shifted_bits(1) <= s1 AND b(1);
	shifted_bits(2) <= s1 AND b(2);
	shifted_bits(3) <= s1 AND b(3);
	shifted_bits(4) <= s1 AND b(4);
	mux_b0: multiplexer_row_b0 port map (a => converted_input, selector => b(0), shifted_bit => shifted_bits(0), o => stage_b0);
	mux_b1: multiplexer_row_b1 port map (a => stage_b0(31 downto 0), selector => b(1), shifted_bit => shifted_bits(1), o => stage_b1);
	mux_b2: multiplexer_row_b2 port map (a => stage_b1(31 downto 0), selector => b(2), shifted_bit => shifted_bits(2), o => stage_b2);
	mux_b3: multiplexer_row_b3 port map (a => stage_b2(31 downto 0), selector => b(3), shifted_bit => shifted_bits(3), o => stage_b3);
	mux_b4: multiplexer_row_b4 port map (a => stage_b3(31 downto 0), selector => b(4), shifted_bit => shifted_bits(4), o => stage_b4);
	shifted_output <= stage_b4(31 downto 0);
	output_converter: shift_way_converter port map (a => shifted_output, is_right_shift => is_right_shift, o => o);
end Behavioral;
