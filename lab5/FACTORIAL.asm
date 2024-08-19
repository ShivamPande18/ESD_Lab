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
	LDR R0, =N;		N POINTER
	LDR R0, [R0];	VALUE OF N
	BL  FACT
	LDR R2, =RES
	STR R0, [R2]
	
STOP 
	B STOP
	
FACT 
	CMP R0, #1
	BEQ EXIT
	PUSH {R0,LR}
	SUB R0, #1
	BL FACT
	
EXIT
	POP {R1,LR}
	MUL R0, R1
	BX LR
	
N DCD 0X4

	AREA data, DATA, READWRITE
RES DCD 0
	END
