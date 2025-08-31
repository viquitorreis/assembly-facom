.data

.text
	addi $s0, $zero, 10
	addi $s1, $s0, 20
	add $a0, $zero, $s1
	li $v0, 1
	syscall