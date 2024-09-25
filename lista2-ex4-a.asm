# vector V is associated to register $s6
# variables a, b, c, d are associated to registers $s0, $s1, $s2, $s3

# if (a == b)
#  a = b + c;
# else
#  a = b – c;

beq $s0, $s1, TRUE # if a == b, jump to TRUE block

# else (a != b) -> a = b - c
SUB $s0, $s1, $s2
j END # jump to end

TRUE:
ADD $s0, $s1, $s2 # a = b + c

END: # finish