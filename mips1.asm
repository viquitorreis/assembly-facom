	li, $s1, 5
	li, $s2, 10
	li, $s3, 15
		
	slt $t0, $s1, $s2 # se s1 < s2 então t0 = 1
	beq $t0, $zero, else_block # se t0 == zero, então vai pro else_block

	add $t1, $s1, $s3
	j end_if

else_block:

	sub $t2, $s1, $s3

end_if: