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

# f = (a + b) - (c + d - e)
lw $t0, 32($s0) # a
lw $t1, 36($s0) # b
lw $t2, 40($s0) # c
lw $t3, 44($s0) # d
lw $t4, 48($s0) # e

ADD $t5, $t0, $t1 # $t5 = (a + b)
ADD $t6, $t2, $t3 # $t6 = (c + d)
SUB $t6, $t6, $t4 # $t6 = (c + d - e)
SUB $t7, $t5, $t6 # $t7 = (a + b) - (c + d - e)

sw $t7, 52($s0)