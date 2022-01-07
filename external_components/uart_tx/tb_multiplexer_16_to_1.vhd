library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_multiplexer_16_to_1 is
end tb_multiplexer_16_to_1;

architecture test_bench of tb_multiplexer_16_to_1 is

  component multiplexer_16_to_1 is
    port (
      i : in std_logic_vector(15 downto 0);
      selector : in std_logic_vector(3 downto 0);
      o : out std_logic
    );
  end component;

  signal i : std_logic_vector(15 downto 0);
  signal selector : std_logic_vector(3 downto 0);
  signal o : std_logic;

begin

  used_multiplexer_16_to_1 : multiplexer_16_to_1 port map(
    i => i,
    selector => selector,
    o => o
  );

  process
  begin
    i <= "0000000000000000";
    selector <= "0000";
    wait for 10 ns;
    i(0) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "0001";
    wait for 10 ns;
    i(1) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "0010";
    wait for 10 ns;
    i(2) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "0011";
    wait for 10 ns;
    i(3) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "0100";
    wait for 10 ns;
    i(4) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "0101";
    wait for 10 ns;
    i(5) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "0110";
    wait for 10 ns;
    i(6) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "0111";
    wait for 10 ns;
    i(7) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "1000";
    wait for 10 ns;
    i(8) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "1001";
    wait for 10 ns;
    i(9) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "1010";
    wait for 10 ns;
    i(10) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "1011";
    wait for 10 ns;
    i(11) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "1100";
    wait for 10 ns;
    i(12) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "1101";
    wait for 10 ns;
    i(13) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "1110";
    wait for 10 ns;
    i(14) <= '1';
    wait for 10 ns;

    i <= "0000000000000000";
    selector <= "1111";
    wait for 10 ns;
    i(15) <= '1';
    wait for 10 ns;

    wait;
  end process;

end architecture;
