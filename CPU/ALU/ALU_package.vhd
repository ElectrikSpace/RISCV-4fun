library ieee;
use ieee.std_logic_1164.all;

entity ALU_package is
  port (
    alu_input_a_selector : in std_logic;
    alu_input_b_selector : in std_logic;
    immediate : in std_logic_vector(31 downto 0);
    port_a_output : in std_logic_vector(31 downto 0);
    port_b_output : in std_logic_vector(31 downto 0);
    current_PC : in std_logic_vector(31 downto 0);
    unit_selector : in std_logic_vector(1 downto 0);
    shift_unit_opcode : in std_logic_vector(1 downto 0);
    logic_unit_opcode : in std_logic_vector(1 downto 0);
    arithmetic_unit_opcode : in std_logic;
    comparator_unit_opcode : in std_logic_vector(2 downto 0);
    alu_output : out std_logic_vector(31 downto 0)
  );
end ALU_package;

architecture Behavioral of ALU_package is

  component ALU is
  	port
  	(
      a : in std_logic_vector(31 downto 0);
      b : in std_logic_vector(31 downto 0);
  		unit_selector : in std_logic_vector(1 downto 0);
  		shift_unit_opcode : in std_logic_vector(1 downto 0);
  		logic_unit_opcode : in std_logic_vector(1 downto 0);
  		arithmetic_unit_opcode : in std_logic;
  		comparator_unit_opcode : in std_logic_vector(2 downto 0);
  		o : out std_logic_vector(31 downto 0)
  	);
  end component;

  component ALU_inputs_manager is
    port (
      alu_input_a_selector : in std_logic;
      alu_input_b_selector : in std_logic;
      immediate : in std_logic_vector(31 downto 0);
      port_a_output : in std_logic_vector(31 downto 0);
      port_b_output : in std_logic_vector(31 downto 0);
      current_PC : in std_logic_vector(31 downto 0);
      alu_input_a : out std_logic_vector(31 downto 0);
      alu_input_b : out std_logic_vector(31 downto 0)
    );
  end component;

  signal a, b : std_logic_vector(31 downto 0);

begin

    ALU_inputs_manager_instance : ALU_inputs_manager port map (
      alu_input_a_selector => alu_input_a_selector,
      alu_input_b_selector => alu_input_b_selector,
      immediate => immediate,
      port_a_output => port_a_output,
      port_b_output => port_b_output,
      current_PC => current_PC,
      alu_input_a => a,
      alu_input_b => b
    );

    ALU_instance : ALU port map (
      a => a,
      b => b,
      unit_selector => unit_selector,
      shift_unit_opcode => shift_unit_opcode,
      logic_unit_opcode => logic_unit_opcode,
      arithmetic_unit_opcode => arithmetic_unit_opcode,
      comparator_unit_opcode => comparator_unit_opcode,
      o => alu_output
    );

end architecture;
