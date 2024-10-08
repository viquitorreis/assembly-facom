# vector V is associated with register base $s6
# variables a, b, c, d are associated with registers $s0, $s1, $s2, $s3

# while( V[0] <= a )
# V[0] = V[0] + b;

lw $t0, 0($s6) # load value of v[0]

DO:
slt $t1, $t0, $s0  # $t1 = 1 if a > v[0], meaning v[0] is false
bne $t1, $zero, END # if v[0] > a, then end

ADD $t0, $t0, $s1
sw $t0, $s0

j DO

END:

