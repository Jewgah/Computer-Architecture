// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/06/rect/RectL.asm

// Symbol-less version of the Rect.asm program.

0000000000000000 // @0
1111110000010000 // D=M
0000000000010111 // @23
1110001100000110 // D;JLE
0000000000010000 // @16
1110001100001000 // M=D
0100000000000000 // @16384
1110110000010000 // D=A
0000000000010001 // @17
1110001100001000 // M=D
0000000000010001 // @17
1111110000100000	 // A=M
1110111010001000 // M=-1
0000000000010001 // @17
1111110000010000 // D=M
0000000000100000 // @32
1110000010010000 // D=D+A
0000000000010001 // @17
1110001100001000 // M=D
0000000000010000 // @16
1111110010011000 // MD=M-1
0000000000001010 // @10
1110001100000001 // D;JGT
0000000000010111 // @23
1110101010000111 // 0;JMP
