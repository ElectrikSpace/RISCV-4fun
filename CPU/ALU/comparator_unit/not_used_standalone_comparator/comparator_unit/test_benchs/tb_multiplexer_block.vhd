library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_multiplexer_block is
end tb_multiplexer_block;

architecture test_bench of tb_multiplexer_block is
  component multiplexer_block is
    port
  	(
  		i_a_lower_b : in std_logic_vector(1 downto 0);
      i_a_lower_equal_b : in std_logic_vector(1 downto 0);
      o_a_lower_b : out std_logic;
      o_a_lower_equal_b : out std_logic
  	);
  end component;

  signal i_a_lower_b, i_a_lower_equal_b: std_logic_vector(1 downto 0);
  signal o_a_lower_b, o_a_lower_equal_b: std_logic;

  begin
    used_multiplexer_block: multiplexer_block port map(
    i_a_lower_b => i_a_lower_b,
    i_a_lower_equal_b => i_a_lower_equal_b,
    o_a_lower_b => o_a_lower_b,
    o_a_lower_equal_b => o_a_lower_equal_b
    );

    process
    begin
      i_a_lower_b <= "00";
      i_a_lower_equal_b <= "00";

      for k in 0 to 3 loop
        for j in 0 to 3 loop
          wait for 5 ns;
          i_a_lower_equal_b <= std_logic_vector(unsigned(i_a_lower_equal_b)+1);
        end loop;
        i_a_lower_b <= std_logic_vector(unsigned(i_a_lower_b)+1);
      end loop;

      wait;

    end process;
end architecture;
