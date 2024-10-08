# vector V is associated with register base $s6
# variables a, b, c, d are associated with registers $s0, $s1, $s2, $s3
# x -> $s7, n -> $s8

# int busca_r(int x, int n, int v[]) {
#   if(n == 0)
#       return -1;
#   if(x == v[n-1])
#       return n-1;
#   return busca_r(x, n-1, v);
# }

BUSCA:
li $t0, -1

# base case if (n ==0) return -1
beq $s8, $zero, RET_NEG1  # if n == 0 return -1

addi $t1, $s8, -1 # n - 1
sll $t1, $t1, 2 # t1 = (n-1) * 4 -> endereço da palavra
lw $t2, $t1($s6) # t2 = v[n-1]

# if (x == v[n-1]) return n-1
beq $s7, $t0($s6), RET_N_MN1

addi $s8, $s8, -1 # n = n - 1
j BUSCA

bne $s7, $t2, BUSCA 
jr $s8

RET_NEG1:
li $v0, -1 # return -1
jr $ra # return

RET_N_MN1:
addi $v0, $s8, -1 # n -1
jr $ra # return