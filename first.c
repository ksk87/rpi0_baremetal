#include <stdint.h>

#define DELAY_COUNT	1000000

#define GPFSEL4		0x20200010
#define GPSET1		0x20200020
#define GPCLR1		0x2020002C

#define ACT_LED_GPIO	21

#define REG32(addr)	(*(volatile uint32_t*)addr)

#define _BV(v)		(1U << (v))

void delay(void)
{
	uint32_t idx;
	
	for (idx = 0; idx < DELAY_COUNT; idx++)
	{
		asm volatile ("nop	\n\t");
	}
}

int main(void)
{
	REG32(GPFSEL4) |= _BV(ACT_LED_GPIO);
	
	for (;;)
	{
		REG32(GPSET1) |= _BV(15);
		delay();
		
		REG32(GPCLR1) |= _BV(15);
		delay();
	}

	return 0;
}

