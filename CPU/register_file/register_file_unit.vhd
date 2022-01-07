library ieee;
use ieee.std_logic_1164.all;

entity register_file_unit is
  port (
    clk : in std_logic;
    register_wren_a : in std_logic;
    register_wren_b : in std_logic;
    register_address_a : in std_logic_vector(4 downto 0);
    register_address_b : in std_logic_vector(4 downto 0);
    is_load_instruction : in std_logic;
    is_sign_extended_load : in std_logic;
    is_half_load : in std_logic;
    is_byte_load : in std_logic;
    incremented_PC : in std_logic_vector(31 downto 0);
    memory_out_bus : in std_logic_vector(31 downto 0);
    alu_output : in std_logic_vector(31 downto 0);
    temporary_register_output : in std_logic_vector(31 downto 0);
    port_a_selector : in std_logic;
    port_a_output : out std_logic_vector(31 downto 0);
    port_b_output : out std_logic_vector(31 downto 0)
  );
end register_file_unit;

architecture Behavioral of register_file_unit is

  component port_A_input_manager is
    port (
      clk : in std_logic;
      memory_address : in std_logic_vector(31 downto 0);
      memory_out_bus : in std_logic_vector(31 downto 0);
      incremented_PC : in std_logic_vector(31 downto 0);
      port_A_selector : in std_logic;
      port_A_input : out std_logic_vector(31 downto 0);
      is_load_instruction : in std_logic;
      is_sign_extended_load : in std_logic;
      is_half_load : in std_logic;
      is_byte_load : in std_logic
    );
  end component;

  component x0_manager is
    port(
      clk : in std_logic;
      register_address : in std_logic_vector(4 downto 0);
      internal_register_data_output : in std_logic_vector(31 downto 0);
      register_output_data : out std_logic_vector(31 downto 0)
    );
  end component;

  component register_file_block is
    PORT
  	(
  		address_a		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
  		address_b		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
  		clock_a		: IN STD_LOGIC  := '1';
  		clock_b		: IN STD_LOGIC ;
  		data_a		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
  		data_b		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
  		enable_a		: IN STD_LOGIC  := '1';
  		enable_b		: IN STD_LOGIC  := '1';
  		wren_a		: IN STD_LOGIC  := '0';
  		wren_b		: IN STD_LOGIC  := '0';
  		q_a		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
  		q_b		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  	);
  end component;

  signal internal_q_a, internal_q_b : std_logic_vector(31 downto 0);
  signal memory_address : std_logic_vector(31 downto 0);
  signal port_a_input : std_logic_vector(31 downto 0);

begin

  memory_address <= alu_output;

  port_A_input_manager_instance : port_A_input_manager port map (
    clk => clk,
    memory_address => memory_address,
    memory_out_bus => memory_out_bus,
    incremented_PC => incremented_PC,
    port_A_selector => port_a_selector,
    port_A_input => port_a_input,
    is_load_instruction => is_load_instruction,
    is_sign_extended_load => is_sign_extended_load,
    is_half_load => is_half_load,
    is_byte_load => is_byte_load
  );

  x0_manager_a : x0_manager port map (
    clk => clk,
    register_address => register_address_a,
    internal_register_data_output => internal_q_a,
    register_output_data => port_a_output
  );

  x0_manager_b : x0_manager port map (
    clk => clk,
    register_address => register_address_b,
    internal_register_data_output => internal_q_b,
    register_output_data => port_b_output
  );

  register_file_block_instance : register_file_block port map (
    address_a => register_address_a,
    address_b	=> register_address_b,
    clock_a	=> clk,
    clock_b => clk,
    data_a => port_a_input,
    data_b => temporary_register_output,
    enable_a => '1',
    enable_b => '1',
    wren_a => register_wren_a,
    wren_b => register_wren_b,
    q_a => internal_q_a,
    q_b	=> internal_q_b
  );

end architecture;
