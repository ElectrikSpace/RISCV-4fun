library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_block_2_bits is
end tb_block_2_bits;

architecture test_bench of tb_block_2_bits is
  component block_2_bits is
    port
  	(
  		a : in std_logic_vector(1 downto 0);
      b : in std_logic_vector(1 downto 0);
      a_lower_b : out std_logic;
      a_lower_equal_b : out std_logic
  	);
  end component;

  signal a, b: std_logic_vector(1 downto 0);
  signal a_lower_b, a_lower_equal_b: std_logic;

  begin
    used_block_2_bits: block_2_bits port map (
      a => a,
      b => b,
      a_lower_b => a_lower_b,
      a_lower_equal_b => a_lower_equal_b
    );
    process
    begin
      a <= "00";
      b <= "00";

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
