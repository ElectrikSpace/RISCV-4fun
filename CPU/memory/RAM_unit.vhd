library ieee;
use ieee.std_logic_1164.all;

entity RAM_unit is
  port (
    clk : in std_logic;
    memory_in_bus : in std_logic_vector(31 downto 0);
    RAM_out_bus : out std_logic_vector(31 downto 0);
    memory_address : in std_logic_vector(31 downto 0);
    memory_wren : in std_logic;
    is_half_store : in std_logic;
    is_byte_store : in std_logic
  );
end RAM_unit;

architecture Behavioral of RAM_unit is

  component RAM_block is
    PORT
    (
      address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      byteena		: IN STD_LOGIC_VECTOR (3 DOWNTO 0) :=  (OTHERS => '1');
      clken		: IN STD_LOGIC  := '1';
      clock		: IN STD_LOGIC  := '1';
      data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wren		: IN STD_LOGIC ;
      q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  end component;

  signal is_RAM_address : std_logic;
  signal is_word_store : std_logic;
  signal wren : std_logic;
  signal byteena : std_logic_vector(3 downto 0);

begin

  is_RAM_address <= memory_address(15) AND (NOT memory_address(14));

  wren <= memory_wren AND is_RAM_address;

  is_word_store <= (NOT is_half_store) AND (NOT is_byte_store);

  byteena(3) <= is_word_store OR (memory_address(1) AND is_half_store) OR (memory_address(1) AND memory_address(0) AND is_byte_store);
  byteena(2) <= is_word_store OR (memory_address(1) AND is_half_store) OR (memory_address(1) AND (NOT memory_address(0)) AND is_byte_store);
  byteena(1) <= is_word_store OR ((NOT memory_address(1)) AND is_half_store) OR ((NOT memory_address(1)) AND memory_address(0) AND is_byte_store);
  byteena(0) <= is_word_store OR ((NOT memory_address(1)) AND is_half_store) OR ((NOT memory_address(1)) AND (NOT memory_address(0)) AND is_byte_store);
  
  RAM_block_instance : ram_block port map (
		address	 => memory_address(9 downto 2),
		byteena	 => byteena,
		clken	 => '1',
		clock	 => clk,
		data	 => memory_in_bus,
		wren	 => wren,
		q	 => RAM_out_bus
	);

end architecture;
