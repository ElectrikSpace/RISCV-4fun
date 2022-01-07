library ieee;
use ieee.std_logic_1164.all;

entity comparator_unit is
	port
	(
		a : in std_logic_vector(31 downto 0);
    b : in std_logic_vector(31 downto 0);
		is_signed : in std_logic;
		opcode: in std_logic_vector(1 downto 0);
    o : out std_logic_vector(31 downto 0)
	);
end comparator_unit;

architecture Behavioral of comparator_unit is
  component block_2_bits is
		port
		(
			a : in std_logic_vector(1 downto 0);
	    b : in std_logic_vector(1 downto 0);
	    a_lower_b : out std_logic;
	    a_lower_equal_b : out std_logic
		);
	end component;
	component block_2_bits_signed is
		port
		(
			a : in std_logic_vector(1 downto 0);
	    b : in std_logic_vector(1 downto 0);
			is_signed : std_logic;
	    a_lower_b : out std_logic;
	    a_lower_equal_b : out std_logic
		);
	end component;
  component multiplexer_block is
		port
		(
			i_a_lower_b : in std_logic_vector(1 downto 0);
	    i_a_lower_equal_b : in std_logic_vector(1 downto 0);
	    o_a_lower_b : out std_logic;
	    o_a_lower_equal_b : out std_logic
		);
	end component;
	component multiplexer_4_to_1 is
		port
		(
			i : in std_logic_vector(3 downto 0);
	    selector : in std_logic_vector(1 downto 0);
	    o : out std_logic
		);
	end component;
  signal stage_2_bits_blocks_a_lower_b: std_logic_vector(15 downto 0);
  signal stage_2_bits_blocks_a_lower_equal_b: std_logic_vector(15 downto 0);
  signal stage_4_bits_blocks_a_lower_b: std_logic_vector(7 downto 0);
  signal stage_4_bits_blocks_a_lower_equal_b: std_logic_vector(7 downto 0);
  signal stage_8_bits_blocks_a_lower_b: std_logic_vector(3 downto 0);
  signal stage_8_bits_blocks_a_lower_equal_b: std_logic_vector(3 downto 0);
  signal stage_16_bits_blocks_a_lower_b: std_logic_vector(1 downto 0);
  signal stage_16_bits_blocks_a_lower_equal_b: std_logic_vector(1 downto 0);
  signal stage_32_bits_blocks_a_lower_b: std_logic;
  signal stage_32_bits_blocks_a_lower_equal_b: std_logic;
	signal a_lower_b : std_logic;
	signal a_equals_b : std_logic;
	signal a_not_equals_b : std_logic;
	signal a_greater_equal_b : std_logic;
	signal output_vector : std_logic_vector(3 downto 0);
