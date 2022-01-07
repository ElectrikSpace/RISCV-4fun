library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_ALU is
end tb_ALU;

architecture test_bench of tb_ALU is
  component ALU is
    port
    (
      a : in std_logic_vector(31 downto 0);
      b : in std_logic_vector(31 downto 0);
      unit_selector : in std_logic_vector(1 downto 0);
      shift_unit_opcode : in std_logic_vector(1 downto 0);
      logic_unit_opcode : in std_logic_vector(1 downto 0);
      arithmetic_unit_opcode : in std_logic;
      comparator_unit_opcode : in std_logic_vector(2 downto 0);
      o : out std_logic_vector(31 downto 0)
    );
  end component;

  signal a, b, o : std_logic_vector(31 downto 0);
  signal unit_selector : std_logic_vector(1 downto 0);
  signal shift_unit_opcode : std_logic_vector(1 downto 0);
  signal logic_unit_opcode : std_logic_vector(1 downto 0);
  signal arithmetic_unit_opcode : std_logic;
  signal comparator_unit_opcode : std_logic_vector(2 downto 0);

  begin
    used_ALU : ALU port map (
      a => a,
      b => b,
      unit_selector => unit_selector,
      shift_unit_opcode => shift_unit_opcode,
      logic_unit_opcode => logic_unit_opcode,
      arithmetic_unit_opcode => arithmetic_unit_opcode,
      comparator_unit_opcode => comparator_unit_opcode,
      o => o
    );

    process
    begin
      a <= "10101001010010101010011111001010";
      b <= "10100101010101011011111101110001";
      shift_unit_opcode <= "00";
      logic_unit_opcode <= "00";
      arithmetic_unit_opcode <= '0';
      comparator_unit_opcode <= "000";

      unit_selector <= "00";
      for i in 0 to 127 loop
        wait for 5 ns;
        shift_unit_opcode <= std_logic_vector(unsigned(shift_unit_opcode)+1);
      end loop;

      unit_selector <= "01";
      for i in 0 to 3 loop
        wait for 5 ns;
        logic_unit_opcode <= std_logic_vector(unsigned(logic_unit_opcode)+1);
      end loop;

      unit_selector <= "10";
      wait for 5 ns;
      arithmetic_unit_opcode <= '1';
      wait for 5 ns;

      unit_selector <= "11";
      for i in 0 to 7 loop
        wait for 5 ns;
        comparator_unit_opcode <= std_logic_vector(unsigned(comparator_unit_opcode)+1);
      end loop;

      wait;
    end process;
end architecture;
