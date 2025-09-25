.data
    str1: .asciiz "digite quantos termos (max 100): "
    str2: .asciiz "serie fibonacci:\n"
    space: .asciiz " "
    
.text
    # le quantos termos
    la $a0, str1
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    add $s0, $zero, $v0  # $s0 = N (quantidade de termos)
    
    # verifica se N <= 100 e N > 0
    slti $t0, $s0, 101
    beq $t0, $zero, END
    slt $t0, $zero, $s0
    beq $t0, $zero, END
    
    # printa "serie fibonacci"
    la $a0, str2
    li $v0, 4
    syscall
    
    # inicializa fibonacci
    addi $s1, $zero, 0   # termo atual = 0
    addi $s2, $zero, 1   # proximo termo = 1
    addi $s3, $zero, 0   # contador = 0
    
LOOP_FIB:
    beq $s3, $s0, END    # se contador == N, para
    
    # imprime termo atual
    add $a0, $zero, $s1
    li $v0, 1
    syscall
    
    # imprime espaço
    la $a0, space
    li $v0, 4
    syscall
    
    # calcula proximo: novo_termo = atual + proximo
    add $t0, $s1, $s2    # $t0 = novo termo
    add $s1, $zero, $s2  # atual = proximo
    add $s2, $zero, $t0  # proximo = novo termo
    
    addi $s3, $s3, 1     # incrementa contador
    j LOOP_FIB
    
END:
    li $v0, 10
    syscall