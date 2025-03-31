.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    # if x equal 0 or 1 return 1
    beq a0, x0, base_situation
    addi t0, x0, -1
    beq t0, x0, base_situation
    
    # else return n * factorial (n - 1)
    addi sp, sp, -8
    sw ra, 0(sp)
    sw a0, 4(sp)
    
    addi a0, a0, -1
    jal factorial
    
    lw t1, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    
    mul a0, a0, t1
    ret
    
base_situation:
    addi a0, x0, 1
    ret
    