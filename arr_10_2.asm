.data
	str: .asciiz "Digite um num: "
	arr: .space 40

.text	
	add $s6, $zero, $zero
	addi $s7, $zero, 10
	# pega endereco inicial do arr e armazena...
	la $s0, arr

DO:
	# printa para digitar um num
	la $a0, str
	li $v0, 4
	syscall
	
	# le nteiro
	li $v0, 5
	syscall
	
	beq $s6, $s7, SAIR
	
	add $s1, $zero, $v0
	# contador do adicional no endereco do array
	sw $s1, 0($s0)
	
	# carrega no array e imprime
	lw $a0, 0($s0)
	#atualiza o endereco do array pro proximo...\
	addi $s0, $s0, 4 # adicionar + 4 n oendereco
	addi $s6, $s6, 1 # incrementa contador
	j DO

SAIR:
	la $s3, arr
	# contador do loop
	add $s4, $zero, $zero 
	addi $s5, $zero, 10
	addi $t2, $zero, 2
	
PRINT:
	beq $s4, $s5, SAIR_2
	lw $a0, 0($s3)
	
	div $a0, $t2
	mfhi $t1
	
	addi $s3, $s3, 4 # adiciona endereco
	addi $s4, $s4, 1 # incrementa contador
	
	# checa se é impar
#	addi $t2, $zero, 2
	beq $t1,$zero, PRINT
	li $v0, 1
	syscall
	j PRINT

SAIR_2:
	li $v0, 10
	syscall
	
	
	
	
	