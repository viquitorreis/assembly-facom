# A and B are integers, base address 32 and 128 respectively
# variable f is at position 256

li $t0, 32 # load a base addr
li $t1, 128 # load b base addr
li $t2, 256 # load f base addr

lw $s0, 64($t0) # loads value a[16] -> 16 * 4 = 64 (offset in bytes)
lw $s1, 16($t1) # loads value b[4] -> 4 * 4 = 16 (offset in bytes)
lw $s2, 0($t2) # loads f value

SUB $s3, $s1, $s2  # b[4] - f 

sw $s3, 64($t0) # a[16] -> 64 bytes from base addr of a