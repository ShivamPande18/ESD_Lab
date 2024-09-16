#include<LPC17xx.h>

int seven[] = {0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};

void delay(int n)
{
	int i=0;
	for(i=0;i<n;i++);
}

int main()
{
	int i=0;
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0 = 0;
	LPC_PINCON->PINSEL3=0;
	LPC_GPIO0->FIODIR = 0xFF<<4;
	LPC_GPIO1->FIODIR = 0xF<<23;
	LPC_GPIO1->FIOPIN = 0;
	
	while(1)
	{
		for(i=0;i<10;i++)
		{
			LPC_GPIO0->FIOPIN = seven[i]<<4;
			delay(10000);
		}
	}
}
