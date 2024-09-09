#include<LPC17xx.h>

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
	LPC_GPIO0->FIODIR = 0xFF<<4;
	
	while(1)
	{
		for(i=0;i<256;i++)
		{
			LPC_GPIO0->FIOPIN = i<<4 ;
			delay(10000);
		}
	}
}
