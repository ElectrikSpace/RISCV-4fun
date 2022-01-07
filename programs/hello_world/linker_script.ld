OUTPUT_ARCH( "riscv" )
OUTPUT_FORMAT("elf32-littleriscv")
ENTRY( _start )

MEMORY
{
   FLASH ( rx ) : ORIGIN = 0x00000000 , LENGTH = 1K
   RAM ( xrw) : ORIGIN = 0x00008000 , LENGTH = 1K
   IO ( xrw ) : ORIGIN = 0x0000c000 , LENGTH = 2
}

SECTIONS
{
   .text :
   {
    *(.text)
    *(.text.*)
    *(.rodata)
    . = ALIGN(4);
    _etext = .;
   }> FLASH

   .data :
   {
    _sdata = .;
    _stack_pointer = . + 0xff;
    *(.data)
    *(.sdata)
    . = ALIGN(4);
    _edata = .;
   }> RAM AT> FLASH

   .bss :
   {
    _sbss = .;
    *(.bss)
    . = ALIGN(4);
    _ebss = .;
   }> RAM
}
