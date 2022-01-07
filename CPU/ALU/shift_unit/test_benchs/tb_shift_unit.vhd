library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_shift_unit is
end tb_shift_unit;

architecture test_bench of tb_shift_unit is
  component shift_unit is
    port
  	(
      a : in std_logic_vector(31 downto 0);
  		opcode : in std_logic_vector(4 downto 0);
  		is_right_shift : in std_logic;
  		is_arithmetic_shift : in std_logic;
      o : out std_logic_vector(31 downto 0)
  	);
  end component;

  signal a, o: std_logic_vector(31 downto 0);
  signal opcode: std_logic_vector(4 downto 0);
  signal is_right_shift, is_arithmetic_shift: std_logic;

  begin
    used_shift_unit: shift_unit port map (
      a => a,
      opcode => opcode,
      is_right_shift => is_right_shift,
      is_arithmetic_shift => is_arithmetic_shift,
      o => o
    );
    process
    begin
      a <= "00000000000000000000000000000000";
      opcode <= "00000";
      is_right_shift <= '0';
      is_arithmetic_shift <= '0';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '0';
      is_arithmetic_shift <= '1';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '1';
      is_arithmetic_shift <= '0';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '1';
      is_arithmetic_shift <= '1';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;

      a <= "11111111111111111111111111111111";
      opcode <= "00000";
      is_right_shift <= '0';
      is_arithmetic_shift <= '0';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '0';
      is_arithmetic_shift <= '1';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '1';
      is_arithmetic_shift <= '0';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '1';
      is_arithmetic_shift <= '1';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;

      a <= "10101010101010101010101010101010";
      opcode <= "00000";
      is_right_shift <= '0';
      is_arithmetic_shift <= '0';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '0';
      is_arithmetic_shift <= '1';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '1';
      is_arithmetic_shift <= '0';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '1';
      is_arithmetic_shift <= '1';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;

      a <= "01010101010101010101010101010101";
      opcode <= "00000";
      is_right_shift <= '0';
      is_arithmetic_shift <= '0';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '0';
      is_arithmetic_shift <= '1';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '1';
      is_arithmetic_shift <= '0';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;
      opcode <= "00000";
      is_right_shift <= '1';
      is_arithmetic_shift <= '1';
      wait for 5 ns;
      for i in 1 to 31 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;

      wait;
    end process;
end architecture;
