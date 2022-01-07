library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_block_2_bits_signed is
end tb_block_2_bits_signed;

architecture test_bench of tb_block_2_bits_signed is
  component block_2_bits_signed is
    port
  	(
  		a : in std_logic_vector(1 downto 0);
      b : in std_logic_vector(1 downto 0);
      is_signed : in std_logic;
      a_lower_b : out std_logic;
      a_lower_equal_b : out std_logic
  	);
  end component;

  signal a, b: std_logic_vector(1 downto 0);
  signal a_lower_b, a_lower_equal_b: std_logic;
  signal is_signed : std_logic;

  begin
    used_block_2_bits_signed: block_2_bits_signed port map (
      a => a,
      b => b,
      is_signed => is_signed,
      a_lower_b => a_lower_b,
      a_lower_equal_b => a_lower_equal_b
    );
    process
    begin
      a <= "00";
      b <= "00";
      is_signed <= '0';

      for i in 0 to 3 loop
        for j in 0 to 3 loop
          wait for 5 ns;
          b <= std_logic_vector(unsigned(b)+1);
        end loop;
        a <= std_logic_vector(unsigned(a)+1);
      end loop;

      a <= "00";
      b <= "00";
      is_signed <= '1';

      for i in 0 to 3 loop
        for j in 0 to 3 loop
          wait for 5 ns;
          b <= std_logic_vector(unsigned(b)+1);
        end loop;
        a <= std_logic_vector(unsigned(a)+1);
      end loop;

      wait;
    end process;
end architecture;
