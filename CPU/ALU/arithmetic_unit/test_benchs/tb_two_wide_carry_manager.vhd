library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_two_wide_carry_manager is
end tb_two_wide_carry_manager;

architecture test_bench of tb_two_wide_carry_manager is
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

  signal c_p_in, c_g_in, inside_c : std_logic_vector(1 downto 0);
  signal c_in, c_p_out, c_g_out : std_logic;

  begin
    used_two_wide_carry_manager: two_wide_carry_manager port map (
      c_p_in => c_p_in,
      c_g_in => c_g_in,
      c_in => c_in,
      inside_c => inside_c,
      c_p_out => c_p_out,
      c_g_out => c_g_out
    );

    process
    begin
      c_in <= '0';
      c_p_in <= "00";
      c_g_in <= "00";
      for i in 0 to 3 loop
        for j in 0 to 3 loop
          wait for 5 ns;
          c_g_in <= std_logic_vector(unsigned(c_g_in)+1);
        end loop;
        c_p_in <= std_logic_vector(unsigned(c_p_in)+1);
      end loop;

      c_in <= '1';
      c_p_in <= "00";
      c_g_in <= "00";
      for i in 0 to 3 loop
        for j in 0 to 3 loop
          wait for 5 ns;
          c_g_in <= std_logic_vector(unsigned(c_g_in)+1);
        end loop;
        c_p_in <= std_logic_vector(unsigned(c_p_in)+1);
      end loop;

      wait;
    end process;
end architecture;
