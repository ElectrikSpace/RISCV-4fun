library ieee;
use ieee.std_logic_1164.all;

entity carry_generator is
  port
	(
		c_p_in : in std_logic_vector(3 downto 0);
    c_g_in : in std_logic_vector(3 downto 0);
		c_p_out : out std_logic; -- propagée
		c_g_out : out std_logic -- générée
	);
end carry_generator;

architecture Behavioral of carry_generator is
  begin
    c_p_out <= c_p_in(0) AND c_p_in(1) AND c_p_in(2) AND c_p_in(3);
    c_g_out <= c_g_in(3) OR (c_g_in(2) AND c_p_in(3)) OR (c_g_in(1) AND c_p_in(3) AND c_p_in(2)) OR (c_g_in(0) AND c_p_in(3) AND c_p_in(2) AND c_p_in(1));
end architecture;
