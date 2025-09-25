.text
	li $v0, 5
	syscall
	
	mult $v0, $v0
	mflo $a0
	
	li $v0, 1
	syscall