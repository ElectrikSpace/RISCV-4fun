library ieee;
use ieee.std_logic_1164.all;

entity registers_file_controler is
  port (
    is_fetch_state : in std_logic;
    is_execute_state : in std_logic;
    is_writeback_state : in std_logic;
    is_load_instruction : in std_logic;
    is_store_instruction : in std_logic;
    is_branch_instruction : in std_logic;
    is_jalr_instruction : in std_logic;
    is_jal_instruction : in std_logic;
    is_op_imm_instruction : in std_logic;
    is_op_instruction : in std_logic;
    is_auipc_instruction : in std_logic;
    is_lui_instruction : in std_logic;
    instruction : in std_logic_vector(31 downto 0);
    register_wren_a : out std_logic;
    register_wren_b : out std_logic;
    port_a_selector : out std_logic;
    register_address_a : out std_logic_vector(4 downto 0);
    register_address_b : out std_logic_vector(4 downto 0);
    is_sign_extended_load : out std_logic;
    is_half_load : out std_logic;
    is_byte_load : out std_logic
  );
end registers_file_controler;

architecture Behavioral of registers_file_controler is

  begin

    -- enable write on port A only during writeback cycle of LOAD instructions or JAL or JALR
    register_wren_a <= is_writeback_state AND (is_load_instruction OR is_jal_instruction OR is_jalr_instruction);

    -- enable write on port B only during writeback of OP instructions or OP-IMM or LUI or AUIPC
    register_wren_b <= is_writeback_state AND (is_op_instruction OR is_op_imm_instruction OR is_lui_instruction OR is_auipc_instruction);

    -- read memory output bus only during LOAD instructions
    port_a_selector <= is_load_instruction;

    process (is_fetch_state, is_execute_state, is_writeback_state, instruction, is_lui_instruction, is_jalr_instruction)
    begin
      if is_fetch_state='1' then
        -- port A
        if is_lui_instruction='1' then
          register_address_a <= "00000";
        else
          register_address_a <= instruction(19 downto 15);
        end if;

        -- port B
        register_address_b <= instruction(24 downto 20);
      elsif is_execute_state='1' then
        -- port A
        if is_jalr_instruction='1' then
          register_address_a <= instruction(19 downto 15);
        else
          register_address_a <= instruction(24 downto 20);
        end if;

        -- port B
        register_address_b <= instruction(24 downto 20);
      elsif is_writeback_state='1' then
        -- port A
        register_address_a <= instruction(11 downto 7);

        -- port B
        register_address_b <= instruction(11 downto 7);
      else
        register_address_a <= "XXXXX";
        register_address_b <= "XXXXX";
      end if;
    end process;

    is_sign_extended_load <= NOT instruction(14);

    is_half_load <= instruction(12);

    is_byte_load <= (NOT instruction(13)) AND (NOT instruction(12));

end architecture;
