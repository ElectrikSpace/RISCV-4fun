library ieee;
use ieee.std_logic_1164.all;

entity counter_4_bits is
  port (
    clk : in std_logic;
    clk_enable : in std_logic;
    reset : in std_logic;
    counter_value : out std_logic_vector(3 downto 0)
  );
end counter_4_bits;

architecture Behavioral of counter_4_bits is

  component half_adder is
    port
  	(
  			a: in std_logic;
  			c_in: in std_logic;
  			o: out std_logic;
  			c_out: out std_logic
  	 );
  end component;

  signal current_value : std_logic_vector(3 downto 0) := "1011";
  signal next_value : std_logic_vector(3 downto 0);
  signal carries : std_logic_vector(2 downto 0);

begin

  counter_value <= current_value;

  ha0 : half_adder port map(
    a => current_value(0),
    c_in => '1',
    o => next_value(0),
    c_out => carries(0)
  );

  ha1 : half_adder port map(
    a => current_value(1),
    c_in => carries(0),
    o => next_value(1),
    c_out => carries(1)
  );

  ha2 : half_adder port map(
    a => current_value(2),
    c_in => carries(1),
    o => next_value(2),
    c_out => carries(2)
  );

  ha3 : half_adder port map(
    a => current_value(3),
    c_in => carries(2),
    o => next_value(3),
    c_out => open
  );

  process(clk)
  begin
    if rising_edge(clk) then
      if reset='1' then
        current_value <= "0000";
      else
        if clk_enable='1' then
          current_value <= next_value;
        end if;
      end if;
    end if;
  end process;

end architecture;
