# vector V is associated with register base $s6
# variables a, b, c, d are associated with registers $s0, $s1, $s2, $s3

# do:
# while (b < 32) {
#  a = a + a;
#  V[4] = a + b;
#  b = b + 1;
# }

# 1 - first step is to check if b < 32
li $t0, 32
li $t2, 1

DO:
slt $t3, $s1, $t0 # if (b < 32), then $t3 = 1

beq $t3, $zero, EXIT # if $t2 == 0, then b < 32 is false, should exit
ADD $s0, $s0, $s0 # a = a + a

ADD $t1, $s0, $s1 # v[4] = a + b
sw $t1, 16($s6) # v[4] = 4*4 = 16($s6)

ADD $s1, $s1, $t2
j DO

EXIT: