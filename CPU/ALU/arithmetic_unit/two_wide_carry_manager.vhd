library ieee;
use ieee.std_logic_1164.all;

entity two_wide_carry_manager is
  port (
    c_p_in : in std_logic_vector(1 downto 0);
    c_g_in : in std_logic_vector(1 downto 0);
    c_in : in std_logic;
    inside_c : out std_logic_vector(1 downto 0);
    c_p_out : out std_logic;
    c_g_out : out std_logic
  );
end two_wide_carry_manager;

architecture Behavioral of two_wide_carry_manager is
  begin
    inside_c(0) <= c_in;
    inside_c(1) <= c_g_in(0) OR (c_p_in(0) AND c_in);
    c_p_out <= c_p_in(0) AND c_p_in(1);
    c_g_out <= c_g_in(1) OR (c_g_in(0) AND c_p_in(1));
end architecture;
