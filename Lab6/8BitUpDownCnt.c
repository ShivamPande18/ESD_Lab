#include<LPC17xx.h>

void delay(int n)
{
	int i=0;
	for(i=0;i<n;i++);
}


int main()
{
	int i=0;
	int x;
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0 = 0;	//led
	LPC_PINCON->PINSEL4 = 0;	//switch
	LPC_GPIO0->FIODIR = 0xFF<<4;
	LPC_GPIO2->FIODIR = 0;
	
		
	while(1)
	{
		x = LPC_GPIO2->FIOPIN;
		x = x & 1<<12;
		if(x==0) i++;
		else i--;
		
		if(i<0) i = 255;
		if(i>255) i = 0;
		
		LPC_GPIO0->FIOPIN = i<<4 ;

			
		delay(10000);
	}
}
