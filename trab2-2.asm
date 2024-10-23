# 2 - Leia 4 números do teclado, ordene-os de forma crescente e imprima-os na tela,
# depois ordene-os de forma decrescente e também imprima na tela.

# data cria um segmento para os dados, com base nos valores a seguir
.data
# array de 5 int
intArray: .space 16 # space -> vai ditar a quantidade de espaço que deve ser alocado. 16 -> 16 bytes (4 inteiros)
newline: .asciiz "\n"     # nova linha

.text
.globl main

main:
	# loop para ler 5 números e armazenar no array
	la $t0, intArray # carrega o endereço base do array
	li $t1, 4 # contador de 4 números
	li $s1, 0 # indice do array (inicia em 0)

read_loop:
	# numerações dos syscalls https://student.cs.uwaterloo.ca/~isg/res/mips/traps
	li $v0, 5 # código syscall para ler inteiro
	syscall # chamada syscall para ler o inteiro
	sw $v0, 0($t0) # armazena o valor de $v0 no array
	addi $t0, $t0, 4 # move para o endereço do array base para o próximo indice
	addi $s1, $s1, 1 # incrementa o indice no array
	bne $s1, $t1, read_loop # $t1 -> 4, então se o indice != 4 deve ler mais input de inteiro do usuario
	
	# imrpimindo os números ndo array (antes de ordenar)
	la $t0, intArray # reinicia o endereço de $t0 para apontar para o inicio do array
	li $s1, 0 # reseta o indice

# for (int i = 0; i < 4; ++i) {
asc_outer_loop:
    li $s2, 0 # inicia loop interno. indice i
    la $t0, intArray # reinicia $t0 para apontar para o início do array
    
asc_inner_loop:
    lw $t2, 0($t0) # carrega intArray[j]
    lw $t3, 4($t0) # carrega intArray[j+1]
    slt $t4, $t3, $t2 # t4 = 1 caso intArray[j+1] < intArray[j]
    beq $t4, $zero, asc_no_swap # se não for menor, não faz swap

    # swap: intArray[j] com intArray[j+1]
    sw $t3, 0($t0) # armazena intArray[j+1] em intArray[j]
    sw $t2, 4($t0) # armazena intArray[j] em intArray[j+1]

asc_no_swap:
	addi $t0, $t0, 4 # move para o próximo endereço (j++)
	addi $s2, $s2, 1 # incrementa contador externo (declarado no outer_loop)
	li $t5, 3 # vendo se loop interno percorreu 3 elementos
	bne $s2, $t5, asc_inner_loop # repete até o loop interno terminar
	
	addi $s1, $s1, 1 # incrementa o contador externo (definido na main)
	li $t5, 3 # loop externo só precisa rodar 3 vezes
	bne $s1, $t5, asc_outer_loop # repete até terminar o loop externo
	
	# imprimir numeros ordenados em ascendente
	la $t0, intArray # reinicia $t0 para apontar para o inicio do array
	li $s1, 0 # reseta o indice
	li $t1, 4 # reinicia o contador com 4 números
    
asc_print_loop:
	lw $a0, 0($t0) # carrega o número do array. Lembrando que $t0 -> endereço base do array
	li $v0, 1 # código syscall para imprimir inteiro
	syscall # imprimindo o inteiro
	addi $t0, $t0, 4 # move para o próximo endereço do array
	addi $s1, $s1, 1 # incremeneta o indice
	bne $s1, $t1, asc_print_loop # enquanto $s1 (indice array) != $t1 (contador), repete até imprimir todos os números
	
	# Imprime nova linha
	li $v0, 4
	la $a0, newline
	syscall

	# Ordenação decrescente
	li $s1, 0
	
desc_outer_loop:
    li $s2, 0
    la $t0, intArray  # reseta o ponteiro do array para o início

desc_inner_loop:
    lw $t2, 0($t0) # carrega intArray[j]
    lw $t3, 4($t0) # carrega intArray[j+1]
    slt $t4, $t2, $t3 # t4 = 1 se intArray[j] < intArray[j+1]
    beq $t4, $zero, no_swap_desc # se não for menor, não faz swap

    # swap: intArray[j] com intArray[j+1]
    sw $t3, 0($t0) # armazena intArray[j+1] em intArray[j]
    sw $t2, 4($t0) # intArray[j] = intArray[j+1]
    
no_swap_desc:
    addi $t0, $t0, 4 # move para o próximo índice
    addi $s2, $s2, 1 # incrementa contador interno
    li $t5, 3 # loop interno itera até 3
    bne $s2, $t5, desc_inner_loop # repete até o loop interno terminar

    addi $s1, $s1, 1 # incrementa contador externo
    li $t5, 3 # número de iterações no loop externo
    bne $s1, $t5, desc_outer_loop # repete até terminar o loop externo

    # imprime ordenados em descendente
    la $t0, intArray # reinicia $t0 para o início do array
    li $s1, 0 # reseta o indice
    li $t1, 4 # contador de 4 números

print_desc_loop:
    lw $a0, 0($t0) # carrega o número do array
    li $v0, 1 # código syscall para imprimir inteiro
    syscall # imprime o inteiro
    addi $t0, $t0, 4 # move para o próximo índice
    addi $s1, $s1, 1 # incrementa o indice
    bne $s1, $t1, print_desc_loop # repete até imprimir todos os números

    # Fim do programa
    li $v0, 10 # código syscall para encerrar o programa (exit)
    syscall
    