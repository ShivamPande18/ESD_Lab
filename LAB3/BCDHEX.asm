	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =N
	LDR R0, [R0]
	LSR R1, R0, #4; STORES TENS DIGIT
	AND R2, R0, #0XF; STORES ONES DIGIT
	MOV R3, #0XA
	MLA R2, R1, R3, R2; R2 STORES ANSWER
STOP 
	B STOP

N DCD 0X15
	END
