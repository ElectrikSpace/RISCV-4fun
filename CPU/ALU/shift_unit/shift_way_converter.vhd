library ieee;
use ieee.std_logic_1164.all;

entity shift_way_converter is
	port
	(
		a : in std_logic_vector(31 downto 0);
    is_right_shift : in std_logic;
    o : out std_logic_vector(31 downto 0)
	);
end shift_way_converter;

architecture Behavioral of shift_way_converter is
	component multiplexer_2_to_1 is
    port (a: in std_logic;
          b: in std_logic;
          selector: in std_logic;
          o: out std_logic
				 );
	end component;
begin
	mux0: multiplexer_2_to_1 port map (a => a(31), b => a(0), o => o(0), selector => is_right_shift);
	mux1: multiplexer_2_to_1 port map (a => a(30), b => a(1), o => o(1), selector => is_right_shift);
	mux2: multiplexer_2_to_1 port map (a => a(29), b => a(2), o => o(2), selector => is_right_shift);
	mux3: multiplexer_2_to_1 port map (a => a(28), b => a(3), o => o(3), selector => is_right_shift);
	mux4: multiplexer_2_to_1 port map (a => a(27), b => a(4), o => o(4), selector => is_right_shift);
	mux5: multiplexer_2_to_1 port map (a => a(26), b => a(5), o => o(5), selector => is_right_shift);
	mux6: multiplexer_2_to_1 port map (a => a(25), b => a(6), o => o(6), selector => is_right_shift);
	mux7: multiplexer_2_to_1 port map (a => a(24), b => a(7), o => o(7), selector => is_right_shift);
	mux8: multiplexer_2_to_1 port map (a => a(23), b => a(8), o => o(8), selector => is_right_shift);
	mux9: multiplexer_2_to_1 port map (a => a(22), b => a(9), o => o(9), selector => is_right_shift);
	mux10: multiplexer_2_to_1 port map (a => a(21), b => a(10), o => o(10), selector => is_right_shift);
	mux11: multiplexer_2_to_1 port map (a => a(20), b => a(11), o => o(11), selector => is_right_shift);
	mux12: multiplexer_2_to_1 port map (a => a(19), b => a(12), o => o(12), selector => is_right_shift);
	mux13: multiplexer_2_to_1 port map (a => a(18), b => a(13), o => o(13), selector => is_right_shift);
	mux14: multiplexer_2_to_1 port map (a => a(17), b => a(14), o => o(14), selector => is_right_shift);
	mux15: multiplexer_2_to_1 port map (a => a(16), b => a(15), o => o(15), selector => is_right_shift);
	mux16: multiplexer_2_to_1 port map (a => a(15), b => a(16), o => o(16), selector => is_right_shift);
	mux17: multiplexer_2_to_1 port map (a => a(14), b => a(17), o => o(17), selector => is_right_shift);
	mux18: multiplexer_2_to_1 port map (a => a(13), b => a(18), o => o(18), selector => is_right_shift);
	mux19: multiplexer_2_to_1 port map (a => a(12), b => a(19), o => o(19), selector => is_right_shift);
	mux20: multiplexer_2_to_1 port map (a => a(11), b => a(20), o => o(20), selector => is_right_shift);
	mux21: multiplexer_2_to_1 port map (a => a(10), b => a(21), o => o(21), selector => is_right_shift);
	mux22: multiplexer_2_to_1 port map (a => a(9), b => a(22), o => o(22), selector => is_right_shift);
	mux23: multiplexer_2_to_1 port map (a => a(8), b => a(23), o => o(23), selector => is_right_shift);
	mux24: multiplexer_2_to_1 port map (a => a(7), b => a(24), o => o(24), selector => is_right_shift);
	mux25: multiplexer_2_to_1 port map (a => a(6), b => a(25), o => o(25), selector => is_right_shift);
	mux26: multiplexer_2_to_1 port map (a => a(5), b => a(26), o => o(26), selector => is_right_shift);
	mux27: multiplexer_2_to_1 port map (a => a(4), b => a(27), o => o(27), selector => is_right_shift);
	mux28: multiplexer_2_to_1 port map (a => a(3), b => a(28), o => o(28), selector => is_right_shift);
	mux29: multiplexer_2_to_1 port map (a => a(2), b => a(29), o => o(29), selector => is_right_shift);
	mux30: multiplexer_2_to_1 port map (a => a(1), b => a(30), o => o(30), selector => is_right_shift);
	mux31: multiplexer_2_to_1 port map (a => a(0), b => a(31), o => o(31), selector => is_right_shift);
end Behavioral;
