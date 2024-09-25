# A and B are integers, base address 32 and 128 respectively
# variable f is at position 256

# b[8] = a[14] + b[12] + f

li $t0, 32 # load addr of a
li $t1, 128 # load addr of b
li $t2, 256 # load addr of f

lw 56($t0), $s0 # load value of a[14] | 14 * 4 = 56
lw 48($t1), $s1 # load value of b[12] | 12 * 4 = 48 bytes
lw 0($t2), $s2 # load value of f

ADD $t3, $s0, $s2 # B[12] + f
ADD $t4, $s0, $t3 # a[14] + B[12] + f

sw $t4, 32($t1) # b[8] = a[14] + B[12] + f