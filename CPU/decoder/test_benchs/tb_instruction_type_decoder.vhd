library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_instruction_type_decoder is
end tb_instruction_type_decoder;

architecture test_bench of tb_instruction_type_decoder is

  component instruction_type_decoder is
    port (
    instruction : in std_logic_vector(31 downto 0);
    is_load_instruction : out std_logic;
    is_store_instruction : out std_logic;
    is_branch_instruction : out std_logic;
    is_jalr_instruction : out std_logic;
    is_jal_instruction : out std_logic;
    is_op_imm_instruction : out std_logic;
    is_op_instruction : out std_logic;
    is_auipc_instruction : out std_logic;
    is_lui_instruction : out std_logic
    );
  end component;

signal instruction : std_logic_vector(31 downto 0);
signal is_load_instruction, is_store_instruction, is_branch_instruction, is_jalr_instruction, is_jal_instruction, is_op_imm_instruction, is_op_instruction, is_auipc_instruction, is_lui_instruction : std_logic;

begin

  instruction_type_decoder_instance : instruction_type_decoder port map (
  instruction => instruction,
  is_load_instruction => is_load_instruction,
  is_store_instruction => is_store_instruction,
  is_branch_instruction => is_branch_instruction,
  is_jalr_instruction => is_jalr_instruction,
  is_jal_instruction => is_jal_instruction,
  is_op_imm_instruction => is_op_imm_instruction,
  is_op_instruction => is_op_instruction,
  is_auipc_instruction => is_auipc_instruction,
  is_lui_instruction => is_lui_instruction
  );

  process
  begin
    instruction <= "00000000000000000000000000000000";

    for i in 0 to 31 loop
      wait for 10 ns;
      instruction <= std_logic_vector(unsigned(instruction)+4);
    end loop;

    wait;
  end process;

end architecture;
