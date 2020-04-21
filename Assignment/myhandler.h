
//global variable
//Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
//Buttons:
//A button = Z, B button = X, Arrow Keys = leftrightpdown
int counter = 0;
int countertens = 0;

void Handler(void)
{
    u16 Flag;
    int x,y,steps,a1,a2;
    int newline = 0;
    int d[50] = {}, l[10] = {};
    int i = 0, j, k, linecount = 1;
    char ch[50]="NEW GAME>"; //all caps, > to change line
    a1 = 0; a2 = 1;
    steps = 10;

    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    Flag = REG_IF;

    if ((REG_IF & INT_TIMER0) == INT_TIMER0) // TODO: replace XXX with the specific interrupt you are handling
    {
      while (ch[i] != '\0'){d[i] = ch[i]; i++;}
      x = SCREEN_WIDTH / 2 - i / 2 * steps;
      y = SCREEN_HEIGHT / 2;


      for(k = 0; k <= i - 1; k++){
        drawSprite(d[k] - 64, k, (x + k *steps + counter), y);
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

    if (KEY_R==1) {
		counter = counter + 1;
      //for(k = 0; k <= i-1; k++) drawSprite(d[k] - 64, k, (x+2*k*steps), y);
    }
    REG_IF = Flag; // Update interrupt table, to confirm we have handled this interrupt
    REG_IME = 0x01;  // Re-enable interrupt handling
}
