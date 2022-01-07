library ieee;
use ieee.std_logic_1164.all;

entity logic_unit is
	port
	(
		a : in std_logic_vector(31 downto 0);
    b : in std_logic_vector(31 downto 0);
    o : out std_logic_vector(31 downto 0);
    opcode : in std_logic_vector(1 downto 0)
	);
end logic_unit;

architecture Behavioral of logic_unit is
  component logic_bloc_1_bit is
    port (a: in std_logic;
          b: in std_logic;
          o: out std_logic;
          opcode: in std_logic_vector(1 downto 0));
	end component;
begin
  b0: logic_bloc_1_bit port map (a => a(0), b => b(0), o => o(0), opcode => opcode);
  b1: logic_bloc_1_bit port map (a => a(1), b => b(1), o => o(1), opcode => opcode);
  b2: logic_bloc_1_bit port map (a => a(2), b => b(2), o => o(2), opcode => opcode);
  b3: logic_bloc_1_bit port map (a => a(3), b => b(3), o => o(3), opcode => opcode);
  b4: logic_bloc_1_bit port map (a => a(4), b => b(4), o => o(4), opcode => opcode);
  b5: logic_bloc_1_bit port map (a => a(5), b => b(5), o => o(5), opcode => opcode);
  b6: logic_bloc_1_bit port map (a => a(6), b => b(6), o => o(6), opcode => opcode);
  b7: logic_bloc_1_bit port map (a => a(7), b => b(7), o => o(7), opcode => opcode);
  b8: logic_bloc_1_bit port map (a => a(8), b => b(8), o => o(8), opcode => opcode);
  b9: logic_bloc_1_bit port map (a => a(9), b => b(9), o => o(9), opcode => opcode);
  b10: logic_bloc_1_bit port map (a => a(10), b => b(10), o => o(10), opcode => opcode);
  b11: logic_bloc_1_bit port map (a => a(11), b => b(11), o => o(11), opcode => opcode);
  b12: logic_bloc_1_bit port map (a => a(12), b => b(12), o => o(12), opcode => opcode);
  b13: logic_bloc_1_bit port map (a => a(13), b => b(13), o => o(13), opcode => opcode);
  b14: logic_bloc_1_bit port map (a => a(14), b => b(14), o => o(14), opcode => opcode);
  b15: logic_bloc_1_bit port map (a => a(15), b => b(15), o => o(15), opcode => opcode);
  b16: logic_bloc_1_bit port map (a => a(16), b => b(16), o => o(16), opcode => opcode);
  b17: logic_bloc_1_bit port map (a => a(17), b => b(17), o => o(17), opcode => opcode);
  b18: logic_bloc_1_bit port map (a => a(18), b => b(18), o => o(18), opcode => opcode);
  b19: logic_bloc_1_bit port map (a => a(19), b => b(19), o => o(19), opcode => opcode);
  b20: logic_bloc_1_bit port map (a => a(20), b => b(20), o => o(20), opcode => opcode);
  b21: logic_bloc_1_bit port map (a => a(21), b => b(21), o => o(21), opcode => opcode);
  b22: logic_bloc_1_bit port map (a => a(22), b => b(22), o => o(22), opcode => opcode);
  b23: logic_bloc_1_bit port map (a => a(23), b => b(23), o => o(23), opcode => opcode);
  b24: logic_bloc_1_bit port map (a => a(24), b => b(24), o => o(24), opcode => opcode);
  b25: logic_bloc_1_bit port map (a => a(25), b => b(25), o => o(25), opcode => opcode);
  b26: logic_bloc_1_bit port map (a => a(26), b => b(26), o => o(26), opcode => opcode);
  b27: logic_bloc_1_bit port map (a => a(27), b => b(27), o => o(27), opcode => opcode);
  b28: logic_bloc_1_bit port map (a => a(28), b => b(28), o => o(28), opcode => opcode);
  b29: logic_bloc_1_bit port map (a => a(29), b => b(29), o => o(29), opcode => opcode);
  b30: logic_bloc_1_bit port map (a => a(30), b => b(30), o => o(30), opcode => opcode);
  b31: logic_bloc_1_bit port map (a => a(31), b => b(31), o => o(31), opcode => opcode);
end Behavioral;
