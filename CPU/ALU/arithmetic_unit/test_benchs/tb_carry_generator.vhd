library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_carry_generator is
end tb_carry_generator;

architecture test_bench of tb_carry_generator is
  component carry_generator is
    port
  	(
  		c_p_in : in std_logic_vector(3 downto 0);
      c_g_in : in std_logic_vector(3 downto 0);
  		c_p_out : out std_logic; -- propagée
  		c_g_out : out std_logic -- générée
  	);
  end component;

  signal c_p_in, c_g_in: std_logic_vector(3 downto 0);
  signal c_p_out, c_g_out: std_logic;

  begin
    used_carry_generator: carry_generator port map (
      c_p_in => c_p_in,
      c_g_in => c_g_in,
      c_p_out => c_p_out,
      c_g_out => c_g_out
    );

    process
    begin
      c_p_in <= "0000";
      c_g_in <= "0000";

      for i in 0 to 15 loop
        for j in 0 to 15 loop
          wait for 5 ns;
          c_g_in <= std_logic_vector(unsigned(c_g_in)+1);
        end loop;
        c_p_in <= std_logic_vector(unsigned(c_p_in)+1);
      end loop;

      wait;
    end process;
end architecture;
