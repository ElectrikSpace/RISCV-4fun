library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_PC_unit is
end tb_PC_unit;

architecture test_bench of tb_PC_unit is
  component PC_unit is
    port
  	(
  		clk : in std_logic;
  		reset : in std_logic;
  		is_writeback_state : in std_logic;
  		external_value : in std_logic_vector(31 downto 0);
  		is_branch_instruction : in std_logic;
  		is_branch_taken : in std_logic;
  		is_jal_instruction : in std_logic;
  		is_jalr_instruction : in std_logic;
  		current_PC : out std_logic_vector(31 downto 0);
  		incremented_PC : out std_logic_vector(31 downto 0);
  		next_PC : out std_logic_vector(31 downto 0)
  	);
  end component;

  signal clk, reset, is_writeback_state : std_logic;
  signal is_branch_instruction, is_branch_taken, is_jal_instruction, is_jalr_instruction : std_logic;
  signal external_value, current_PC, incremented_PC, next_PC : std_logic_vector(31 downto 0);

  begin

    used_PC_unit : PC_unit port map (
      clk => clk,
      reset => reset,
      is_writeback_state => is_writeback_state,
      external_value => external_value,
      is_branch_instruction => is_branch_instruction,
      is_branch_taken => is_branch_taken,
      is_jal_instruction => is_jal_instruction,
      is_jalr_instruction => is_jalr_instruction,
      current_PC => current_PC,
      incremented_PC => incremented_PC,
      next_PC => next_PC
    );

    process
    begin
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end process;

    process
    begin
      is_writeback_state <= '0';
      wait for 20 ns;
      is_writeback_state <= '1';
      wait for 10 ns;
    end process;

    process
    begin
      reset <= '1';
      wait for 30 ns;
      reset <= '0';

      is_branch_instruction <= '0';
      is_branch_taken <= '0';
      is_jal_instruction <= '0';
      is_jalr_instruction <= '0';
      external_value <= "00000000000000000010101011110100";

      wait for 100 ns;

      is_branch_instruction <= '1';
      wait for 100 ns;

      is_branch_taken <= '1';
      wait for 100 ns;

      reset <= '1';
      wait for 30 ns;
      reset <= '0';

      is_jal_instruction <= '1';
      is_branch_taken <= '0';
      is_branch_instruction <= '0';
      wait for 100 ns;

      reset <= '1';
      wait for 30 ns;
      reset <= '0';

      is_jalr_instruction <= '1';
      is_jal_instruction <= '0';
      wait for 100 ns;

      is_jalr_instruction <= '0';

      wait;
    end process;
end architecture;
