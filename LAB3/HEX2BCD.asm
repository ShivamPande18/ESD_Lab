	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 10001000
	DCD Reset_Handler
	ALIGN 
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =N
	LDR R0, [R0]; HEX
	MOV R1, #0; CARRY
	MOV R6, #0; BCD
	MOV R7, #0; LSHIFT VAL
SEP
	CMP R0, #0
	BEQ EXIT2
	AND R5, R0, #0XF
	LSR R0, #4
	
DIV
	CMP R5, #0XA
	BLO EXIT1
	SUB R5, #0XA
	ADD R1, #1
	B DIV
	
EXIT1
	LSL R5, R7
	ADD R7, #4
	ADD R6, R5
	B SEP
	
EXIT2
	LSL R1, R7
	ADD R6, R1
	;MOV R3, #0XA
	;MLA R2, R1, R3, R0
STOP
	B STOP
	
N DCD 0xFF
	END
