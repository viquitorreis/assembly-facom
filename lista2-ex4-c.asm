# v vector is associated with register base $s6
# variables a, b, c, d are associated with registers $s0, $s1, $s2, $s3

# if( a < b)
#   a = b + c;
# else
#   a = b – c;

SLT $t0, $s0, $s1 # if a < b, $t0 = 1
BEQ $t0, $zero, ELSE # If $t0 == 0, then a >= b 
ADD $s0, $s1, $s2 # if a < b, a = b + c
j END

ELSE:
SUB $s0, $s1, $s2 # if a >= b, a = b - c

END: