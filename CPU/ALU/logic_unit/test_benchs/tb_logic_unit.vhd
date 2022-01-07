library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_logic_unit is
end tb_logic_unit;

architecture test_bench of tb_logic_unit is
  component logic_unit is
    port
  	(
  		a : in std_logic_vector(31 downto 0);
      b : in std_logic_vector(31 downto 0);
      o : out std_logic_vector(31 downto 0);
      opcode : in std_logic_vector(1 downto 0)
  	);
  end component;

  signal a, b, o: std_logic_vector(31 downto 0);
  signal opcode: std_logic_vector(1 downto 0);

  begin
    used_logic_unit: logic_unit port map (
      a => a,
      b => b,
      o => o,
      opcode => opcode
    );
    process
    begin
      a <= "11001100110011001100110011001100";
      b <= "10101010101010101010101010101010";
      opcode <= "00";
      wait for 5 ns;

      for i in 0 to 2 loop
        opcode <= std_logic_vector(unsigned(opcode)+1);
        wait for 5 ns;
      end loop;

      wait;
    end process;
end architecture;
