#include <stdint.h>

// #include <stdio.h>

#define UART_DATA_ADDRESS 0x0000c000;
#define UART_FLAG_ADDRESS 0x0000c001;

// extern uint32_t _etext;
// extern uint32_t _sdata;
// extern uint32_t _edata;
// extern uint32_t _sbss;
// extern uint32_t _ebss;

char hello_string[47] = {'h', 'e', 'l', 'l', 'o', ' ',
                         'w', 'o', 'r', 'l', 'd', ' ',
                         'f', 'r', 'o', 'm', ' ',
                         'R', 'I', 'S', 'C', 'V', ' ',
                         'p', 'r', 'o', 'c', 'e', 's', 's', 'o', 'r', ' ',
                         'b', 'y', ' ',
                         'S', 'y', 'l', 'v', 'a', 'i', 'n', ' ', '!', '\r', '\n'};

void main() {
  volatile uint8_t *uart_data = (uint8_t *)UART_DATA_ADDRESS;
  volatile uint8_t *uart_flag = (uint8_t *)UART_FLAG_ADDRESS;

  uint8_t counter;
  for (counter = 0; counter < 47; counter++) {
    while(*uart_flag);
    *uart_data = hello_string[counter];
  }

  while(1);
}

// void ram_init() {
//   /* init .data section */
//   uint32_t size = &_edata - &_sdata;
//   uint8_t *pointer_source = (uint8_t*)&_etext;
//   uint8_t *pointer_destination = (uint8_t*)&_sdata;
//   for (uint32_t i = 0; i < size; i++) {
//     *pointer_destination++ = *pointer_source++;
//   }
//
//   /* init .bss section */
//   size = &_ebss - &_sbss;
//   pointer_destination = (uint8_t*)&_sdata;
//   for (uint32_t i = 0; i < size; i++) {
//     *pointer_destination++ = 0;
//   }
// }
