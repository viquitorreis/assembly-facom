# vector V is associated to register $s6
# variables a, b, c, d are associated to registers $s0, $s1, $s2, $s3

# if(a != b)
#  a = b + c;
# else
#  a = b – c;

bne $s0, $s1, TRUE # if (a != b) read TRUE
SUB $s0, $s1, $s2
j END

TRUE:
ADD $s0, $s1, $s2

END: