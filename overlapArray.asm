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
	LDR R0, =N+(3*4)
	LDR R1, =N + ((SIZE-1)*4) + (SHIFT*4)
	MOV R3, #4
BACK LDR R2, [R0], #-4; #-4 for negative indexing
	STR R2, [R1], #-4
	SUB R3, #1
	CMP R3, #0
	BNE BACK 
	
STOP 
	B STOP

SIZE EQU 4
SHIFT EQU 2

	AREA data, DATA, READWRITE
N DCD 0x12345678,0x12345671,0x12345333,0x1230000;dump values in memory
DST DCD 0,0,0,0
	END
