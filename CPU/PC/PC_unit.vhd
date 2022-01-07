library ieee;
use ieee.std_logic_1164.all;

entity PC_unit is
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
end PC_unit;

architecture Behavioral of PC_unit is
	component multiplexer_32_to_16 is
		port
		(
	    i : in std_logic_vector(31 downto 0);
			selector : in std_logic;
	    o : out std_logic_vector(15 downto 0)
		);
	end component;
	component incrementer_16_bits_by_4 is
	port
		(
			i : in std_logic_vector(15 downto 0);
	    o : out std_logic_vector(15 downto 0)
		);
	end component;

	signal current_PC_address_internal : std_logic_vector(15 downto 0);
	signal mux_input : std_logic_vector(31 downto 0);
	signal next_PC_address : std_logic_vector(15 downto 0);
	signal is_next_PC_external_value : std_logic;

begin
	-- next PC address creation
	inc: incrementer_16_bits_by_4 port map (i => current_PC_address_internal, o => mux_input(15 downto 0));

	mux_input(31 downto 16) <= external_value(15 downto 0);

	is_next_PC_external_value <= (is_branch_instruction AND is_branch_taken) OR is_jal_instruction OR is_jalr_instruction;

	mux: multiplexer_32_to_16 port map (i => mux_input, selector => is_next_PC_external_value, o => next_PC_address);

	next_PC(15 downto 0) <= next_PC_address;
	next_PC(31 downto 16) <= (others => '0');

	current_PC(15 downto 0) <= current_PC_address_internal;
	current_PC(31 downto 16) <= (others => '0');

	incremented_PC(15 downto 0) <= mux_input(15 downto 0);
	incremented_PC(31 downto 16) <= (others => '0');

	-- PC register
	process(clk) is
	begin
		if rising_edge(clk) then
			if reset='1' then
				-- current_PC_address_internal <= "0000000000000000";
				current_PC_address_internal <= "1111111111111100";
			else
				if is_writeback_state='1' then
					current_PC_address_internal <= next_PC_address;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
