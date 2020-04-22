#define INPUT                      (KEY_MASK & (~REG_KEYS))
//global variable
//Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
//Buttons:
//A button = Z, B button = X, Arrow Keys = leftrightpdown
int counter = 0;
int pos = 0;
int playerX = SCREEN_WIDTH/2, playerY = SCREEN_HEIGHT-20;
int spriteCounter;
int laserPositions[10][3];
int laserCounter = 0;
int laserTimeCounter = 0;
// Alien positions (active, Xpos, Y pos)
int alienPositions[10][3]= {
    {1, 30, 80},
    {1, 50, 80},
    {1, 70, 80},
    {1, 90, 80},
    {1, 110, 80},
    {1, 30, 100},
    {1, 50, 100},
    {1, 70, 100},
    {1, 90, 100},
    {1, 110, 100},
};
int alienTimer = 0;
int totalNumAliens = 10;
int aliensMove = 1;
int maxAlienRight = 220;
int maxAlienLeft = 10;
// pressedButtons records which buttons have been pressed
// A, B, Sel, Str, R, L, U, D
int pressedButtons[8] = {0,0,0,0,0,0,0,0};


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
        checkbutton();
        spriteCounter = 10001;

        // Spaceship position //
        if(pressedButtons[4] == 1){
          playerX = playerX + 1;
          pressedButtons[4] = 0;
        }
        if(pressedButtons[5] == 1){
          playerX = playerX - 1;
          pressedButtons[5] = 0;
        }

        drawSprite(SPACESHIP, spriteCounter, playerX, playerY);
        spriteCounter++;

        // Update alien positions //
        alienTimer++;
        if(alienTimer == 3){
          if(alienPositions[9][1] > maxAlienRight){
            aliensMove = -1;
          }
          if(alienPositions[0][1] < maxAlienLeft){
            aliensMove = 1;
          }
          for(i = 0; i < totalNumAliens; i++){
            alienPositions[i][1] = alienPositions[i][1] + aliensMove;
          }
          alienTimer = 0;
        }

        // Print alien positions //
        for(i = 0; i < totalNumAliens; i++){
          if(alienPositions[i][0] == 1){
            drawSprite(ALIEN1, spriteCounter, alienPositions[i][1], alienPositions[i][2]);
            spriteCounter++;
          }
        }


        // Create laser positions //
        laserTimeCounter++;
        if(laserTimeCounter > 100){
          if(pressedButtons[0] == 1){
            createLaser();
            laserTimeCounter = 0;
          }
        }
        pressedButtons[0] = 0;

        for( i = 0; i < laserCounter; i++){
          if(laserPositions[i][0] == 1){
            laserPositions[i][2] = laserPositions[i][2] - 1;
          }
            drawSprite(LASER, spriteCounter, laserPositions[i][1], laserPositions[i][2]);
            spriteCounter++;

          // Deactivate lasers out of screen
          if(laserPositions[i][2] < -20){
            laserPositions[i][0] = 0;
          }
        }
    }

    REG_IF = Flag; // Update interrupt table, to confirm we have handled this interrupt
    REG_IME = 0x01;  // Re-enable interrupt handling
}

void checkbutton(void)
{
	// Gift function to show you how a function that can be called upon button interrupt to detect which button was pressed and run a specific function for each button could look like. You would have to define each buttonA/buttonB/... function yourself.
    u16 buttons = INPUT;

    if ((buttons & KEY_A) == KEY_A)
    {
      pressedButtons[0] = 1;
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
        pressedButtons[4] = 1;

    }
    if ((buttons & KEY_LEFT) == KEY_LEFT)
    {
        //buttonL();
        pressedButtons[5] = 1;

    }
    if ((buttons & KEY_UP) == KEY_UP)
    {
        // buttonU();
    }
    if ((buttons & KEY_DOWN) == KEY_DOWN)
    {
        // buttonD();
    }

}

void createLaser(void){
  laserPositions[laserCounter][0] = 1;
  laserPositions[laserCounter][1] = playerX;
  laserPositions[laserCounter][2] = playerY;
  laserCounter++;
  if(laserCounter > 10){
    laserCounter = 0;
  }
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
