library ieee;
use ieee.std_logic_1164.all;

entity ALU_inputs_manager is
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
end ALU_inputs_manager;

architecture Behavioral of ALU_inputs_manager is

begin

  -- input a
  with alu_input_a_selector select alu_input_a <=
    port_a_output when '0',
    current_PC when '1',
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;

  -- input b
  with alu_input_b_selector select alu_input_b <=
    port_b_output when '0',
    immediate when '1',
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;

end architecture;
