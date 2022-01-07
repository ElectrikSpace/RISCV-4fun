library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_block_4_bits_serial is
	port
	(
		a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    c_in : in std_logic;
    o : out std_logic_vector(3 downto 0);
		c_p : out std_logic; -- propagée
		c_g : out std_logic -- générée
	);
end adder_block_4_bits_serial;

architecture Behavioral of adder_block_4_bits_serial is
  component upgraded_full_adder is
		port
		(
			a : in std_logic;
	    b : in std_logic;
	    c_in : in std_logic;
	    o : out std_logic;
	    c_out : out std_logic;
			c_p : out std_logic; -- propagée
			c_g : out std_logic -- générée
		);
	end component;

	component carry_generator is
		port
		(
			c_p_in : in std_logic_vector(3 downto 0);
	    c_g_in : in std_logic_vector(3 downto 0);
			c_p_out : out std_logic; -- propagée
			c_g_out : out std_logic -- générée
		);
	end component;

  signal inside_c: std_logic_vector(2 downto 0);
  signal sub_c_p : std_logic_vector(3 downto 0);
  signal sub_c_g : std_logic_vector(3 downto 0);

begin
  u1: upgraded_full_adder port map (a => a(0), b => b(0), c_in => c_in, o => o(0), c_out => inside_c(0), c_p => sub_c_p(0), c_g => sub_c_g(0));
  u2: upgraded_full_adder port map (a => a(1), b => b(1), c_in => inside_c(0), o => o(1), c_out => inside_c(1), c_p => sub_c_p(1), c_g => sub_c_g(1));
  u3: upgraded_full_adder port map (a => a(2), b => b(2), c_in => inside_c(1), o => o(2), c_out => inside_c(2), c_p => sub_c_p(2), c_g => sub_c_g(2));
  u4: upgraded_full_adder port map (a => a(3), b => b(3), c_in => inside_c(2), o => o(3), c_out => open, c_p => sub_c_p(3), c_g => sub_c_g(3));
  c1: carry_generator port map (c_p_in => sub_c_p, c_g_in => sub_c_g, c_p_out => c_p, c_g_out => c_g);
end Behavioral;
