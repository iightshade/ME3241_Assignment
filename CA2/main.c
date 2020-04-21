// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
#include "sprites.h"
#include "gba.h"
#include "gbalib.h"

//global variable
//Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
//Buttons: 
//A button = Z, B button = X, Arrow Keys = leftrightpdown
int counter = 0;
int countertens = 0;
#define KEYCNT *(volatile u16*)0x4000132


void Handler(void)
{
    u16 Flag; int x,y,steps,a1,a2; int newline = 0;
            int d[50]={},l[10]={},i=0,j,linecount=1,k;
        char ch[50]="NEW GAME>"; //all caps, > to change line
    a1 = 0; a2 = 1;
    steps = 10;

    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    Flag = REG_IF;

    // if ((REG_IF & INT_TIMER0) == INT_TIMER0) // TODO: replace XXX with the specific interrupt you are handling
    // {
    //     ones = counter%10;
    //     tens = counter/10;
    //     drawSprite(ones,10,x+20,y);
    //     drawSprite(tens,3,x,y);
    //     counter++;
    // }
        if ((REG_IF & INT_TIMER0) == INT_TIMER0) // TODO: replace XXX with the specific interrupt you are handling
    {   
        //Display screen, ASCII into what to type, 65 = A
        //Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
        
    //     int d[50]={},l[10]={},i=0,j,linecount=1,k,c=0,mod=0; //l[] = letters in line
    //     char ch[50]="NEW GAME >NEW GAME"; //all caps, > to change line
    //     while (ch[i]!='\0'){ 
    //         d[i]=ch[i]; i++; 
    //     }
    //     for(j=0;j<=i-1;j++){
    //         if (d[j]==62){
    //             l[linecount]=j-mod; //letters in line
    //             mod = j;
    //             linecount ++;
    //             }                
    //         }

    //     if (linecount ==2) {
    //     for(j=1;j<=linecount;j++){
    //         x = SCREEN_WIDTH/2 - l[j]/2*steps; 
    //         y = SCREEN_HEIGHT/2 + j*20;

    //         for(k=0;k<=l[j]-1;k++){
    //             drawSprite(d[c]-64,c,(x+k*steps),y);
    //             c++;
    //         }
    //     }
    // }

        

        while (ch[i]!='\0') {d[i]=ch[i]; i++; }
        x = SCREEN_WIDTH/2 - i/2*steps; y = SCREEN_HEIGHT/2;
        for(k=0;k<=i-1;k++) drawSprite(d[k]-64,k,(x+k*steps),y);

    }
        if ((REG_IF & INT_TIMER1) == INT_TIMER1) // TODO: replace XXX with the specific interrupt you are handling
    {   
        // popSprite(ALIEN, 'L', 6, (x+steps*counter) % SCREEN_WIDTH,
        //     y + countertens*steps);

        // popSprite(a2, 'R', 6, (SCREEN_WIDTH-steps*counter)% SCREEN_WIDTH, //PROBLEM
        //     y + steps + countertens*steps);

        // counter++;
        // if (counter%10 == 0)
        //     {countertens++;}
    }
            if (KEY_R==1) {
            for(k=0;k<=i-1;k++) drawSprite(d[k]-64,k,(x+2*k*steps),y);
        }
    REG_IF = Flag; // Update interrupt table, to confirm we have handled this interrupt
    REG_IME = 0x01;  // Re-enable interrupt handling
}

// -----------------------------------------------------------------------------
// Project Entry Point
// -----------------------------------------------------------------------------
int main(void)
{

    // Set Mode 2
    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;

    // Fill SpritePal
    *(unsigned short *) 0x5000200 = 0;
    *(unsigned short *) 0x5000202 = RGB(31,31,31);

    fillPalette();
    fillSprites();

    // Set Handler Function for interrupts and enable selected interrupts
    REG_IME = 0x0;
    REG_INT = (int)&Handler;
    REG_IE |= 0x8 | 0x10 | 0x1000;// TODO: complete this line to choose which timer interrupts to enable
    KEYCNT |= 0x7FFF;
    REG_IME = 0x1;		// Enable interrupt handling

    // Set Timer Mode (fill that section and replace TMX with selected timer number)
    REG_TM0D = 49141; // 1sec = 16393 ticks x 61 microsec (max = 65534)
    REG_TM0CNT |= TIMER_FREQUENCY_1024 | TIMER_ENABLE | TIMER_INTERRUPTS;	// TODO: complete this line to set timer frequency and enable timer

    REG_TM1D = 57337; // 0.5sec = 8196 ticks x 61 microsec (max = 65534)
    REG_TM1CNT |= TIMER_FREQUENCY_1024 | TIMER_ENABLE | TIMER_INTERRUPTS;   

    while(1);

	return 0;
}
