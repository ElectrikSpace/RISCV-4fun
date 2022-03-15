library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_upgraded_full_adder is
end tb_upgraded_full_adder;

architecture Behavioral of tb_upgraded_full_adder is
	component upgraded_full_adder
		port
		(
			a : in std_logic;
			b : in std_logic;
			c_in : in std_logic;
			o : out std_logic;
			c_out : out std_logic;
			c_p : out std_logic; -- propagée
			c_g : out std_logic -- générée
		);
	end component;
	signal a, b, c_in, o, c_out, c_p, c_g : std_logic;
begin
	used_upgraded_full_adder: upgraded_full_adder port map (a => a, b => b, c_in => c_in, o => o, c_out => c_out, c_p => c_p, c_g => c_g);
	process begin
		 a <= '0';
		 b <= '0';
		 c_in <= '0';
		 wait for 1 ns;

		 a <= '0';
		 b <= '0';
		 c_in <= '1';
		 wait for 1 ns;

		 a <= '0';
		 b <= '1';
		 c_in <= '0';
		 wait for 1 ns;

		 a <= '0';
		 b <= '1';
		 c_in <= '1';
		 wait for 1 ns;

		 a <= '1';
		 b <= '0';
		 c_in <= '0';
		 wait for 1 ns;

		 a <= '1';
		 b <= '0';
		 c_in <= '1';
		 wait for 1 ns;

		 a <= '1';
		 b <= '1';
		 c_in <= '0';
		 wait for 1 ns;

		 a <= '1';
		 b <= '1';
		 c_in <= '1';
		 wait for 1 ns;

		 wait;
	end process;
end Behavioral;
