#include <stdint.h>

// #include <stdio.h>

#define UART_DATA_ADDRESS 0x0000c000;
#define UART_FLAG_ADDRESS 0x0000c001;

#define RAM_TEST 0x00008000;

// extern uint32_t _etext;
// extern uint32_t _sdata;
// extern uint32_t _edata;
// extern uint32_t _sbss;
// extern uint32_t _ebss;

// char ascii[10] = {0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39};
//
// void write(char caracter) {
//   volatile uint8_t *uart_data = (uint8_t *)UART_DATA_ADDRESS;
//   volatile uint8_t *uart_flag = (uint8_t *)UART_FLAG_ADDRESS;
//
//   while(*uart_flag);
//   *uart_data = caracter;
// }

char test[5] = {'A', 'B', 'C', 'D', 'E'};


void main() {
  // uint32_t a = 0;
  // uint32_t b;
  // uint8_t unit;
  //
  // while (1) {
  //   b = a;
  //   while (b != 0) {
  //     unit = b % 10;
  //     write(ascii[unit]);
  //     b = (b-unit) / 10;
  //   }
  //   a++;
  // }

  volatile uint8_t *uart_data = (uint8_t *)UART_DATA_ADDRESS;
  volatile uint8_t *uart_flag = (uint8_t *)UART_FLAG_ADDRESS;

  uint8_t counter;
  for (counter = 0; counter < 5; counter++) {
    while(*uart_flag);
    *uart_data = test[counter];
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
//
//   main();
// }
