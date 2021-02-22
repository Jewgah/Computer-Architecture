// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)



// R0*R1 dans la RAM et le mettre dans R2
// R0*R1 = R1+R1+R1..... R0 fois  R0 = 10, R1=5, R0*R1 = 10*5 = 10+10+10+10+10 (5 fois)
// ou bien 5+5+5... 10 fois
// on va crer une variable n = R0, et va faire une loop:
// while (n != 0) {
// R2 = R2+R1 // R0 fois R1+R1+R1...
// n--

//initialization
@R0
D=M // D = RAM[R0]
@n
M=D // RAM[n] = RAM[R0]
@R2
M=0 // we initialize RAM[R2] to zero

//Mikrei katse: if R0 or R1 = 0 JUMP to END
@R0
D=M
@END
D;JEQ // If R0 == 0 JUMP to (END)
@R1
D=M
@END
D;JEQ // If R1 == 0 JUMP to (END)


(LOOP)
@n
D=M // D=n
@END
D;JEQ // if n = 0 JUMP to (END)
@R1
D=M // D=RAM[R1]
@R2
M=D+M // RAM[R2] = RAM[R2] + RAM[R0]
@n
M=M-1 //n--
@LOOP
0;JMP // Unconditionnal JUMP to (LOOP)

(END)
@END
0;JMP // Infinite loop, end of program