begin
  -- 2 bits blocks -------------------------------
  stage_2_bits_0: block_2_bits port map (a => a(1 downto 0), b => b(1 downto 0), a_lower_b => stage_2_bits_blocks_a_lower_b(0), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(0));
  stage_2_bits_1: block_2_bits port map (a => a(3 downto 2), b => b(3 downto 2), a_lower_b => stage_2_bits_blocks_a_lower_b(1), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(1));
  stage_2_bits_2: block_2_bits port map (a => a(5 downto 4), b => b(5 downto 4), a_lower_b => stage_2_bits_blocks_a_lower_b(2), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(2));
  stage_2_bits_3: block_2_bits port map (a => a(7 downto 6), b => b(7 downto 6), a_lower_b => stage_2_bits_blocks_a_lower_b(3), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(3));
  stage_2_bits_4: block_2_bits port map (a => a(9 downto 8), b => b(9 downto 8), a_lower_b => stage_2_bits_blocks_a_lower_b(4), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(4));
  stage_2_bits_5: block_2_bits port map (a => a(11 downto 10), b => b(11 downto 10), a_lower_b => stage_2_bits_blocks_a_lower_b(5), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(5));
  stage_2_bits_6: block_2_bits port map (a => a(13 downto 12), b => b(13 downto 12), a_lower_b => stage_2_bits_blocks_a_lower_b(6), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(6));
  stage_2_bits_7: block_2_bits port map (a => a(15 downto 14), b => b(15 downto 14), a_lower_b => stage_2_bits_blocks_a_lower_b(7), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(7));
  stage_2_bits_8: block_2_bits port map (a => a(17 downto 16), b => b(17 downto 16), a_lower_b => stage_2_bits_blocks_a_lower_b(8), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(8));
  stage_2_bits_9: block_2_bits port map (a => a(19 downto 18), b => b(19 downto 18), a_lower_b => stage_2_bits_blocks_a_lower_b(9), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(9));
  stage_2_bits_10: block_2_bits port map (a => a(21 downto 20), b => b(21 downto 20), a_lower_b => stage_2_bits_blocks_a_lower_b(10), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(10));
  stage_2_bits_11: block_2_bits port map (a => a(23 downto 22), b => b(23 downto 22), a_lower_b => stage_2_bits_blocks_a_lower_b(11), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(11));
  stage_2_bits_12: block_2_bits port map (a => a(25 downto 24), b => b(25 downto 24), a_lower_b => stage_2_bits_blocks_a_lower_b(12), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(12));
  stage_2_bits_13: block_2_bits port map (a => a(27 downto 26), b => b(27 downto 26), a_lower_b => stage_2_bits_blocks_a_lower_b(13), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(13));
  stage_2_bits_14: block_2_bits port map (a => a(29 downto 28), b => b(29 downto 28), a_lower_b => stage_2_bits_blocks_a_lower_b(14), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(14));
  stage_2_bits_15: block_2_bits_signed port map (a => a(31 downto 30), b => b(31 downto 30), is_signed => is_signed, a_lower_b => stage_2_bits_blocks_a_lower_b(15), a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(15));

  -- 4 bits blocks -------------------------------
  stage_4_bits_0: multiplexer_block port map(i_a_lower_b => stage_2_bits_blocks_a_lower_b(1 downto 0), i_a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(1 downto 0), o_a_lower_b => stage_4_bits_blocks_a_lower_b(0), o_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(0));
  stage_4_bits_1: multiplexer_block port map(i_a_lower_b => stage_2_bits_blocks_a_lower_b(3 downto 2), i_a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(3 downto 2), o_a_lower_b => stage_4_bits_blocks_a_lower_b(1), o_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(1));
  stage_4_bits_2: multiplexer_block port map(i_a_lower_b => stage_2_bits_blocks_a_lower_b(5 downto 4), i_a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(5 downto 4), o_a_lower_b => stage_4_bits_blocks_a_lower_b(2), o_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(2));
  stage_4_bits_3: multiplexer_block port map(i_a_lower_b => stage_2_bits_blocks_a_lower_b(7 downto 6), i_a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(7 downto 6), o_a_lower_b => stage_4_bits_blocks_a_lower_b(3), o_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(3));
  stage_4_bits_4: multiplexer_block port map(i_a_lower_b => stage_2_bits_blocks_a_lower_b(9 downto 8), i_a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(9 downto 8), o_a_lower_b => stage_4_bits_blocks_a_lower_b(4), o_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(4));
  stage_4_bits_5: multiplexer_block port map(i_a_lower_b => stage_2_bits_blocks_a_lower_b(11 downto 10), i_a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(11 downto 10), o_a_lower_b => stage_4_bits_blocks_a_lower_b(5), o_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(5));
  stage_4_bits_6: multiplexer_block port map(i_a_lower_b => stage_2_bits_blocks_a_lower_b(13 downto 12), i_a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(13 downto 12), o_a_lower_b => stage_4_bits_blocks_a_lower_b(6), o_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(6));
  stage_4_bits_7: multiplexer_block port map(i_a_lower_b => stage_2_bits_blocks_a_lower_b(15 downto 14), i_a_lower_equal_b => stage_2_bits_blocks_a_lower_equal_b(15 downto 14), o_a_lower_b => stage_4_bits_blocks_a_lower_b(7), o_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(7));

  -- 8 bits blocks -------------------------------
  stage_8_bits_0: multiplexer_block port map(i_a_lower_b => stage_4_bits_blocks_a_lower_b(1 downto 0), i_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(1 downto 0), o_a_lower_b => stage_8_bits_blocks_a_lower_b(0), o_a_lower_equal_b => stage_8_bits_blocks_a_lower_equal_b(0));
  stage_8_bits_1: multiplexer_block port map(i_a_lower_b => stage_4_bits_blocks_a_lower_b(3 downto 2), i_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(3 downto 2), o_a_lower_b => stage_8_bits_blocks_a_lower_b(1), o_a_lower_equal_b => stage_8_bits_blocks_a_lower_equal_b(1));
  stage_8_bits_2: multiplexer_block port map(i_a_lower_b => stage_4_bits_blocks_a_lower_b(5 downto 4), i_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(5 downto 4), o_a_lower_b => stage_8_bits_blocks_a_lower_b(2), o_a_lower_equal_b => stage_8_bits_blocks_a_lower_equal_b(2));
  stage_8_bits_3: multiplexer_block port map(i_a_lower_b => stage_4_bits_blocks_a_lower_b(7 downto 6), i_a_lower_equal_b => stage_4_bits_blocks_a_lower_equal_b(7 downto 6), o_a_lower_b => stage_8_bits_blocks_a_lower_b(3), o_a_lower_equal_b => stage_8_bits_blocks_a_lower_equal_b(3));

  -- 8 bits blocks -------------------------------
  stage_16_bits_0: multiplexer_block port map(i_a_lower_b => stage_8_bits_blocks_a_lower_b(1 downto 0), i_a_lower_equal_b => stage_8_bits_blocks_a_lower_equal_b(1 downto 0), o_a_lower_b => stage_16_bits_blocks_a_lower_b(0), o_a_lower_equal_b => stage_16_bits_blocks_a_lower_equal_b(0));
  stage_16_bits_1: multiplexer_block port map(i_a_lower_b => stage_8_bits_blocks_a_lower_b(3 downto 2), i_a_lower_equal_b => stage_8_bits_blocks_a_lower_equal_b(3 downto 2), o_a_lower_b => stage_16_bits_blocks_a_lower_b(1), o_a_lower_equal_b => stage_16_bits_blocks_a_lower_equal_b(1));

  -- 32 bits outputs -------------------------------
  stage_32_bits_0: multiplexer_block port map(i_a_lower_b => stage_16_bits_blocks_a_lower_b(1 downto 0), i_a_lower_equal_b => stage_16_bits_blocks_a_lower_equal_b(1 downto 0), o_a_lower_b => stage_32_bits_blocks_a_lower_b, o_a_lower_equal_b => stage_32_bits_blocks_a_lower_equal_b);
	a_lower_b <= stage_32_bits_blocks_a_lower_b;
	a_equals_b <= stage_32_bits_blocks_a_lower_equal_b AND (NOT stage_32_bits_blocks_a_lower_b);
	a_not_equals_b <= NOT a_equals_b;
	a_greater_equal_b <= NOT stage_32_bits_blocks_a_lower_b;
	output_vector(0) <= a_lower_b;
	output_vector(1) <= a_equals_b;
	output_vector(2) <= a_not_equals_b;
	output_vector(3) <= a_greater_equal_b;
	o(31 downto 1) <= "0000000000000000000000000000000";
	mux: multiplexer_4_to_1 port map(i => output_vector, selector => opcode, o => o(0));
end Behavioral;
