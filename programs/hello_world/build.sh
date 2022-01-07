riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -O3 -T linker_script.ld startup.s hello_world.c -o hello_world.elf -Wl,-Map=hello_world.map
objcopy -O ihex hello_world.elf hello_world.hex
python3 simple_hex_to_mif_converter.py hello_world.hex hello_world.mif
