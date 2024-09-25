# vector V is associated to register $s6
# variables a, b, c, d are associated to registers $s0, $s1, $s2, $s3

# if( a < b)
#  a = b + c;
# else
# a = b – c;

slt $t0, $s0, $s1 # if (a < b) -> $t0 = 1, 0 otherwise
beq $t0, $zero, ELSE # if $t0 == 0 (a >= b) jump to ELSE

# true: a = b + c
add $s0, $s1, $s2
j END

# false: a = b - c
ELSE:
sub $s0, $s1, $s2

END: