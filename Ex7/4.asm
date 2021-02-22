lui $s0, 0x1002 #load 0x1002 into upper half of s0

addi $s1, $0, 0 #count (number of times we used hi)
addi $s2, $0, 0 #i
addi $t0, $0, 8 #Stop Condition
addi $t1, $0, 0 #temp1
addi $t2, $0, 0 #temp2
addi $t3, $0, 0 #temp3


Loop:
beq $s2, $t0, End #if i==8 jump to end
lw $t1, 0($s0) #load into t1

addi $s0, $s0, 4 #s0+=4
addi $s2, $s2, 1 #i++

mult $t1,$t1 #t1*t1
mfhi $t2 #t2 = hi
mflo $t3 #t3 = lo

#if t1^2 horeg, cad si t2 different de zero, alors count+2
bne $t2, $0, Count2

#else: mult $t1, $t3
mult $t1,$t3 #t1^3
mfhi $t2 #t2 = hi
mflo $t3 #t3 = lo

#if t1^3 horeg, cad si t2 different de zero, alors count+2
bne $t2, $0, Count1

#jump to loop with next adress
j Loop

Count1:

addi $s1, $s1, 1 #s1++
j Loop

Count2:
addi $s1, $s1, 2 #s1+=2
j Loop


End:
