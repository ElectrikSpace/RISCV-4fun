library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arithmetic_unit is
	port
	(
		a : in std_logic_vector(31 downto 0);
    b : in std_logic_vector(31 downto 0);
    is_sub : in std_logic;
    o : out std_logic_vector(31 downto 0)
    --c_out : out std_logic
	);
end arithmetic_unit;

architecture Behavioral of arithmetic_unit is
	component sub_converter is
    port (i: in std_logic_vector(31 downto 0);
          is_sub: in std_logic;
          o: out std_logic_vector(31 downto 0)
		);
	end component;

	component adder_block_16_bits is
		port
		(
			a : in std_logic_vector(15 downto 0);
	    b : in std_logic_vector(15 downto 0);
	    c_in : in std_logic;
	    o : out std_logic_vector(15 downto 0);
			c_p : out std_logic; -- propagée
			c_g : out std_logic -- générée
		);
	end component;

	component two_wide_carry_manager is
		port (
	    c_p_in : in std_logic_vector(1 downto 0);
	    c_g_in : in std_logic_vector(1 downto 0);
	    c_in : in std_logic;
	    inside_c : out std_logic_vector(1 downto 0);
	    c_p_out : out std_logic;
	    c_g_out : out std_logic
	  );
	end component;

	signal c_in : std_logic;
  signal inside_c : std_logic_vector(1 downto 0);
  signal sub_c_p : std_logic_vector(1 downto 0);
  signal sub_c_g : std_logic_vector(1 downto 0);
	signal b_sub_compliant : std_logic_vector(31 downto 0);
	-- signal c_p : std_logic;
	-- signal c_g : std_logic;
begin
	c_in <= is_sub;
	sub_compliance: sub_converter port map (i => b, is_sub => is_sub, o => b_sub_compliant);
	u1: adder_block_16_bits port map (a => a(15 downto 0), b => b_sub_compliant(15 downto 0), c_in => inside_c(0), o => o(15 downto 0), c_p => sub_c_p(0), c_g => sub_c_g(0));
  u2: adder_block_16_bits port map (a => a(31 downto 16), b => b_sub_compliant(31 downto 16), c_in => inside_c(1), o => o(31 downto 16), c_p => sub_c_p(1), c_g => sub_c_g(1));
	c1: two_wide_carry_manager port map (c_p_in => sub_c_p, c_g_in => sub_c_g, c_in => c_in, inside_c => inside_c, c_p_out => open, c_g_out => open);
	-- c1: two_wide_carry_manager port map (c_p_in => sub_c_p, c_g_in => sub_c_g, c_in => c_in, inside_c => inside_c, c_p_out => c_p, c_g_out => c_g);
	-- c_out <= c_g OR (c_p AND c_in)
end Behavioral;
