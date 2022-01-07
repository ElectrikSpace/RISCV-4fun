library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_multiplexer_row_b1 is
end tb_multiplexer_row_b1;

architecture test_bench of tb_multiplexer_row_b1 is
  component multiplexer_row_b1 is
    port
  	(
      a : in std_logic_vector(31 downto 0);
  		selector : in std_logic;
      shifted_bit: in std_logic;
      o : out std_logic_vector(33 downto 0)
  	);
  end component;

  signal a : std_logic_vector(31 downto 0);
  signal o : std_logic_vector(33 downto 0);
  signal selector, shifted_bit: std_logic;

  begin
    used_multiplexer_row: multiplexer_row_b1 port map (
      a => a,
      selector => selector,
      shifted_bit => shifted_bit,
      o => o
    );

    process
    begin
        a <= "00000000000000000000000000000000";
        selector <= '0';
        shifted_bit <= '0';
        wait for 5 ns;
        shifted_bit <= '1';
        wait for 5 ns;
        selector <= '1';
        wait for 5 ns;
        shifted_bit <= '0';
        wait for 5 ns;

        a <= "11111111111111111111111111111111";
        selector <= '0';
        shifted_bit <= '0';
        wait for 5 ns;
        shifted_bit <= '1';
        wait for 5 ns;
        selector <= '1';
        wait for 5 ns;
        shifted_bit <= '0';
        wait for 5 ns;

        a <= "10101010101010101010101010101010";
        selector <= '0';
        shifted_bit <= '0';
        wait for 5 ns;
        shifted_bit <= '1';
        wait for 5 ns;
        selector <= '1';
        wait for 5 ns;
        shifted_bit <= '0';
        wait for 5 ns;

        a <= "01010101010101010101010101010101";
        selector <= '0';
        shifted_bit <= '0';
        wait for 5 ns;
        shifted_bit <= '1';
        wait for 5 ns;
        selector <= '1';
        wait for 5 ns;
        shifted_bit <= '0';
        wait for 5 ns;

        wait;
    end process;

end architecture;
