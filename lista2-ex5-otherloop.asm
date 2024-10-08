# vector V is associated with register base $s6
# variables a, b, c, d are associated with registers $s0, $s1, $s2, $s3

# while (c > 0) {
#   a = a + b;
#    V[2] = a;
#    c = c - 1;
# }

li $t1, 1

DO:
slt $t0, $zero, $s2 # check if 0 < c, then $t0 = 1
beq $t0, $zero, END # if $t0 == 0 (c <= 0), termina o loop

ADD $s0, $s0, $s1
sw $s0, 8($s6)
sub $s2, $s2, $t1

END:
