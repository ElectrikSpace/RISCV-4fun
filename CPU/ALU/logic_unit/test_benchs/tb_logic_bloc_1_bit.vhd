library ieee;
use ieee.std_logic_1164.all;

entity tb_logic_bloc_1_bit is
end tb_logic_bloc_1_bit;

architecture test_bench of tb_logic_bloc_1_bit is
  component logic_bloc_1_bit is
    port (
      a : in std_logic;
      b : in std_logic;
      o : out std_logic;
      opcode : in std_logic_vector(1 downto 0)
    );
  end component;

  signal a, b, o: std_logic;
  signal opcode: std_logic_vector(1 downto 0);

  begin
    used_logic_bloc: logic_bloc_1_bit port map(
      a => a,
      b => b,
      o => o,
      opcode => opcode
    );

    process
    begin
      a <= '0';
      b <= '0';

      opcode <= "00";
      wait for 5 ns;
      a <= '1';
      wait for 5 ns;
      b <= '1';
      wait for 5 ns;
      a <= '0';
      wait for 5 ns;

      opcode <= "01";
      b <= '0';
      wait for 5 ns;
      a <= '1';
      wait for 5 ns;
      b <= '1';
      wait for 5 ns;
      a <= '0';
      wait for 5 ns;

      opcode <= "10";
      b <= '0';
      wait for 5 ns;
      a <= '1';
      wait for 5 ns;
      b <= '1';
      wait for 5 ns;
      a <= '0';
      wait for 5 ns;

      opcode <= "11";
      b <= '0';
      wait for 5 ns;
      a <= '1';
      wait for 5 ns;
      b <= '1';
      wait for 5 ns;
      a <= '0';
      wait for 5 ns;

      wait;

    end process;
end architecture;
