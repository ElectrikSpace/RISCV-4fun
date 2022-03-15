library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity upgraded_full_adder is
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
end upgraded_full_adder;

architecture Behavioral of upgraded_full_adder is
begin
  o <= a XOR b XOR c_in;
  c_out <= (a AND b) OR (c_in AND a) OR (c_in AND b) ;
	c_p <= a OR b;
	c_g <= a AND b;

	-- il est alors facile de construire un additionneur parallèle avec r1 = g0 ou ( p0 et r0 )

end Behavioral;
