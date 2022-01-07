.align 2
.section .text
.global _start

_start :

  1 :
          la sp, _stack_pointer # init stack pointer

  # init .data section with .sdata from ROM

  # load addresses
  2 :
          la a0, _edata
          la a1, _sdata
          la a2, _etext

  # copy each block of 32 bits
  3 :
          beq a0, a1, 6f
          lw a3, 0(a2)
          sw a3, 0(a1)
          addi a1, a1, 4
          addi a2, a2, 4
          j 3b

  # init .data section with .bss

  # load addresses
  4 :
          la a0, _ebss
          la a1, _sbss

  # loop
  5 :
          beq a0, a1, 6f
          sw zero, 0(a1)
          addi a1, a1, 4
          j 5b

  6 :
          j main
