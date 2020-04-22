// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
#include "sprites.h"
#include "gba.h"
#include "gbalib.h"
#include "myhandler.h"

//global variable
//Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
//Buttons:
//A button = Z, B button = X, Arrow Keys = leftrightpdown

#define KEYCNT *(volatile u16*)0x4000132

// -----------------------------------------------------------------------------
// Project Entry Point
// -----------------------------------------------------------------------------
int main(void)
{

    // Set Mode 2
    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;
	 // 0x1142 for mode 3 and setting background 

    // Fill SpritePal
    *(unsigned short *) 0x5000200 = 0;
    *(unsigned short *) 0x5000202 = RGB(31,31,31);

	 ////// init
    fillPalette();
    fillSprites();

    // Set Handler Function for interrupts and enable selected interrupts
    REG_IME = 0x0;
    REG_INT = (int)&Handler;
    REG_IE |= 0x8 | 0x10 | 0x1000;// TODO: complete this line to choose which timer interrupts to enable
    KEYCNT |= 0x7FFF;
    REG_IME = 0x1;		// Enable interrupt handling


    // Set Timer Mode (fill that section and replace TMX with selected timer number)
    REG_TM0D = 65255; // ( 60Hz refresh rate ) 
    REG_TM0CNT |= TIMER_FREQUENCY_1024 | TIMER_ENABLE | TIMER_INTERRUPTS;	// TODO: complete this line to set timer frequency and enable timer

    REG_TM1D = 57337; // 0.5sec = 8196 ticks x 61 microsec (max = 65534)
    REG_TM1CNT |= TIMER_FREQUENCY_1024 | TIMER_ENABLE | TIMER_INTERRUPTS;

    while(1);

	return 0;
}
