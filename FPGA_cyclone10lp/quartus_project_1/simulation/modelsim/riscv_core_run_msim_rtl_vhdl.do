transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/FPGA_cyclone10lp/quartus_project_1/db {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/FPGA_cyclone10lp/quartus_project_1/db/cpu_clock_altpll1.v}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/others/ALU_inputs_manager.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/external_components/uart_tx/memory_clk_state_machine.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/memory/memory_address_manager.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/external_components/uart_tx/uart_tx.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/external_components/uart_tx/multiplexer_16_to_1.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/external_components/uart_tx/half_adder.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/external_components/uart_tx/counter_4_bits.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/external_components/uart_tx/address_decoder.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/external_components/IO_manager.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/state_flags/state_flags.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/register_file/x0_manager.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/register_file/register_file_unit.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/register_file/port_A_input_manager.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/register_file/load_manager.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/PC/PC_unit.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/PC/multiplexer_32_to_16.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/PC/incrementer_16_bits_by_4.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/memory/ROM_unit.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/memory/RAM_unit.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/memory/memory_manager.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/internal_registers/temporary_register.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/decoder/registers_file_controler.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/decoder/memory_operations_controler.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/decoder/instruction_type_decoder.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/decoder/instruction_format_decoder.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/decoder/immediate_generator.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/decoder/decoder.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/decoder/alu_opcode_feeder.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/shift_unit/shift_way_converter.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/shift_unit/shift_unit.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/shift_unit/multiplexer_row_b4.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/shift_unit/multiplexer_row_b3.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/shift_unit/multiplexer_row_b2.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/shift_unit/multiplexer_row_b1.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/shift_unit/multiplexer_row_b0.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/shift_unit/multiplexer_2_to_1.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/others/multiplexer_128_to_32.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/logic_unit/logic_unit.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/logic_unit/logic_bloc_1_bit.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/comparator_unit/multiplexer_block.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/comparator_unit/multiplexer_4_to_1.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/comparator_unit/logic_block_signed.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/comparator_unit/logic_block.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/comparator_unit/comparator_unit.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/comparator_unit/block_2_bits_signed.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/comparator_unit/block_2_bits.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/arithmetic_unit/upgraded_full_adder.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/arithmetic_unit/two_wide_carry_manager.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/arithmetic_unit/sub_converter.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/arithmetic_unit/carry_generator.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/arithmetic_unit/arithmetic_unit.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/arithmetic_unit/adder_block_16_bits.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/arithmetic_unit/adder_block_8_bits.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/arithmetic_unit/adder_block_4_bits_serial.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/ALU_package.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/ALU/ALU.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/CPU/CPU.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/FPGA_cyclone10lp/quartus_project_1/BRAMs/register_file_block.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/FPGA_cyclone10lp/quartus_project_1/BRAMs/RAM_block.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/FPGA_cyclone10lp/quartus_project_1/BRAMs/ROM_block.vhd}
vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/FPGA_cyclone10lp/quartus_project_1/PLL/cpu_clock.vhd}

vcom -93 -work work {C:/Users/sylva/OneDrive/Documents/projets/projets/riscv_core/FPGA_cyclone10lp/quartus_project_1/../../CPU/tb_CPU.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclone10lp -L rtl_work -L work -voptargs="+acc"  tb_CPU

add wave *
view structure
view signals
run 100 us
