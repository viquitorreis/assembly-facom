# vector V is associated with register base $s6
# variables a, b, c, d are associated with registers $s0, $s1, $s2, $s3

# while (b < 10) {
#   V[3] = a + b;
#   b = b + 1;
# }

li $t0, 1 # pegando valor de 1
li $t1, 10

DO:
slt $t2, $s1, $t1 # if b < 10, then $t2 = 1
beq $t2, $zero, END # if $t2 != 0, then end

add $t3, $s0, $s1
sw $t3, 12($s6)

add $s1, $s1, $t0

END:
