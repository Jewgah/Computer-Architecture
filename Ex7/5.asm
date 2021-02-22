Atzeret:
addi $sp, $sp, -8 #allocate memory for 2 registers
sw $a0, 4($sp) #store a0 (a) in stack
sw $ra, 0($sp) #store "who to return to" in stack

addi $t0, $0, 1 # t0=1

seq $t0, $a0, $t0 #if a==1 : t0=1. else t0=0
beq $t0, $0, Else


add $s0, $a0, $0 #return a
addi $sp, $sp, 8 #deallocate memory
jr $ra #return to caller function


Else:
addi $a0, $a0, -1 # a--
jal Atzeret #recursive
lw $ra, 0($sp) #restore ra
lw $a0, 4($sp) #restore a
addi $sp, $sp, 8 #deallocate memory

mult $s0, $a0 #return a*func_result
mflo $s0 #put result in v0
jr $ra
