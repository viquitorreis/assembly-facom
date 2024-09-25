# utilize load and store to get and store a, b, c, d, e, f values
# variables are int and stored starting from address 32, sequentially

# a -> $s0
# b -> $s1
# c -> $s2
# d -> $s3
# e -> $s4
# f -> $s5

# lw $register, offset($base_register) -> load data
# sw $register, offset($base_register) -> stores data

# f = (a - b) + (c + d)
lw $t0, 32($s0) # a
lw $t1, 36($s0) # b
lw $t2, 40($s0) # c
lw $t3, 44($s0) # d

ADD $t4, $t2, $t3 # $t4 = (c + d)
SUB $t5, $t0, $t1 # $t5 = (a - b)
ADD $t6, $t4, $t5 # $t6 = (a - b) + (c + d)

sw $t6, 52($s0) # store the value of f at address 52  