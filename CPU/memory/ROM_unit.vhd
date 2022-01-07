library ieee;
use ieee.std_logic_1164.all;

entity ROM_unit is
  port(
    clk : in std_logic;
    ROM_out_bus : out std_logic_vector(31 downto 0);
    memory_address : in std_logic_vector(31 downto 0);
    is_writeback_state : in std_logic;
    next_PC_address : in std_logic_vector(31 downto 0);
    current_instruction : out std_logic_vector(31 downto 0)
  );
end ROM_unit;

architecture Behavioral of ROM_unit is

  component ROM_block is
    PORT(
  		address_a		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
  		address_b		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
  		clock_a		: IN STD_LOGIC  := '1';
  		clock_b		: IN STD_LOGIC ;
  		enable_a		: IN STD_LOGIC  := '1';
  		enable_b		: IN STD_LOGIC  := '1';
  		q_a		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
  		q_b		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  	);
  end component;

begin

  ROM_instance : ROM_block port map (
  address_a	 => next_PC_address(10 downto 2),
  address_b	 => memory_address(10 downto 2),
  clock_a	 => clk,
  clock_b	 => clk,
  enable_a	 => is_writeback_state,
  enable_b	 => '1',
  q_a	 => current_instruction,
  q_b	 => ROM_out_bus
	);

end architecture;
