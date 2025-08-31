.data
str1: .asciiz "Digite um numero: "
str2: .asciiz "Digite outro numero: "
str3: .asciiz "A soma ficou: "

.text
	li $v0, 4 # syscall para printar string
	la $a0, str1 # argumento de retorno - o que vai ser printado
	syscall
	
	# le um inteiro
	li $v0, 5
	syscall
	add $s0, $zero, $v0

	li $v0, 4 # syscall para printar string
	la $a0, str2 # argumento de retorno - o que vai ser printado
	syscall

	# le um inteiro
	li $v0, 5
	syscall
	add $s1, $zero, $v0
			
	li $v0, 4 # syscall para printar string
	la $a0, str3 # argumento de retorno - o que vai ser printado
	syscall
	
	# soma os dois número
	add $s2, $s0, $s1

	# imprime o resultado (inteiro)
	li $v0, 1
	la $a0, 0($s2)
	syscall