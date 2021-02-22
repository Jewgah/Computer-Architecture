lui $s0, 0x1002 #load 0x1002 into upper half of s0
addi $s1, $0, 0 #initialize s1 at 0
addi $s2, $0, 0 #initialize s2 at 0
addi $s3, $0, 0 #initialize s3 = i at 0
addi $t0, $0, 0 #initialize t0 at 0
addi $t1, $0, 0 #stop condition at 0
addi $t2, $0, 0 #initialize t2 at 0
addi $t3, $0, 16 #initialize t3 at 16

Loop:

lw $t0, 0($s0) #gets s0+0 data into memory cell t0
mult $t0,$t0 #lo = t0^2

mflo $t2 #s2=lo
mfhi $t1 #s1=hi

add $s2, $s2, $t2 # s2 += lo
add $s1, $s1, $t1 #s1 += hi

addi $s3, $s3, 1 #i++
addi $s0, $s0, 4 #set $s0 to next adress
blt $s3, $t3, Loop # 	#if i < 16, go again to insert


