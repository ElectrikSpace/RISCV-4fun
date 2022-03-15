library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_multiplexer_4_to_1 is
end tb_multiplexer_4_to_1;

architecture test_bench of tb_multiplexer_4_to_1 is
  component multiplexer_4_to_1 is
    port (
      selector : in std_logic_vector(1 downto 0);
      i : in std_logic_vector(3 downto 0);
      o : out std_logic
    );
  end component;

  signal o: std_logic;
  signal i: std_logic_vector(3 downto 0);
  signal selector: std_logic_vector(1 downto 0);

  begin
    used_multiplexer: multiplexer_4_to_1 port map(
      i => i,
      o => o,
      selector => selector
    );

    process
    begin
      selector <= "00";

      for k in 0 to 3 loop
        i <= "0000";
        wait for 5 ns;
        for j in 1 to 15 loop
          i <= std_logic_vector(unsigned(i)+1);
          wait for 5 ns;
        end loop;
        selector <= std_logic_vector(unsigned(selector)+1);
      end loop;

      wait;

    end process;
end architecture;
