.data
str1: .asciiz "Hello, world!"

.text
	la $a0, str1
	li $v0, 4
	syscall
	