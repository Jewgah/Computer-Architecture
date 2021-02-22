// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.



////////////////////////////
(RESTART)
@SCREEN
D=A
@R0
M=D	// RAM[R0] = SCREEN ADRESS (@16384)

///////////////////////////
(KBDCHECK)

@KBD // @24576
D=M // D stocks the value of the pressed key, if no key is pressed then D=0
@BLACK
D;JGT	// if D > 0 it means a key is pressed, then JUMP to (BLACK)
@WHITE
D;JEQ	// else it means that D=0 and then no key is pressed, then JUMP to (WHITE)

//continuous check
@KBDCHECK
0;JMP

///////////////////////////
(BLACK)
@1
M=-1	//Fill screen with black
@CHANGE
0;JMP // Unconditionnal JUMP to (CHANGE)

/////////////////////////////
(WHITE)
@1
M=0	//Fill screen with white
@CHANGE
0;JMP // Unconditionnal JUMP to (CHANGE)

//////////////////////////
(CHANGE)
@1	
D=M	//if d=-1 then black, if d=0 then white

@R0
A=M	//Get pixel adress to fill (A=SCREEN at first iteration)
M=D	//fill it

@0
D=M+1	//go to next pixel
@KBD
D=A-D	//KBD-SCREEN=A why ?? 

@0
M=M+1	//go to next pixel (SCREEN++)
A=M // Get new adress of the pixel to fill

@CHANGE
D;JGT	//IF A=0 EXIT AS THE WHOLE SCREEN IS BLACK ???
/////////////////////////

@RESTART
0;JMP