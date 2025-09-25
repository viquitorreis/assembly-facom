.data
    str1: .asciiz "digite um numero: "
    str2: .asciiz "o cubo e: "
    
.text
    # programa principal
    # printa "digite um numero"
    la $a0, str1
    li $v0, 4
    syscall
    
    # le o numero
    li $v0, 5
    syscall
    
    # move numero para $a0 (argumento da subrotina)
    add $a0, $zero, $v0
    
    # chama subrotina do cubo
    jal CUBO
    
    # resultado retorna em $v0
    add $s0, $zero, $v0  # salva resultado
    
    # printa "o cubo e: "
    la $a0, str2
    li $v0, 4
    syscall
    
    # printa o resultado
    add $a0, $zero, $s0
    li $v0, 1
    syscall
    
    # encerra programa
    li $v0, 10
    syscall

CUBO:
    # calcula cubo: n * n * n
    # argumento em $a0
    
    # n * n
    mult $a0, $a0
    mflo $t0           # $t0 = n * n
    
    # (n * n) * n  
    mult $t0, $a0
    mflo $v0           # $v0 = cubo (resultado)
    
    # retorna
    jr $ra