# a -> $s0
# b -> $s1
# c -> $s2
# d -> $s3
# e -> $s4
# f -> $s5

# f = (a - b) + (c + d)
SUB $s5, $s0, $s1
ADD $t0, $s2, $s3
ADD $s5, $s5, $t0