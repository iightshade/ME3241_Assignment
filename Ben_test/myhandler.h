#define INPUT                      (KEY_MASK & (~REG_KEYS))
//global variable
//Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
//Buttons:
//A button = Z, B button = X, Arrow Keys = leftrightpdown
int counter = 0;
int pos = 0;
int playerX = SCREEN_WIDTH/2, playerY = SCREEN_HEIGHT-20;

int menu_point = SCREEN_HEIGHT/2 + 1*20-20;
int menumap = 1, gamemap = 0, highscore = 0;
int CS = 0;

int NAlien;
int spriteCounter;
int laserPositions[10][3];
int laserCounter = 0;
int laserTimeCounter = 0;
// Alien positions (active, Xpos, Y pos)
int alienPositions[10][3]= {
    {1, 30, 30},
    {1, 50, 30},
    {1, 70, 30},
    {1, 90, 30},
    {1, 110, 30},
    {1, 30, 50},
    {1, 50, 50},
    {1, 70, 50},
    {1, 90, 50},
    {1, 110, 50},
};
int alienTimer = 0;
int totalNumAliens = 10;
int aliensMove = 1;
int maxAlienRight = 220;
int maxAlienLeft = 10;
// pressedButtons records which buttons have been pressed
// A, B, Sel, Str, R, L, U, D
int pressedButtons[8] = {};


