#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg) {
    /* YOUR CODE HERE */
    uint16_t feedback = ((*reg & 1) ^ ((*reg >> 2) & 1) ^ ((*reg >> 3) & 1) ^ ((*reg >> 5) & 1)) & 1; // Calculate feedback
    *reg = (*reg >> 1) | (feedback << 15); // Shift right and insert feedback
    printf("My number is: %u\n", *reg);
}

