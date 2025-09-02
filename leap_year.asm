.data
str1: .asciiz "Digite o ano: "
str2: .asciiz "Nao é leap year."
str3: .asciiz "É leap year."

.text
	la $a0, str1
	li $v0, 4
	syscall
	
	# le o int
	#li $a0, 0
	li $v0, 5
	syscall
	add $s0, $zero, $v0
	
	# check if leap:
	#In every year that is evenly divisible by 4.
	#Unless the year is evenly divisible by 100, in which case it's only a leap year if the year is also evenly divisible by 400.
	
	# nao é divisivel por 4, nao é
	addi $t0, $zero, 4
	div $s0, $t0
	mfhi $t1
	bne $t1, $zero, no
	
	# printa o int
	add $a0, $zero, $s0
	li $v0, 1
	syscall
	
no:
	addi $t0, $zero, 100
	div $s0, $t0
	mfhi $t1 # deve ser 0...
	
	addi $t0, $zero, 400
	div $s0, $t0
	mfhi $t2 # deve ser 0...
	
	add $t3, $t1, $t2
	beq $t3, $zero, yes
	
	# nao é leap year
	la $a0, str2
	li $v0, 4
	syscall
	li $v0, 10
    	syscall

yes:
	la $a0, str3
	li $v0, 4
	syscall