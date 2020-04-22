
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

int spriteCounter;
int lazerPositions[500][3];
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


void Handler(void)
{
    u16 Flag; int x,y,steps,a1,a2; int newline = 0;
    int d[50]={},l[10]={},i=0,j,linecount=1,k,    c=0,mod=0; //l[] = letters in line
    
    a1 = 0; a2 = 1;

    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    Flag = REG_IF;
    if ((REG_IF & INT_TIMER2) == INT_TIMER2){
        if (menumap == 1){
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

            menu_point = menu_point + (-checkbutton())*20;
            if (menu_point > SCREEN_HEIGHT/2 + 3*20-20) menu_point = SCREEN_HEIGHT/2 + 3*20-20;
            if (menu_point < SCREEN_HEIGHT/2 + 1*20-20) menu_point = SCREEN_HEIGHT/2 + 1*20-20;

            drawSprite(BUTTON_CURSOR, c,  SCREEN_WIDTH/2 - 5*steps, menu_point);

            if (menu_point == (SCREEN_HEIGHT/2 + 1*20-20) && checkbutton()==5){
                menumap = 0, gamemap = 1, highscore = 0; CS=1;}
            if (menu_point == (SCREEN_HEIGHT/2 + 2*20-20) && checkbutton()==5){
                menumap = 0, gamemap = 0, highscore = 1; CS=1;}
            }

        }

        // menu_point = menu_point + checkbutton() * steps;

        if (gamemap == 1){
            if (CS==1){ClearScreen();CS--;}
            if ((REG_IF & INT_TIMER0) == INT_TIMER0){
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



            
            if ((REG_IF & INT_TIMER1) == INT_TIMER1){ // TODO: replace XXX with the specific interrupt you are handling
            
            steps = 16;
            playerX = playerX + checkbutton();
            // drawSprite(SPACESHIP,10001,x,y);
            drawSprite(SPACESHIP, 10001, playerX, playerY);

            drawSprite(LASER, 10002, playerX, playerY-pos);
            pos+=16;

            // Update alien positions //
            alienTimer++;
            if(alienTimer == 2){
              for(i = 0; i < totalNumAliens; i++){
                alienPositions[i][1] = alienPositions[i][1] + aliensMove;
              }
              alienTimer = 0;
            }

            //Change alien move direction if aliens are too near the edges
            // if(alienPositions[9][1] >> 200){
            //   aliensMove = -1;
            // }
            // if(alienPositions[0][1] << 20){
            //   aliensMove = 1;
            // }


            // Print alien positions //
            spriteCounter = 10003;
            for(i = 0; i < totalNumAliens; i++){
              if(alienPositions[i][0] == 1){
                drawSprite(ALIEN1, spriteCounter, alienPositions[i][1], alienPositions[i][2]);
                spriteCounter++;
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
          return 5;
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
          return 1;
    }
    if ((buttons & KEY_DOWN) == KEY_DOWN)
    {
        // buttonD();
          return -1;
    }

	 return 0;
}




    //      ALIEN MOTION------------------------------------------

    //     popSprite(ALIEN, 'L', 6, (x+steps*counter) % SCREEN_WIDTH,
    //     y + countertens*steps);

    //     popSprite(a2, 'R', 6, (SCREEN_WIDTH-steps*counter)% SCREEN_WIDTH, //PROBLEM
    //     y + steps + countertens*steps);

    //     counter++;
    //     if (counter%10 == 0)
    //         {countertens++;}
