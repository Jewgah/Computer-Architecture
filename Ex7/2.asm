addi $s0, $0, 1 # s0 = sum
addi $s3, $0, 1 # s3 = i
addi $s4, $0, 1 # s4 = A
addi $s5, $0, 1 # s5 = B
addi $s6, $0, 1 # s6 = C
addi $s7, $0, 1 # s7 = D
addi $t0, $0, 0 # t0 =0
addi $t1, $0, 0 # t1 =0
addi $t3, $0, 10 # t3 = 10 (Stop Condition)

Loop:
beq $s3, $t3, End #if i=10 jump to End

#Get next value of A : A+=2
addi $s4, $s4, 2 #A += 2

#Get next value of B :
#Bi+1 = (i+2)*(i+1)/2

addi $t0, $s3, 1 #t0 = i+1
addi $t1,$t0,1 #t1=i+2
mult $t1, $t0 #lo = (i+2)*(i+1)
mflo $t0 #t0= (i+2)*(i+1)
div $s5, $t0, 2 #Bi = t0/2
addi $t0, $0, 0 #initialize t0
addi $t1, $0, 0 #initialize t1

#Get next value of C :
sll $s6, $s6, 2 #C*=2

#Get next value of D:
addi $t0, $0, -1 #t0 = -2
mult $s7,$t0 #lo = -1*D
mflo $s7 #D = -D


#t0 = A*B*C*D
mult $s4,$s5 #lo = A*B
mflo $t0 #t0 = A*B
mult $s6,$s7 #lo = C*D
mflo $t1 #t1 = C*D
mult $t1,$t0 #lo = A*B*C*D
mflo $t0 #t0 = A*B*C*D

#sum += t0
add $s0, $s0, $t0 #sum += t0
addi $t0, $0, 0 #initialize t0

#i++
addi $s3,$s3,1

j Loop
End:
