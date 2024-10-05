# v vector is associated with register base $s6
# variables a, b, c, d are associated with registers $s0, $s1, $s2, $s3

# if( V[8] <= 12) {
#  a = a + b + c;
#  V[8] = V[8] + a;
# } else {
# a = a – b – c;
# V[8] = V[8] + a;
# }

li $t0, 12 # load immediate 12 into temporary register
lw $t1, 32($s6) # Loads V[8], into register $t1. 8 * 4 = 32

# if (v[8] <= 12) is the same as if !(12 < v[8])
slt $t2, $t0, $t1 # if 12 < v[8] then $t2 = 1
bne $t2, $zero, ELSE # if $t2 != 0, then 12 >= v[8], so ELSE

# if (v[8] <= 12):
ADD $s0, $s0, $s1
ADD $s0, $s2, $zero
ADD $t1, $t1, $s0
sw $s0, 32($s6) # store a = a + b + c + v[8] + a on v[8]
j END

ELSE:
SUB $s0, $s0, $s1
SUB $s0, $s2, $zero
ADD $t1, $t1, $s0
sw $s0, 32($s6) # store a = a - b - c - v[8] + a on v[8]

END: