#include "gbalib.h"
#define INPUT                      (KEY_MASK & (~REG_KEYS))

extern int myadd(int a, int b, int c, int d, int e);

//global variable
//Resolution: 240x (SCREEN_WIDTH) 160y (SCREEN_HEIGHT)
//Buttons:
//A button = Z, B button = X, Arrow Keys = leftrightpdown


void Handler(void)
{
    u16 Flag; int x, y, steps, ones, tens, min_ones, min_tens, j, k, c, i=0;

    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    Flag = REG_IF;

    if ((REG_IF & INT_TIMER2) == INT_TIMER2){

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////       MENU           /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            if (menumap == 1){

            // c = 1-10

            x = SCREEN_WIDTH/2 - 100; y = 10; c = 0;
            ACSIIprint(x,y," STAR>WARS>", 1, 1, 10, c);

            // c = 10-30

            c = 10;
            drawfours(DEATHSTAR1,DEATHSTAR2,DEATHSTAR3,DEATHSTAR4,SCREEN_WIDTH/2, 40, c, 0);

            drawSprite(SPACESHIP, c+4, SCREEN_WIDTH/2 + 40, 20 +1*20);

            // c = 30-60

            x = SCREEN_WIDTH/2 - 40; y = SCREEN_HEIGHT/2 - 20; c = 30;
            ACSIIprint(x,y," NEW GAME>HIGHSCORE>CREDITS>", 0, 1, 10, c);


            checkbutton();

            if(pressedButtons[6] == 1){ menu_point = menu_point + (-pressedButtons[6])*20; pressedButtons[6] = 0; }
            if(pressedButtons[7] == 1){ menu_point = menu_point + (pressedButtons[7])*20; pressedButtons[7] = 0; }

            if (menu_point > SCREEN_HEIGHT/2 + 3*20-20) menu_point = SCREEN_HEIGHT/2 + 3*20-20;
            if (menu_point < SCREEN_HEIGHT/2 + 1*20-20) menu_point = SCREEN_HEIGHT/2 + 1*20-20;

            // c = 60-90

            c=60; drawSprite(BUTTON_CURSOR, c,  SCREEN_WIDTH/2 - 50, menu_point);

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



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////       HIGHSCORE      /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            if (highscore == 1){
                if (CS==1){ClearScreen();CS--;}

                // c = 0-30

                x = SCREEN_WIDTH/2 - 100; y = SCREEN_HEIGHT/2 - 40; c = 0;
                ACSIIprint(x,y," HIGHSCORE>SCOLL UP>OR DOWN>", 0, 1, 10, c);

                checkbutton();

                x = SCREEN_WIDTH - 50;

                // c = 30-120

                c = 30; y = SCREEN_HEIGHT/2 - 4;
                drawSprite(BUTTON_CURSOR,29,x-40,y);
                for (j=0;j<entryno;j++){

                    c += 5;
                    ones = saved_counter[j]%10;
                    tens = saved_counter[j]/10%6;
                    min_ones = saved_counter[j]/60%10;
                    min_tens = saved_counter[j]/600;

                    drawSprite(j+1+NUMBER,c+5,x-57,yhigh+j*SCREEN_HEIGHT/5);

                    drawfours(min_tens+NUMBER, min_ones+NUMBER, tens+NUMBER, ones+NUMBER, x, yhigh+j*SCREEN_HEIGHT/5, c+1, 1);
                }

                // screen divide by 5
                if(pressedButtons[6] == 1){
                      yhigh = yhigh+(SCREEN_HEIGHT/5);
                      if ((yhigh - SCREEN_HEIGHT/5) > (3*SCREEN_HEIGHT/5)) yhigh = yhigh-(SCREEN_HEIGHT/5);
                      pressedButtons[6] = 0;
                    }
                if(pressedButtons[7] == 1){
                      
                      yhigh = yhigh-(SCREEN_HEIGHT/5);
                      if ((yhigh + entryno*SCREEN_HEIGHT/5) < (2*SCREEN_HEIGHT/5)) yhigh = yhigh+(SCREEN_HEIGHT/5);
                      pressedButtons[7] = 0;
                    }

                if(pressedButtons[1] == 1){
                ClearScreen(); cleanButtons(); menumap = 1; gamemap = 0; highscore = 0; credits = 0; yhigh = 10;
                }
            }


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////       CREDITS        /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            if (credits == 1){
                if (CS==1){ClearScreen();CS--;}

                // c = 0-50

                x = SCREEN_WIDTH/2 - 120; y = SCREEN_HEIGHT/2 - 40; c = 0;
                ACSIIprint(x,y," THANK YOU FOR PLAYING>FROM BENJAMIN>AND MATTHEW>", 0, 1, 10, c);

                checkbutton();

                if(pressedButtons[1] == 1){
                ClearScreen(); cleanButtons(); menumap = 1; gamemap = 0; highscore = 0; credits = 0; yhigh = 10;
                }

            }
        }


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////       GAME START     /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if (gamemap == 1){
        if (CS==1){ClearScreen();CS--;}


        if ((REG_IF & INT_TIMER0) == INT_TIMER0){

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////    LIVES & TIMER     /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        int distx,
        steps = 7;

        x = SCREEN_WIDTH - 15; y = 16; c = 0;

        ones = counter%10;
        tens = counter/10%6;
        min_ones = counter/60%10;
        min_tens = counter/600;

        drawfours(min_tens+NUMBER, min_ones+NUMBER, tens+NUMBER, ones+NUMBER, x, y, c+1, 1);

        distx = x-3*steps-7;

        x = distx-130; c = 5;
        ACSIIprint(x,y," LIVES>", 0, 0, 7, c);

        spriteCounter = 20;
        for(k=0;k<3;k++){
            drawSprite(SPACESHIP, k+spriteCounter, (k*2*steps+50+x), y-5);
            for(i=0;i<3-lives;i++) drawSprite(SPACE, i+spriteCounter, (i*2*steps+50+x), y-5);
            }

        counter++;

        }


        if ((REG_IF & INT_TIMER1) == INT_TIMER1){ // TODO: replace XXX with the specific interrupt you are handling

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////   PLAYER & LASER     /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        checkbutton();
        spriteCounter = playerSpriteCounter;

        // Spaceship position //
        playerX = myadd(playerX, pressedButtons[4], pressedButtons[5], maxAlienRight, maxAlienLeft);
        pressedButtons[4] = 0;
        pressedButtons[5] = 0;


        drawSprite(SPACESHIP, spriteCounter, playerX, playerY);


        // Create player laser //
        // [0] = Active [1] = X  [2] = Y
        laserTimeCounter++;
        if(laserTimeCounter > 25 && pressedButtons[6] == 1){    // Rate of Fire
            createLaser();                                      // Activation of Laser
            laserTimeCounter = 0;
        }
        pressedButtons[6] = 0;

        // Update player laser positions //
        spriteCounter = playerLaserSpriteCounter;

        for( i = 0; i < 10; i++){                   // Maximum number of lasers that can exist
          if(laserPositions[i][0] == 1){            // if laser is active its moves
            laserPositions[i][2] = laserPositions[i][2] - 2;
            drawSprite(LASER, spriteCounter + i, laserPositions[i][1], laserPositions[i][2]);
          }
          // Deactivate lasers out of screen
          if(laserPositions[i][2] < -20){
            deactivateLaser(i, spriteCounter + i);
          }
        }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////       STAGE 1        /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        // Update alien positions //
        // [0] = Active [1] = X  [2] = Y
      if(endcount < numAliens){

        // Update alien positions //
        alienTimer++;
        if(alienTimer == 3){
          enemyMove(numAliens, alienPositions);
          alienTimer = 0;
        }

        // Print alien positions //
        // [0] = Active [1] = X  [2] = Y
        spriteCounter = playerLaserSpriteCounter;
        NAlien = alienSpriteCounter; // must be the same counter not reproduce
        for(i = 0; i < numAliens; i++){
            //Using a standard fixed sprite number for Aliens
            for(j = 0; j < laserCounter; j++){
                if(laserPositions[j][1] >= alienPositions[i][1]-8 && laserPositions[j][1] < alienPositions[i][1]+8 && laserPositions[j][2] == alienPositions[i][2]){
                    if(alienPositions[i][0] == 1){
                      deactivateLaser(j, spriteCounter+j);
                      alienPositions[i][0] = 0;
                      endcount++;
                    }
                  }
                }
          if(alienPositions[i][0] == 1){
            drawSprite(ALIEN1, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
          if(alienPositions[i][0] == 0){
            drawSprite(SPACE, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
         }

         // Alien laser //
         alienlaserTimeCounter++;                 // Rate of Fire by the aliens
         if(alienlaserTimeCounter > 150){          //Create the alien laser randomly from an active alien
           createAlienLaser();
           alienlaserTimeCounter = 0;
         }

         spriteCounter = alienLaserSpriteCounter;
         for( i = 0; i < 10; i++){
           if(alienLaserPositions[i][0] == 1){
             alienLaserPositions[i][2] = alienLaserPositions[i][2] + 2;
             drawSprite(LASER, spriteCounter + i, alienLaserPositions[i][1], alienLaserPositions[i][2]);
           }
           if(alienLaserPositions[i][1] >= playerX-8 && alienLaserPositions[i][1] < playerX+8 && alienLaserPositions[i][2] == playerY){
              deactivateAlienLaser(i, spriteCounter + i);
              lives--;
            }
           if(alienLaserPositions[i][2] > 200){
             deactivateAlienLaser(i, spriteCounter + i);
           }
         }
      }


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////       STAGE 2        /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

       if(endcount >= numAliens){

         // Boss position
         alienTimer++;
         if(alienTimer == 3){
           enemyMove(numBosses, bossPositions);
           alienTimer = 0;
         }

         // Print boss positions //
         // [0] = Health [1] = X  [2] = Y
         spriteCounter = playerLaserSpriteCounter;
         NAlien = alienSpriteCounter; // must be the same counter not reproduce
         for(i = 0; i <= 2; i++){
             //Using a standard fixed sprite number for Aliens
             for(j = 0; j < laserCounter; j++){
                 if(laserPositions[j][1] >= bossPositions[i][1]-8 && laserPositions[j][1] < bossPositions[i][1]+8 && laserPositions[j][2] == bossPositions[i][2]){
                     if(bossPositions[i][0] >= 1){
                       deactivateLaser(j, spriteCounter+j);
                       bossPositions[i][0] = bossPositions[i][0] - 1;
                       if(bossPositions[i][0] == 0){
                         endcount++;
                       }
                     }
                   }
                 }
           if(bossPositions[i][0] >= 1){
            if(i==1){
             if(bossPositions[1][0] >= 1) drawfours(DEATHSTAR1,DEATHSTAR2,DEATHSTAR3,DEATHSTAR4,bossPositions[i][1], bossPositions[i][2], NAlien+5+i, 0);
            }
             else drawSprite(STARDESTROYER, NAlien + i, bossPositions[i][1], bossPositions[i][2]);
             }
           if(bossPositions[i][0] == 0){
            if(i==1){
             if(bossPositions[1][0] == 0) drawfours(0,0,0,0, bossPositions[i][1], bossPositions[i][2], NAlien+5+i, 0);
            }
             drawSprite(SPACE, NAlien + i, bossPositions[i][1], bossPositions[i][2]);
             }
          }

          // Boss lasers //
          alienlaserTimeCounter++;                 // Rate of Fire by the aliens
          if(alienlaserTimeCounter > 50){          //Create the alien laser randomly from an active alien
            createBossLaser();
            alienlaserTimeCounter = 0;
          }

          spriteCounter = alienLaserSpriteCounter;
          for( i = 0; i < 10; i++){
            if(alienLaserPositions[i][0] == 1){
              alienLaserPositions[i][2] = alienLaserPositions[i][2] + 2;
              drawSprite(LASER, spriteCounter + i, alienLaserPositions[i][1], alienLaserPositions[i][2]);
            }
            if(alienLaserPositions[i][1] >= playerX-8 && alienLaserPositions[i][1] < playerX+8 && alienLaserPositions[i][2] == playerY){
               deactivateAlienLaser(i, spriteCounter + i);
               lives--;
             }
            if(alienLaserPositions[i][2] > 200){
              deactivateAlienLaser(i, spriteCounter + i);
            }
          }
      }

          //YOU WIN
          if (endcount == (numAliens + numBosses)){

              x = SCREEN_WIDTH/2 - 40; y = SCREEN_HEIGHT/2; c = 300;
              ACSIIprint(x,y," YOU WIN>", 0, 0, 10, c);

              for( i = 0; i < 10; i++) deactivateAlienLaser(i, alienLaserSpriteCounter + i);
              winlosecounter++;

              if(winlosecounter > 100) winlosecounter = 0;
          }

          //YOU LOSE
          if (lives <= 0){

              x = SCREEN_WIDTH/2 - 40; y = SCREEN_HEIGHT/2; c = 300;
              ACSIIprint(x,y," YOU LOSE>", 0, 0, 10, c);

              for( i = 0; i < 10; i++) deactivateLaser(i, playerLaserSpriteCounter + i);
              winlosecounter++;

              if(winlosecounter > 100) winlosecounter = 0;
          }

      // End of game* //
      if((endcount == (numAliens + numBosses) || lives <= 0) && winlosecounter == 0){
          cleanButtons();
          if (endcount == (numAliens + numBosses)){saved_counter[entryno] = counter; entryno++;}
          ClearScreen(); counter = 0; menumap = 1; gamemap = 0; highscore = 0; credits = 0; endcount = 0; laserCounter = 0; lives = 3;
          for(i = 0; i < numAliens; i++){
              alienPositions[i][0] = 1;
              }
          for(i = 0; i < numBosses; i++){
            bossPositions[i][0] = 5;
            }
          spriteCounter = 200;
          for(i = 0; i < 10; i++){
            deactivateLaser(i, spriteCounter + i);
            }
        }


    }
  }

    REG_IF = Flag; // Update interrupt table, to confirm we have handled this interrupt
    REG_IME = 0x01;  // Re-enable interrupt handling
  }
