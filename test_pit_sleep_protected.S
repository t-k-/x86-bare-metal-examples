/*
Test PIT_SLEEP_TICKS in protected mode.

Expected output: `a\n` gets printed with frequency 2Hz.
*/

#include "common.h"
BEGIN
    STAGE2
    CLEAR
    PROTECTED_MODE
    IDT_SETUP_48_ISRS
    REMAP_PIC_32
    PIT_GENERATE_FREQUENCY
    PIT_SET_FREQ 1000
    sti
loop:
    VGA_PRINT_STRING $message
    PIT_SLEEP_TICKS $500
    jmp loop
IDT_48_ENTRIES
PIT_SLEEP_TICKS_GLOBALS
interrupt_handler:
    cmp PIT_ISR_NUMBER, 4(%esp)
    jne not_pit
    PIT_SLEEP_TICKS_HANDLER_UPDATE
not_pit:
    ret
message:
    .asciz "a"
