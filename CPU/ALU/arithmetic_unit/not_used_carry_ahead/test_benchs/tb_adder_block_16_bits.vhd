library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_adder_block_16_bits is
end tb_adder_block_16_bits;

architecture test_bench of tb_adder_block_16_bits is
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

  signal a, b, o: std_logic_vector(15 downto 0);
  signal c_in, c_out, c_p, c_g: std_logic;

  begin
    used_adder_block_16_bits: adder_block_16_bits port map (
      a => a,
      b => b,
      c_in => c_in,
      o => o,
      c_p => c_p,
      c_g => c_g
    );

    process
    begin
      a <= "0000000000000000";
      b <= "0000000000000000";
      c_in <= '0';
      for i in 0 to 255 loop
        for j in 0 to 2550 loop
          wait for 5 ns;
          b <= std_logic_vector(unsigned(b)+1);
        end loop;
        a <= std_logic_vector(unsigned(a)+1);
      end loop;

      a <= "0000000000000000";
      b <= "0000000000000000";
      c_in <= '1';
      for i in 0 to 255 loop
        for j in 0 to 2550 loop
          wait for 5 ns;
          b <= std_logic_vector(unsigned(b)+1);
        end loop;
        a <= std_logic_vector(unsigned(a)+1);
      end loop;

      wait;
    end process;
end architecture;
