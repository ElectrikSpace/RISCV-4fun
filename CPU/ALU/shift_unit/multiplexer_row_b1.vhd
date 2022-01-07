library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_row_b1 is
	port
	(
    a : in std_logic_vector(31 downto 0);
		selector : in std_logic;
		shifted_bit: in std_logic;
    o : out std_logic_vector(33 downto 0)
	);
end multiplexer_row_b1;

architecture Behavioral of multiplexer_row_b1 is
	component multiplexer_2_to_1 is
    port (a: in std_logic;
          b: in std_logic;
          selector: in std_logic;
          o: out std_logic
				 );
	end component;
	signal s1: std_logic_vector(1 downto 0);
begin
	s1(0) <= (NOT selector) AND a(0);
	s1(1) <= (NOT selector) AND a(1);
	o(0) <= shifted_bit OR s1(0);
	o(1) <= shifted_bit OR s1(1);
	mux0: multiplexer_2_to_1 port map (a => a(0), b => a(2), o => o(2), selector => selector);
  mux1: multiplexer_2_to_1 port map (a => a(1), b => a(3), o => o(3), selector => selector);
  mux2: multiplexer_2_to_1 port map (a => a(2), b => a(4), o => o(4), selector => selector);
	mux3: multiplexer_2_to_1 port map (a => a(3), b => a(5), o => o(5), selector => selector);
  mux4: multiplexer_2_to_1 port map (a => a(4), b => a(6), o => o(6), selector => selector);
  mux5: multiplexer_2_to_1 port map (a => a(5), b => a(7), o => o(7), selector => selector);
  mux6: multiplexer_2_to_1 port map (a => a(6), b => a(8), o => o(8), selector => selector);
  mux7: multiplexer_2_to_1 port map (a => a(7), b => a(9), o => o(9), selector => selector);
  mux8: multiplexer_2_to_1 port map (a => a(8), b => a(10), o => o(10), selector => selector);
  mux9: multiplexer_2_to_1 port map (a => a(9), b => a(11), o => o(11), selector => selector);
  mux10: multiplexer_2_to_1 port map (a => a(10), b => a(12), o => o(12), selector => selector);
  mux11: multiplexer_2_to_1 port map (a => a(11), b => a(13), o => o(13), selector => selector);
  mux12: multiplexer_2_to_1 port map (a => a(12), b => a(14), o => o(14), selector => selector);
  mux13: multiplexer_2_to_1 port map (a => a(13), b => a(15), o => o(15), selector => selector);
  mux14: multiplexer_2_to_1 port map (a => a(14), b => a(16), o => o(16), selector => selector);
  mux15: multiplexer_2_to_1 port map (a => a(15), b => a(17), o => o(17), selector => selector);
  mux16: multiplexer_2_to_1 port map (a => a(16), b => a(18), o => o(18), selector => selector);
  mux17: multiplexer_2_to_1 port map (a => a(17), b => a(19), o => o(19), selector => selector);
  mux18: multiplexer_2_to_1 port map (a => a(18), b => a(20), o => o(20), selector => selector);
  mux19: multiplexer_2_to_1 port map (a => a(19), b => a(21), o => o(21), selector => selector);
  mux20: multiplexer_2_to_1 port map (a => a(20), b => a(22), o => o(22), selector => selector);
  mux21: multiplexer_2_to_1 port map (a => a(21), b => a(23), o => o(23), selector => selector);
  mux22: multiplexer_2_to_1 port map (a => a(22), b => a(24), o => o(24), selector => selector);
  mux23: multiplexer_2_to_1 port map (a => a(23), b => a(25), o => o(25), selector => selector);
  mux24: multiplexer_2_to_1 port map (a => a(24), b => a(26), o => o(26), selector => selector);
  mux25: multiplexer_2_to_1 port map (a => a(25), b => a(27), o => o(27), selector => selector);
  mux26: multiplexer_2_to_1 port map (a => a(26), b => a(28), o => o(28), selector => selector);
  mux27: multiplexer_2_to_1 port map (a => a(27), b => a(29), o => o(29), selector => selector);
  mux28: multiplexer_2_to_1 port map (a => a(28), b => a(30), o => o(30), selector => selector);
  mux29: multiplexer_2_to_1 port map (a => a(29), b => a(31), o => o(31), selector => selector);
  mux30: multiplexer_2_to_1 port map (a => a(30), b => '0', o => o(32), selector => selector);
	mux31: multiplexer_2_to_1 port map (a => a(31), b => '0', o => o(33), selector => selector);
end Behavioral;
