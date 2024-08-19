	AREA SHIVAM, DATA, READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x10001000;
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	MOV R0, #SIZE;	COUNTER
	LDR R1, =SRC;	SEARCH POINTER 
	LDR R1, [R1];	LOAD SEARCH VALUE
	LDR R2, =ARR;	ARRAY POINTER
	MOV R3, #0;		0 = NOT FOUND 1 = FOUND

LOOPS
	CMP R0, #0
	BEQ EXIT
	LDR R4, [R2];	ARRAY ELEMENT VALUE
	CMP R1, R4
	MOVEQ R3, #1
	BEQ EXIT
	ADD R2, #4
	SUB R0, #1
	B LOOPS


EXIT
STOP 
	B STOP
	
SRC DCD 0X82
ARR DCD 0X1,0X2,0X3,0X4,0X5,0X6,0X7,0X8,0X9,0XA
SIZE EQU 10

	END
