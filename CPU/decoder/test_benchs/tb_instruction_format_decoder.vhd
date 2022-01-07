library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_instruction_format_decoder is
end tb_instruction_format_decoder;

architecture test_bench of tb_instruction_format_decoder is

  component instruction_format_decoder is
    port (
      is_load_instruction : in std_logic;
      is_store_instruction : in std_logic;
      is_branch_instruction : in std_logic;
      is_jalr_instruction : in std_logic;
      is_jal_instruction : in std_logic;
      is_op_imm_instruction : in std_logic;
      is_op_instruction : in std_logic;
      is_auipc_instruction : in std_logic;
      is_lui_instruction : in std_logic;
      is_R_type : out std_logic;
      is_I_type : out std_logic;
      is_S_type : out std_logic;
      is_B_type : out std_logic;
      is_U_type : out std_logic;
      is_J_type : out std_logic
    );
  end component;

  signal is_load_instruction, is_store_instruction, is_branch_instruction, is_jalr_instruction, is_jal_instruction, is_op_imm_instruction, is_op_instruction, is_auipc_instruction, is_lui_instruction : std_logic;
  signal is_R_type, is_I_type, is_S_type, is_B_type, is_U_type, is_J_type : std_logic;

begin

  used_instruction_format_decoder : instruction_format_decoder port map(
    is_load_instruction => is_load_instruction,
    is_store_instruction => is_store_instruction,
    is_branch_instruction => is_branch_instruction,
    is_jalr_instruction => is_jalr_instruction,
    is_jal_instruction => is_jal_instruction,
    is_op_imm_instruction => is_op_imm_instruction,
    is_op_instruction => is_op_instruction,
    is_auipc_instruction => is_auipc_instruction,
    is_lui_instruction => is_lui_instruction,
    is_R_type => is_R_type,
    is_I_type => is_I_type,
    is_S_type => is_S_type,
    is_B_type => is_B_type,
    is_U_type => is_U_type,
    is_J_type => is_J_type
  );

  process
  begin
    is_load_instruction <= '0';
    is_store_instruction <= '0';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '0';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '0';
    wait for 10 ns;

    is_load_instruction <= '1';
    wait for 10 ns;

    is_load_instruction <= '0';
    is_store_instruction <= '1';
    wait for 10 ns;

    is_store_instruction <= '0';
    is_branch_instruction <= '1';
    wait for 10 ns;

    is_branch_instruction <= '0';
    is_jalr_instruction <= '1';
    wait for 10 ns;

    is_jalr_instruction <= '0';
    is_jal_instruction <= '1';
    wait for 10 ns;

    is_jal_instruction <= '0';
    is_op_imm_instruction <= '1';
    wait for 10 ns;

    is_op_imm_instruction <= '0';
    is_op_instruction <= '1';
    wait for 10 ns;

    is_op_instruction <= '0';
    is_auipc_instruction <= '1';
    wait for 10 ns;

    is_auipc_instruction <= '0';
    is_lui_instruction <= '1';
    wait for 10 ns;

    wait;
  end process;

end architecture;
