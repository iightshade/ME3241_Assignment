#define INPUT                      (KEY_MASK & (~REG_KEYS))
#include <time.h>

//global variable
//Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
//Buttons:
//A button = Z, B button = X, Arrow Keys = leftrightpdown
int counter = 0;
int pos = 0;
int playerX = SCREEN_WIDTH/2, playerY = SCREEN_HEIGHT-20;

int menu_point = SCREEN_HEIGHT/2 + 1*20-20;
int menumap = 1, gamemap = 0, highscore = 0, credits = 0;;
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
int alienLaserPositions[10][3];
int alienlaserCounter = 0;
int alienlaserTimeCounter = 0;

int endcount;
int saved_counter[20] ={};
int entryno = 0;
int yhigh = 10;
int lives = 3;

void Handler(void)
{
    u16 Flag; int x,y,steps,a1,a2; int newline = 0;
    int d[50]={},d1[50]={},l[10]={},i=0,j,linecount=1,k,    c=0,mod=0; //l[] = letters in line

    a1 = 0; a2 = 1;

    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    Flag = REG_IF;

    if ((REG_IF & INT_TIMER2) == INT_TIMER2){

            //MENU------------------------------------------------------

            if (menumap == 1){ 
            char ch[50]=" STAR>WARS>"; //all caps, > to change line
            steps = 10;

            while (ch[i]!='\0'){d[i]=ch[i]; i++;}

            for(j=0;j<=i-1;j++){ //run through all the letters in ch[]
                if (d[j]==62){
                    l[linecount]=j-mod; //letters in 1 line
                    mod = j; linecount ++;
                    }
                }

            for(j=1;j<=linecount;j++){
                x = SCREEN_WIDTH/2 - 10*steps + j*20;
                y = 10 + j*20;

                for(k=0;k<=l[j]-1;k++){
                    drawSprite(d[c]-64,c,(x+k*steps),y);
                    c++;
                }
            }
            drawSprite(DEATHSTAR4, c+3, SCREEN_WIDTH/2 + 10, 20 +1*20);
            drawSprite(DEATHSTAR3, c+2, SCREEN_WIDTH/2 + 10- 1*16, 20 +1*20);
            drawSprite(DEATHSTAR2, c+1, SCREEN_WIDTH/2 + 10, 20 +1*20-1*16);
            drawSprite(DEATHSTAR1, c, SCREEN_WIDTH/2 + 10- 1*16, 20 +1*20-1*16);

            drawSprite(SPACESHIP, c+4, SCREEN_WIDTH/2 + 40, 20 +1*20);

            char ch1[50]=" NEW GAME>HIGHSCORE>CREDITS>"; //all caps, > to change line
            i=0; mod=0; linecount=1; c=30;
            while (ch1[i]!='\0'){d1[i]=ch1[i]; i++;}

            for(j=0;j<=i-1;j++){ //run through all the letters in ch1[]
                if (d1[j]==62){
                    l[linecount]=j-mod; //letters in 1 line
                    mod = j; linecount ++;
                    }
                }

            for(j=1;j<=linecount;j++){
                x = SCREEN_WIDTH/2 - 8/2*steps;
                y = SCREEN_HEIGHT/2 + j*20-20;

                for(k=0;k<=l[j]-1;k++){
                    drawSprite(d1[c-30]-64,c,(x+k*steps),y);
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

            if (menu_point > SCREEN_HEIGHT/2 + 3*20-20) menu_point = SCREEN_HEIGHT/2 + 3*20-20;
            if (menu_point < SCREEN_HEIGHT/2 + 1*20-20) menu_point = SCREEN_HEIGHT/2 + 1*20-20;

            drawSprite(BUTTON_CURSOR, c,  SCREEN_WIDTH/2 - 5*steps, menu_point);

            if (menu_point == (SCREEN_HEIGHT/2 + 1*20-20) && pressedButtons[0] == 1){
                cleanButtons();
                menumap = 0; gamemap = 1; highscore = 0; credits = 0; CS=1; pressedButtons[0] = 0;
            }
            if (menu_point == (SCREEN_HEIGHT/2 + 2*20-20) && pressedButtons[0] == 1){
                cleanButtons();
                menumap = 0; gamemap = 0; highscore = 1; credits = 0; CS=1; pressedButtons[0] = 0;
            }
            if (menu_point == (SCREEN_HEIGHT/2 + 3*20-20) && pressedButtons[0] == 1){
                cleanButtons();
                menumap = 0; gamemap = 0; highscore = 0; credits = 1; CS=1; pressedButtons[0] = 0;
            }
        }



            //HIGHSCORE------------------------------------------------------
            
            if (highscore == 1){
                if (CS==1){ClearScreen();CS--;}
                int ones, tens, min_ones, min_tens; c = 0;
                char ch[50]=" HIGHSCORE>SCOLL UP>OR DOWN>"; //all caps, > to change line 
                steps = 10; linecount = 1; i = 0;
                while (ch[i]!='\0'){d[i]=ch[i]; i++;}

                for(j=0;j<=i-1;j++){ //run through all the letters in ch[]
                    if (d[j]==62){
                        l[linecount]=j-mod; //letters in 1 line
                        mod = j; linecount ++;
                        }
                    }

                for(j=1;j<=linecount;j++){
                    x = SCREEN_WIDTH/2 - 100;
                    y = SCREEN_HEIGHT/2 - 20 + j*20-20;

                    for(k=0;k<=l[j]-1;k++){
                        drawSprite(d[c]-64,c,(x+k*steps),y);
                        c++;
                        }
                    }
                
                checkbutton();

                x = SCREEN_WIDTH - 50; spriteCounter = 300;
                if(pressedButtons[6] == 1){
                      yhigh = yhigh-10;
                      // if (yhigh < 10) yhigh = 10;
                      pressedButtons[6] = 0;
                    }
                if(pressedButtons[7] == 1){
                      yhigh = yhigh+10;
                      // if (yhigh > SCREEN_HEIGHT) yhigh = SCREEN_HEIGHT;
                      pressedButtons[7] = 0;
                    }

                for (j=0;j<entryno;j++){
                    
                    spriteCounter += 5;
                    ones = saved_counter[j]%10;
                    tens = saved_counter[j]/10%6;
                    min_ones = saved_counter[j]/60%10;
                    min_tens = saved_counter[j]/600;

                    drawSprite(j+1+NUMBER,spriteCounter+5,x-5*steps-7,yhigh+j*10);

                    drawSprite(ones+NUMBER,spriteCounter+1,x,yhigh+j*10);
                    drawSprite(tens+NUMBER,spriteCounter+2,x-steps,yhigh+j*10);
                    drawSprite(min_ones+NUMBER,spriteCounter+3,x-2*steps-7,yhigh+j*10);
                    drawSprite(min_tens+NUMBER,spriteCounter+4,x-3*steps-7,yhigh+j*10);

                }

                if(pressedButtons[1] == 1){
                ClearScreen(); menumap = 1; gamemap = 0; highscore = 0; credits = 0; pressedButtons[1] = 0; yhigh = 10; 
                }
            }


            //CREDITS------------------------------------------------------


            if (credits == 1){
                if (CS==1){ClearScreen();CS--;}
                int ones, tens, min_ones, min_tens;
                char ch[50]=" THANK YOU FOR PLAYING>FROM BENJAMIN>AND MATTHEW>"; //all caps, > to change line 
                steps = 10; linecount = 1; i = 0; mod = 0; c = 0;
                while (ch[i]!='\0'){d[i]=ch[i]; i++;}

                for(j=0;j<=i-1;j++){ //run through all the letters in ch[]
                    if (d[j]==62){
                        l[linecount]=j-mod; //letters in 1 line
                        mod = j; linecount ++;
                        }
                    }

                for(j=1;j<=linecount;j++){
                    x = SCREEN_WIDTH/2 - 120;
                    y = SCREEN_HEIGHT/2 - 20 + j*20-20;

                    for(k=0;k<=l[j]-1;k++){
                        drawSprite(d[c]-64,c,(x+k*steps),y);
                        c++;
                        }
                    }
                
                checkbutton();
                if(pressedButtons[1] == 1){
                ClearScreen(); menumap = 1; gamemap = 0; highscore = 0; credits = 0; pressedButtons[1] = 0; yhigh = 10; 
                }

            }
        }

        // Start of game //
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
        pressedButtons[6] = 0; // Deactivation of Laser


        spriteCounter = 10100;

        for( i = 0; i < 10; i++){                   // Maximum number of lasers that can exist
          if(laserPositions[i][0] == 1){            // if laser is active its moves
            laserPositions[i][2] = laserPositions[i][2] - 2;
            drawSprite(LASER, spriteCounter, laserPositions[i][1], laserPositions[i][2]);
          }

          // Deactivate lasers out of screen
          if(laserPositions[i][2] < -20){
            deactivateLaser(i, spriteCounter);
          }

          spriteCounter++;

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
                if(laserPositions[j][1] >= alienPositions[i][1]-8 && laserPositions[j][1] < alienPositions[i][1]+8 && laserPositions[j][2] == alienPositions[i][2]){
                    if(alienPositions[i][0] == 1){
                      deactivateLaser(j, 10100+j);
                      alienPositions[i][0] = 0;
                      endcount++;
                    }
                  }
                }
          if(alienPositions[i][0] == 1){
            drawSprite(STARDESTROYER, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
          if(alienPositions[i][0] == 0){
            drawSprite(SPACE, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
         }
      }

       // Alien laser //
       alienlaserTimeCounter++;                 // Rate of Fire by the aliens
       if(alienlaserTimeCounter > 150){          //Create the alien laser randomly from an active alien
         createAlienLaser();
         alienlaserTimeCounter = 0;
       }

       spriteCounter = 10200;
       for( i = 0; i < 10; i++){                        // Maximum number of alien lasers that can exist
         if(alienLaserPositions[i][0] == 1){            // if laser is active it moves
           alienLaserPositions[i][2] = alienLaserPositions[i][2] + 2;
           if(alienLaserPositions[i][1] >= playerX-8 && alienLaserPositions[i][1] < playerX+8 && alienLaserPositions[i][2] == playerY){
                      deactivateAlienLaser(i, 10200 + i);
                      lives--;
                  }

           drawSprite(LASER, spriteCounter, alienLaserPositions[i][1], alienLaserPositions[i][2]);
         }

         // Deactivate lasers out of screen
         if(alienLaserPositions[i][2] > 200){
           deactivateAlienLaser(i, 10200 + i);
         }
         spriteCounter++;
       }

      // End of game //
        if(endcount == totalNumAliens || lives == 0){
        cleanButtons();
        if (endcount == totalNumAliens){saved_counter[entryno] = counter; entryno++;}
        ClearScreen(); counter = 0; menumap = 1; gamemap = 0; highscore = 0; credits = 0; endcount = 0; laserCounter = 0; lives = 3;
        for(i = 0; i < totalNumAliens; i++){
            alienPositions[i][0] = 1;
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

}

void createLaser(void){
  laserPositions[laserCounter][0] = 1;
  laserPositions[laserCounter][1] = playerX;
  laserPositions[laserCounter][2] = playerY;
  laserCounter++;
  if(laserCounter > 9){
    laserCounter = 0;
  }
}

void deactivateLaser(int i, int spriteNum){       // To deactivate player's laser,  provide the row and spritenumber
  laserPositions[i][0] = 0;                       // Player's laser starts at 10100
  laserPositions[i][2] = -20;
  drawSprite(LASER, spriteNum, laserPositions[i][1], laserPositions[i][2]);

}

void createAlienLaser(void){                  // Create alien's laser
  int attackingAlien = -1;
  int breakCounter = 0;
  // srand(time(0));
  while(attackingAlien == -1){                  // Choose alien position between 0-9
    attackingAlien = rand();
    attackingAlien = attackingAlien % 10;
    breakCounter++;
    if(alienPositions[attackingAlien][0] == 0){
      attackingAlien = -1;
    }
    if(breakCounter > 10){
      break;
    }
  }
  if(attackingAlien != -1){                       // Create the alien laser
    alienLaserPositions[alienlaserCounter][0] = 1;
    alienLaserPositions[alienlaserCounter][1] = alienPositions[attackingAlien][1];
    alienLaserPositions[alienlaserCounter][2] = alienPositions[attackingAlien][2];
    alienlaserCounter++;
    if(alienlaserCounter > 9){                  // Maximum alien lasers kept at 10
      alienlaserCounter = 0;
    }
  }
}

void deactivateAlienLaser(int i, int spriteNum){        //To deactivate alien's laser, provide the row and spritenumber
  alienLaserPositions[i][0] = 0;                        // Alien's laser starts at 10200
  alienLaserPositions[i][2] = 200;
  drawSprite(LASER, spriteNum, alienLaserPositions[i][1], alienLaserPositions[i][2]);
}

void cleanButtons(void){
  int i;
  for(i = 0; i <= 7; i++){
    pressedButtons[i] = 0;
  }
  // pressedButtons[0] = 0;
}
