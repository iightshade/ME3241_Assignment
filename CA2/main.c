// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
#include "numbers.h"
#include "gba.h"

//global variable
counter = 0;

void drawSprite(int numb, int N, int x, int y)
{
    // Gift function: displays sprite number numb on screen at position (x,y), as sprite object N
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = numb*2;
}


void Handler(void)
{
    u16 Flag; int x,y,tens,ones;
    x = 90; y = 70;

    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    Flag = REG_IF;

    if ((REG_IF & INT_TIMER0) == INT_TIMER0) // TODO: replace XXX with the specific interrupt you are handling
    {
        ones = counter%10;
        tens = counter/10;
        drawSprite(ones,10,x+20,y);
        drawSprite(tens,3,x,y);
        counter++;
    }

    REG_IF = Flag; // Update interrupt table, to confirm we have handled this interrupt

    REG_IME = 0x01;  // Re-enable interrupt handling
}


// -----------------------------------------------------------------------------
// Project Entry Point
// -----------------------------------------------------------------------------
int main(void)
{
	int i;

    // Set Mode 2
    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;

    // Fill SpritePal
    *(unsigned short *) 0x5000200 = 0;
    *(unsigned short *) 0x5000202 = RGB(31,31,31);

    // Fill SpriteData
    for (i = 0; i < 10*8*8/2; i++)
        spriteData[i] = (numbers[i*2+1] << 8) + numbers[i*2];

    // Set Handler Function for interrupts and enable selected interrupts
    REG_IME = 0x0;
    REG_INT = (int)&Handler;
    REG_IE = 0x8;				// TODO: complete this line to choose which timer interrupts to enable
    // REG_DISPSTAT |=0x10;    //Display and buffer
    REG_IME = 0x1;		// Enable interrupt handling

    // Set Timer Mode (fill that section and replace TMX with selected timer number)
    REG_TM0D = 49141; // 1sec = 16393 of 61 microsec
    REG_TM0CNT |= TIMER_FREQUENCY_1024 | TIMER_ENABLE | TIMER_INTERRUPTS;	// TODO: complete this line to set timer frequency and enable timer

    while(1);

	return 0;
}
