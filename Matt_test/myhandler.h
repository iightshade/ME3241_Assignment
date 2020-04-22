
#define INPUT                      (KEY_MASK & (~REG_KEYS))
//global variable
//Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
//Buttons:
//A button = Z, B button = X, Arrow Keys = leftrightpdown
int counter = 0;
int pos = 0;
int playerX = SCREEN_WIDTH/2, playerY = SCREEN_HEIGHT-20;


void Handler(void)
{
    u16 Flag; int x,y,steps,a1,a2; int newline = 0;
    int d[50]={},l[10]={},i=0,j,linecount=1,k;
    char ch[50]="NEW GAME>"; //all caps, > to change line
    a1 = 0; a2 = 1;

    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    Flag = REG_IF;

        if ((REG_IF & INT_TIMER0) == INT_TIMER0)
    {
        //Display screen, ASCII into what to type, 65 = A
        //Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
        int ones, tens, min_ones, min_tens, distx;
        steps = 7;

        x = SCREEN_WIDTH - 15; y = 10;
        ones = counter%10;
        tens = counter/10%6;
        min_ones = counter/60%10;
        min_tens = counter/600;
        drawSprite(ones+NUMBER,10,x,y);
        drawSprite(tens+NUMBER,100,x-steps,y);
        drawSprite(min_ones+NUMBER,1000,x-2*steps-7,y);
        drawSprite(min_tens+NUMBER,10000,x-3*steps-7,y);
        distx = x-3*steps-7;

        char ch[50]="LIVES>"; //all caps, > to change line
        while (ch[i]!='\0') {d[i]=ch[i]; i++;}
        x = distx-100;
        for(k=0;k<=i-1;k++) drawSprite(d[k]-64,k,(x+k*steps),y);
        counter++;

    }
        if ((REG_IF & INT_TIMER1) == INT_TIMER1) // TODO: replace XXX with the specific interrupt you are handling
    {
        steps = 16;
        playerX = playerX + checkbutton();
        // drawSprite(SPACESHIP,10001,x,y);
        drawSprite(SPACESHIP, 10001, playerX, playerY);

        drawSprite(LASER, 10002, playerX, playerY-pos);
        pos+=16;

        // drawSprite(ALIEN1,10003,x,y);

    }

    REG_IF = Flag; // Update interrupt table, to confirm we have handled this interrupt
    REG_IME = 0x01;  // Re-enable interrupt handling
}

int checkbutton(void)
{
	// Gift function to show you how a function that can be called upon button interrupt to detect which button was pressed and run a specific function for each button could look like. You would have to define each buttonA/buttonB/... function yourself.
    u16 buttons = INPUT;

    if ((buttons & KEY_A) == KEY_A)
    {
        //buttonA();
    }
    if ((buttons & KEY_B) == KEY_B)
    {
        // buttonB();
    }
    if ((buttons & KEY_SELECT) == KEY_SELECT)
    {
        // buttonSel();
    }
    if ((buttons & KEY_START) == KEY_START)
    {
        // buttonS();
    }
    if ((buttons & KEY_RIGHT) == KEY_RIGHT)
    {
        // buttonR();
		  return 1;
    }
    if ((buttons & KEY_LEFT) == KEY_LEFT)
    {
        //buttonL();
		  return -1;
    }
    if ((buttons & KEY_UP) == KEY_UP)
    {
        // buttonU();
    }
    if ((buttons & KEY_DOWN) == KEY_DOWN)
    {
        // buttonD();
    }

	 return 0;
}


    //     FOR GAME MENU -----------------------------------------------------------

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

    //      while (ch[i]!='\0') {d[i]=ch[i]; i++; }
    //      x = SCREEN_WIDTH/2 - i/2*steps; y = SCREEN_HEIGHT/2;
    //      for(k=0;k<=i-1;k++) drawSprite(d[k]-64,k,(x+k*steps),y);

    //      x = SCREEN_WIDTH/2; y = SCREEN_HEIGHT/2;
    //      drawSprite(40,1,x,y);






    //      ALIEN MOTION------------------------------------------

    //     popSprite(ALIEN, 'L', 6, (x+steps*counter) % SCREEN_WIDTH,
    //     y + countertens*steps);

    //     popSprite(a2, 'R', 6, (SCREEN_WIDTH-steps*counter)% SCREEN_WIDTH, //PROBLEM
    //     y + steps + countertens*steps);

    //     counter++;
    //     if (counter%10 == 0)
    //         {countertens++;}
