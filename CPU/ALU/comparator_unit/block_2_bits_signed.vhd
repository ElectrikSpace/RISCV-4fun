library ieee;
use ieee.std_logic_1164.all;

entity block_2_bits_signed is
	port
	(
		a : in std_logic_vector(1 downto 0);
    b : in std_logic_vector(1 downto 0);
		is_signed : std_logic;
    a_lower_b : out std_logic;
    a_lower_equal_b : out std_logic
	);
end block_2_bits_signed;

architecture Behavioral of block_2_bits_signed is
  component logic_block_signed is
		port
		(
			a : in std_logic;
	    b : in std_logic;
	    is_signed : in std_logic;
	    a_lower_b : out std_logic;
	    a_lower_equal_b : out std_logic
		);
	end component;
	component logic_block is
		port
		(
			a : in std_logic;
	    b : in std_logic;
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

	signal a_lower_b_bitwise: std_logic_vector(1 downto 0);
  signal a_lower_equal_b_bitwise: std_logic_vector(1 downto 0);

begin
  b0: logic_block port map (a => a(0), b => b(0), a_lower_b => a_lower_b_bitwise(0), a_lower_equal_b => a_lower_equal_b_bitwise(0));
  b1: logic_block_signed port map (a => a(1), b => b(1), is_signed => is_signed, a_lower_b => a_lower_b_bitwise(1), a_lower_equal_b => a_lower_equal_b_bitwise(1));
  mux: multiplexer_block port map (i_a_lower_b => a_lower_b_bitwise, i_a_lower_equal_b => a_lower_equal_b_bitwise, o_a_lower_b => a_lower_b, o_a_lower_equal_b => a_lower_equal_b);
end Behavioral;
