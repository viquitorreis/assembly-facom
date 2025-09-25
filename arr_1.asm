.data
    str1: .asciiz "digite um numero: "
    arr1: .word 0:10    # 10 inteiros alinhados corretamente
    
.text
    # le 10 nums e armazena no array
    addi $s0, $zero, 0  # contador = 0
    la $s1, arr1        # endereço do array
    
LOOP_READ:
    beq $s0, 10, PRINT_ODDS
    
    # printa str
    la $a0, str1
    li $v0, 4
    syscall
    
    # le o numero
    li $v0, 5
    syscall
    
    # armazena no array
    sll $t0, $s0, 2     # offset = contador * 4
    add $t1, $s1, $t0   # endereço = base + offset  
    sw $v0, 0($t1)      # armazena número
    
    addi $s0, $s0, 1    # incrementa contador
    j LOOP_READ
    
PRINT_ODDS:
    # imprimir nums ímpares
    addi $s0, $zero, 0  # reinicia contador
    
LOOP_PRINT:
    beq $s0, 10, END
    
    # carrega nums do array
    sll $t0, $s0, 2
    add $t1, $s1, $t0
    lw $t2, 0($t1)
    
    # verifica se é impar (bit 0 = 1)
    andi $t3, $t2, 1
    beq $t3, $zero, SKIP
    
    # imprime se impar
    add $a0, $zero, $t2
    li $v0, 1
    syscall
    
SKIP:
    addi $s0, $s0, 1
    j LOOP_PRINT
    
END:
    li $v0, 10
    syscall