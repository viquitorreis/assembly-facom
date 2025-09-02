.data
str1: .asciiz "Digite um numero: "
str2: .asciiz "Resultado da média é: "

.text
	add $s0, $zero, $zero
	addi $t0, $zero, 0
do:
	# le um numero do teclado
	li $v0, 4 # syscall para printar string
	la $a0, str1
	syscall
	
	li $v0, 5 # syscall para ler inteiro
	syscall
	add $s0, $s0, $v0 # soma o que leu em $s0
	addi $t0, $t0, 1
	beq $t0, 10, end
	j do
end:
	li $v0, 4
	la $a0, str2
	syscall
				
	# calculo media
	li $s1, 10 
	div $s0, $s1
	# printa media
	li $v0, 1
	mflo $t1 # coloca o quociente da divisao em $t1
	add $a0, $zero, $t1
	syscall
	
	
	