void Handler(void)
{
    u16 Flag; int x,y,steps,a1,a2; int newline = 0;
    int d[50]={},l[10]={},i=0,j,linecount=1,k,    c=0,mod=0; //l[] = letters in line

    a1 = 0; a2 = 1;

    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    Flag = REG_IF;

    if (menumap == 1){
        if ((REG_IF & INT_TIMER2) == INT_TIMER2){
            char ch[50]=" NEW GAME>HIGHSCORE>CREDITS>"; //all caps, > to change line
            steps = 10;

            while (ch[i]!='\0'){d[i]=ch[i]; i++;}

            for(j=0;j<=i-1;j++){ //run through all the letters in ch[]
                if (d[j]==62){
                    l[linecount]=j-mod; //letters in 1 line
                    mod = j; linecount ++;
                    }
                }

            for(j=1;j<=linecount;j++){
                x = SCREEN_WIDTH/2 - 8/2*steps;
                y = SCREEN_HEIGHT/2 + j*20-20;

                for(k=0;k<=l[j]-1;k++){
                    drawSprite(d[c]-64,c,(x+k*steps),y);
                    c++;
                    }
                }

            checkbutton();

            if(pressedButtons[6] == 1){
                  menu_point = menu_point + (-pressedButtons[6])*20;
                  pressedButtons[6] = 0;
                }
            if(pressedButtons[7] == 1){
                  menu_point = menu_point + (pressedButtons[7])*20;
                  pressedButtons[7] = 0;
                }
            // menu_point = menu_point + (-checkbutton())*20;
            if (menu_point > SCREEN_HEIGHT/2 + 3*20-20) menu_point = SCREEN_HEIGHT/2 + 3*20-20;
            if (menu_point < SCREEN_HEIGHT/2 + 1*20-20) menu_point = SCREEN_HEIGHT/2 + 1*20-20;

            drawSprite(BUTTON_CURSOR, c,  SCREEN_WIDTH/2 - 5*steps, menu_point);

            if (menu_point == (SCREEN_HEIGHT/2 + 1*20-20) && pressedButtons[0] == 1){
                menumap = 0, gamemap = 1, highscore = 0; CS=1;}
            if (menu_point == (SCREEN_HEIGHT/2 + 2*20-20) && pressedButtons[0] == 1){
                menumap = 0, gamemap = 0, highscore = 1; CS=1;}
            }

        }


    if (gamemap == 1){
        if (CS==1){ClearScreen();CS--;}
        if ((REG_IF & INT_TIMER0) == INT_TIMER0){
        //Display screen, ASCII into what to type, 65 = A
        //Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
        int ones, tens, min_ones, min_tens, distx;
        steps = 7; spriteCounter = 0;

        x = SCREEN_WIDTH - 15; y = 10;
        ones = counter%10;
        tens = counter/10%6;
        min_ones = counter/60%10;
        min_tens = counter/600;
        drawSprite(ones+NUMBER,spriteCounter+1,x,y);
        drawSprite(tens+NUMBER,spriteCounter+2,x-steps,y);
        drawSprite(min_ones+NUMBER,spriteCounter+3,x-2*steps-7,y);
        drawSprite(min_tens+NUMBER,spriteCounter+4,x-3*steps-7,y);
        distx = x-3*steps-7;

        char ch[50]="LIVES>"; //all caps, > to change line
        while (ch[i]!='\0') {d[i]=ch[i]; i++;}
        x = distx-100;
        for(k=0;k<=i-1;k++) drawSprite(d[k]-64,spriteCounter+10+k,(x+k*steps),y);
        counter++;
        }


        if ((REG_IF & INT_TIMER1) == INT_TIMER1){ // TODO: replace XXX with the specific interrupt you are handling

        checkbutton();
        spriteCounter = 10001;

        // Spaceship position //
        if(pressedButtons[4] == 1){
          playerX = playerX + 1;
          if(playerX > maxAlienRight) playerX = maxAlienRight; // Boundary of Movement to Right
          pressedButtons[4] = 0;
        }
        if(pressedButtons[5] == 1){
          playerX = playerX - 1;
          if(playerX < maxAlienLeft) playerX = maxAlienLeft; // Boundary of Movement to Left
          pressedButtons[5] = 0;
        }

        drawSprite(SPACESHIP, spriteCounter, playerX, playerY);
        spriteCounter++;


        // Create laser positions //
        // [0] = Active [1] = X  [2] = Y
        laserTimeCounter++; // Rate of Fire
        if(laserTimeCounter > 25){
          if(pressedButtons[6] == 1){ // Activation of Laser
            createLaser();
            laserTimeCounter = 0;
          }
        }
        pressedButtons[6] = 0;                    // Deactivation of Laser


        for( i = 0; i < laserCounter; i++){
          if(laserPositions[i][0] == 1){            // if laser is active its moves
            laserPositions[i][2] = laserPositions[i][2] - 2;
          }

            drawSprite(LASER, spriteCounter, laserPositions[i][1], laserPositions[i][2]);
            spriteCounter++;


          // Deactivate lasers out of screen
          if(laserPositions[i][2] < -20){
            laserPositions[i][0] = 0;
          }
        }


        // Update alien positions //
        // [0] = Active [1] = X  [2] = Y
        alienTimer++;
        if(alienTimer == 3){
          if(alienPositions[9][1] > maxAlienRight){ // Move L once hit the maximum right frame
            aliensMove = -1;
          }
          if(alienPositions[0][1] < maxAlienLeft){  // Move R once hit the maximum right frame
            aliensMove = 1;
          }
          for(i = 0; i < totalNumAliens; i++){ // X position of all ALIENS moving together
            alienPositions[i][1] = alienPositions[i][1] + aliensMove;
          }
          alienTimer = 0;
        }

        // Print alien positions //
        // [0] = Active [1] = X  [2] = Y
        for(i = 0; i < totalNumAliens; i++){
            //Using a standard fixed sprite number for Aliens
            NAlien = 200; // must be the same counter not reproduce
            for(j = 0; j < laserCounter; j++){
                if(laserPositions[j][1] >= alienPositions[i][1] && laserPositions[j][1] < alienPositions[i][1]+16 && laserPositions[j][2] == alienPositions[i][2]){
                    alienPositions[i][0] = 0;
                    // laserPositions[j][0] = 0;
                    }
                }
          if(alienPositions[i][0] == 1){
            drawSprite(ALIEN1, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
          if(alienPositions[i][0] == 0){
            drawSprite(SPACE, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
         }
      }
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
        pressedButtons[0] = 1;
    }
    if ((buttons & KEY_B) == KEY_B)
    {
        // buttonB();
        pressedButtons[1] = 1;
    }
    if ((buttons & KEY_SELECT) == KEY_SELECT)
    {
        pressedButtons[2] = 1;
    }
    if ((buttons & KEY_START) == KEY_START)
    {
        pressedButtons[3] = 1;
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
        pressedButtons[6] = 1;
    }
    if ((buttons & KEY_DOWN) == KEY_DOWN)
    {
        // buttonD();
       pressedButtons[7] = 1;
    }

	 return 0;
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


    //     ALIEN MOTION------------------------------------------

    //     popSprite(ALIEN, 'L', 6, (x+steps*counter) % SCREEN_WIDTH,
    //     y + countertens*steps);

    //     popSprite(a2, 'R', 6, (SCREEN_WIDTH-steps*counter)% SCREEN_WIDTH, //PROBLEM
    //     y + steps + countertens*steps);

    //     counter++;
    //     if (counter%10 == 0)
    //         {countertens++;}
