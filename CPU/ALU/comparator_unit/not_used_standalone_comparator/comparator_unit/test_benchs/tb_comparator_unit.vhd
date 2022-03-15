library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_comparator_unit is
end tb_comparator_unit;

architecture test_bench of tb_comparator_unit is
  component comparator_unit is
    port
  	(
  		a : in std_logic_vector(31 downto 0);
      b : in std_logic_vector(31 downto 0);
  		is_signed : in std_logic;
  		opcode: in std_logic_vector(1 downto 0);
      o : out std_logic_vector(31 downto 0)
  	);
  end component;

  signal a, b, o: std_logic_vector(31 downto 0);
  signal opcode: std_logic_vector(1 downto 0);
  signal is_signed: std_logic;

  begin
    used_comparator_unit: comparator_unit port map (
      a => a,
      b => b,
      is_signed => is_signed,
      opcode => opcode,
      o => o
    );
    process
    begin
      opcode <= "00";

      a <= "00000000000000000000000000000000";
      b <= "00000000000000000000000000000000";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      a <= "11111111111111111111111111111111";
      b <= "11111111111111111111111111111111";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      a <= "00000000000000000000000000000000";
      b <= "11111111111111111111111111111111";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      a <= "11111111111111111111111111111111";
      b <= "00000000000000000000000000000000";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      a <= "11100001010111011010011011001010";
      b <= "00000000000000001011001010010101";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      a <= "00000000000000001011001010010101";
      b <= "11100001010111011010011011001010";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      a <= "00000000000000001011001010010101";
      b <= "00000000000101100110110101101000";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      a <= "00000000000101100110110101101000";
      b <= "00000000000000001011001010010101";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      a <= "11111001010010101010101010101000";
      b <= "11111001100101010101010101011110";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      a <= "11111001100101010101010101011110";
      b <= "11111001010010101010101010101000";
      is_signed <= '0';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;
      is_signed <= '1';
      for i in 0 to 3 loop
        wait for 5 ns;
        opcode <= std_logic_vector(unsigned(opcode)+1);
      end loop;

      wait;
    end process;
end architecture;
