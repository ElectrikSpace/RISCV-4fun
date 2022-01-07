library ieee;
use ieee.std_logic_1164.all;

entity incrementer_16_bits_by_4 is
	port
	(
		i : in std_logic_vector(15 downto 0);
    o : out std_logic_vector(15 downto 0)
	);
end incrementer_16_bits_by_4;

architecture Behavioral of incrementer_16_bits_by_4 is
	component half_adder is
    port (a: in std_logic;
          c_in: in std_logic;
          o: out std_logic;
          c_out: out std_logic
				 );
	end component;
	signal carries : std_logic_vector(15 downto 3);
begin
	o(0) <= i(0);
	o(1) <= i(1);
	o(2) <= NOT i(2);
	carries(3) <= i(2);
	ha1: half_adder port map (a => i(3), c_in => carries(3), o => o(3), c_out => carries(4));
	ha2: half_adder port map (a => i(4), c_in => carries(4), o => o(4), c_out => carries(5));
	ha3: half_adder port map (a => i(5), c_in => carries(5), o => o(5), c_out => carries(6));
	ha4: half_adder port map (a => i(6), c_in => carries(6), o => o(6), c_out => carries(7));
	ha5: half_adder port map (a => i(7), c_in => carries(7), o => o(7), c_out => carries(8));
	ha6: half_adder port map (a => i(8), c_in => carries(8), o => o(8), c_out => carries(9));
	ha7: half_adder port map (a => i(9), c_in => carries(9), o => o(9), c_out => carries(10));
	ha8: half_adder port map (a => i(10), c_in => carries(10), o => o(10), c_out => carries(11));
	ha9: half_adder port map (a => i(11), c_in => carries(11), o => o(11), c_out => carries(12));
	ha10: half_adder port map (a => i(12), c_in => carries(12), o => o(12), c_out => carries(13));
	ha11: half_adder port map (a => i(13), c_in => carries(13), o => o(13), c_out => carries(14));
	ha12: half_adder port map (a => i(14), c_in => carries(14), o => o(14), c_out => carries(15));
	ha13: half_adder port map (a => i(15), c_in => carries(15), o => o(15), c_out => open);
end Behavioral;
