#define INPUT                      (KEY_MASK & (~REG_KEYS))
//global variable
//Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
//Buttons:
//A button = Z, B button = X, Arrow Keys = leftrightpdown
int counter = 0;
int countertens = 0;
int enemies = 10

void Handler(void)
{
    u16 Flag;
    //int x,y,steps
	 //int a1,a2;
    int newline = 0;
    int d[50] = {}, l[10] = {};
    int i = 0, j, k, linecount = 1;
    char ch[50]="N"; //all caps, > to change line
	 int playerSprite[10] = {};
	 int playerX = SCREEN_WIDTH/2, playerY = 150;
    // a1 = 0; a2 = 1;
    steps = 10;

    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    Flag = REG_IF;

    if ((REG_IF & INT_TIMER0) == INT_TIMER0) 
    {
      while (ch[i] != '\0'){playerSprite[i] = ch[i]; i++;}
		





		counter = counter + checkbutton();		






		
      for(k = 0; k < i ; k++){
        drawSprite(playerSprite[k] - 64, k, (playerX + counter), playerY);
      }







    }







    if ((REG_IF & INT_TIMER1) == INT_TIMER1)
        {
      // TODO: replace XXX with the specific interrupt you are handling

      // popSprite(ALIEN, 'L', 6, (x+steps*counter) % SCREEN_WIDTH,
      //     y + countertens*steps);

      // popSprite(a2, 'R', 6, (SCREEN_WIDTH-steps*counter)% SCREEN_WIDTH, //PROBLEM
      //     y + steps + countertens*steps);

      // counter++;
      // if (counter%10 == 0)
      //     {countertens++;}
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
