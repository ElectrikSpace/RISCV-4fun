library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_block_8_bits is
	port
	(
		a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
    c_in : in std_logic;
    o : out std_logic_vector(7 downto 0);
		c_p : out std_logic; -- propagée
		c_g : out std_logic -- générée
	);
end adder_block_8_bits;

architecture Behavioral of adder_block_8_bits is
  component adder_block_4_bits_serial is
    port
		(
			a : in std_logic_vector(3 downto 0);
	    b : in std_logic_vector(3 downto 0);
	    c_in : in std_logic;
	    o : out std_logic_vector(3 downto 0);
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

  signal inside_c: std_logic_vector(1 downto 0);
  signal sub_c_p : std_logic_vector(1 downto 0);
  signal sub_c_g : std_logic_vector(1 downto 0);
begin
  u1: adder_block_4_bits_serial port map (a => a(3 downto 0), b => b(3 downto 0), c_in => inside_c(0), o => o(3 downto 0), c_p => sub_c_p(0), c_g => sub_c_g(0));
  u2: adder_block_4_bits_serial port map (a => a(7 downto 4), b => b(7 downto 4), c_in => inside_c(1), o => o(7 downto 4), c_p => sub_c_p(1), c_g => sub_c_g(1));
  c1: two_wide_carry_manager port map (c_p_in => sub_c_p, c_g_in => sub_c_g, c_in => c_in, inside_c => inside_c, c_p_out => c_p, c_g_out => c_g);
end Behavioral;
