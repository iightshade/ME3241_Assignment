#include "gba.h"
#include <time.h>
#define INPUT                      (KEY_MASK & (~REG_KEYS))

// Global Variable
int winlosecounter = 0;
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
int maxLaserNum = 10;
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
int bossPositions[3][3] = {
  {5, 30, 50},
  {20, 60, 50},
  {5, 106, 50}
};
int numBosses = 3;
int alienTimer = 0;
int numAliens = 10;
int aliensMove = 1;
int maxAlienRight = 220;
int maxAlienLeft = 10;
// pressedButtons records which buttons have been pressed
// A, B, Sel, Str, R, L, U, D
int pressedButtons[8] = {};
int alienLaserPositions[10][3];
int alienlaserCounter = 0;
int alienlaserTimeCounter = 0;

int endCount;
int saved_counter[20] ={};
int entryno = 0;
int yhigh = 10;
int lives = 3;

int playerSpriteCounter = 30;
int playerLaserSpriteCounter = 200;
int alienSpriteCounter = 100;
int alienLaserSpriteCounter = 300;



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////// DISPLAY AND GRAPHICS /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void ClearScreen(void)
{
    int x,y,c=0;
    for (x = 0; x < SCREEN_WIDTH+20; x++){
        for (y = 0; y < SCREEN_HEIGHT+20; y++){
                drawSprite(SPACE,c,x,y); c++;
                }
            }

}

void ACSIIprint(int x, int y, char ch[50], int j_iclx, int j_icly, int steps, int c)
{
    int i=0,j,k,mod=0,xpos,ypos,linecount=1,d[50]={},l[10]={};

    while (ch[i]!='\0'){d[i]=ch[i]; i++;}
    for(j=0;j<=i-1;j++){ //run through all the letters in ch[]
        if (d[j]==62){
            l[linecount]=j-mod; //letters in 1 line
            mod = j; linecount ++;
            }
        }
    i = 0;
    for(j=1;j<=linecount;j++){
        xpos = x + j_iclx*j*20;
        ypos = y + j_icly*j*20;

        for(k=0;k<=l[j]-1;k++){
            drawSprite(d[i]-64,c,(xpos+k*steps),ypos);
            c++; i++;
            }
        }
}

void drawSprite(int spritenumb, int N, int x, int y)
{
    // Gift function: displays sprite number numb on screen at position (x,y), as sprite object N
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;

    if (spritenumb <= SPRITE8) {
        *(unsigned short *)(0x7000004 + 8*N) = spritenumb*2;
        *(unsigned short *)(0x7000002 + 8*N) = x;
    }
    else if (spritenumb >= 40){
    {
        *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
        *(unsigned short *)(0x7000004 + 8*N) = (spritenumb/4*8);
        }

    }
}

void drawfours(int sprite1, int sprite2, int sprite3, int sprite4, int x, int y, int numb, int selection)
{
  int steps = 7;
  if (selection==0){ // draw boss
    drawSprite(sprite4, numb, x + 16, y);
    drawSprite(sprite3, numb+1, x, y);
    drawSprite(sprite2, numb+2, x + 16, y -16);
    drawSprite(sprite1, numb+3, x, y -16);}

  if (selection==1){ // draw clock
    drawSprite(sprite4, numb, x, y);
    drawSprite(sprite3, numb+1, x-steps, y);
    drawSprite(sprite2, numb+2, x-2*steps-7, y);
    drawSprite(sprite1, numb+3, x-3*steps-7, y);}
}


void fillPalette(void)
{
    int i;
    // Fill the palette in GBA memory
    for (i = 0; i < NCOLS; i++)
        spritePal[i] = palette[i];
}

void fillSprites(void)
{
    int i,numsprites;

    numsprites = 50; // numsprites very impt - sets the limit of sprites that can show
    for (i = 0; i <= (SPRITE8-1)*8*8; i++) spriteData[i] = (sprites8[i*2+1] << 8) + sprites8[i*2];
    for (i = 0; i <= (60*16*16); i++) {spriteData[i+((37)*8*8)] = (sprites16[i*2+1] << 8) + sprites16[i*2];}

}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////// BUTTONS //////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// LASER, ENEMY, BOSS /////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void createLaser(void){
  laserPositions[laserCounter][0] = 1;
  laserPositions[laserCounter][1] = playerX;
  laserPositions[laserCounter][2] = playerY;
  laserCounter++;
  if(laserCounter >= maxLaserNum){
    laserCounter = 0;
  }
}

void deactivateLaser(int i, int spriteNum){       // To deactivate player's laser,  provide the row and spritenumber
  laserPositions[i][0] = 0;                       // Player's laser starts at 10100
  laserPositions[i][2] = -30;
  drawSprite(LASER, spriteNum, laserPositions[i][1], laserPositions[i][2]);

}

void enemyMove(int numRows, int enemyPosition[][3]){
  int i = 0;
  numRows = numRows - 1;
  if(enemyPosition[numRows][1] > maxAlienRight){ // Move L once hit the maximum right frame
    aliensMove = -1;
  }
  if(enemyPosition[0][1] < maxAlienLeft){  // Move R once hit the maximum right frame
    aliensMove = 1;
  }
  for(i = 0; i <= numRows; i++){ // X position of all ALIENS moving together
    enemyPosition[i][1] = enemyPosition[i][1] + aliensMove;
  }
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
    if(alienlaserCounter >= maxLaserNum){                  // Maximum alien lasers kept at 10
      alienlaserCounter = 0;
    }
  }
}

void deactivateAlienLaser(int i, int spriteNum){        //To deactivate alien's laser, provide the row and spritenumber
  alienLaserPositions[i][0] = 0;                        // Alien's laser starts at 10200
  alienLaserPositions[i][2] = 200;
  drawSprite(LASER, spriteNum, alienLaserPositions[i][1], alienLaserPositions[i][2]);
}

void removeAlien(int i){
  alienPositions[i][1] = 0;
  alienPositions[i][2] = 200;
}

void cleanButtons(void){
  int i;
  for(i = 0; i <= 7; i++){
    pressedButtons[i] = 0;
  }
}

void createBossLaser(void){                  // Create alien's laser
  int attackingAlien = -1;
  int breakCounter = 0;
  int laserSize = 0;
  // srand(time(0));
  while(attackingAlien == -1){                  // Choose alien position between 0-2
    attackingAlien = rand();
    attackingAlien = attackingAlien % 3;
    breakCounter++;
    if(bossPositions[attackingAlien][0] == 0){
      attackingAlien = -1;
    }
    if(breakCounter > 10){
      break;
    }
  }

  laserSize = (rand() % 3) + 1;
  // Laser size determines the number of lasers fired

  if(attackingAlien != -1){                       // Create the alien laser.
    // Laser size 1
    alienLaserPositions[alienlaserCounter][0] = 1;
    alienLaserPositions[alienlaserCounter][1] = bossPositions[attackingAlien][1];
    alienLaserPositions[alienlaserCounter][2] = bossPositions[attackingAlien][2];
    alienlaserCounter++;
  }
  if(alienlaserCounter >= maxLaserNum){                  // Maximum alien lasers kept at 10
    alienlaserCounter = 0;
  }

  if(laserSize >= 2){

    alienLaserPositions[alienlaserCounter][0] = 1;
    alienLaserPositions[alienlaserCounter][1] = bossPositions[attackingAlien][1] - 6;
    alienLaserPositions[alienlaserCounter][2] = bossPositions[attackingAlien][2];
    alienlaserCounter++;
  }
  if(alienlaserCounter >= maxLaserNum){                  // Maximum alien lasers kept at 10
    alienlaserCounter = 0;
  }

  if(laserSize >= 3){

    alienLaserPositions[alienlaserCounter][0] = 1;
    alienLaserPositions[alienlaserCounter][1] = bossPositions[attackingAlien][1] + 6;
    alienLaserPositions[alienlaserCounter][2] = bossPositions[attackingAlien][2];
    alienlaserCounter++;
  }

  if(alienlaserCounter >= maxLaserNum){                  // Maximum alien lasers kept at 10
    alienlaserCounter = 0;
  }
}

int enemyHit(int spriteCount, int laserPos[][3], int enemyPos[][3], int laserCount, int i){
  int endCount = 0;
  int j = 0;
  for(j = 0; j < laserCounter; j++){
    if(laserPos[j][1] >= enemyPos[i][1]-8 && laserPos[j][1] < enemyPos[i][1]+8 && laserPos[j][2] == enemyPos[i][2]){
        if(enemyPos[i][0] >= 1){
          deactivateLaser(j, spriteCounter+j);
          enemyPos[i][0] = enemyPos[i][0] - 1;
          if(enemyPos[i][0] == 0){
            endCount++;
          }
        }
      }
    }
  return endCount;
}

int playerHit(int spriteCount, int alienLaserPos[][3], int playerX, int playerY){
  int i = 0;
  int lives = 0;
  for( i = 0; i < 10; i++){
    if(alienLaserPositions[i][0] == 1){
      alienLaserPositions[i][2] = alienLaserPositions[i][2] + 2;
      drawSprite(LASER, spriteCounter + i, alienLaserPositions[i][1], alienLaserPositions[i][2]);
    }
    if(alienLaserPositions[i][1] >= playerX-8 && alienLaserPositions[i][1] < playerX+8 && alienLaserPositions[i][2] == playerY){
       deactivateAlienLaser(i, spriteCounter + i);
       lives++;
     }
    if(alienLaserPositions[i][2] > 200){
      deactivateAlienLaser(i, spriteCounter + i);
    }
  }
  return lives;
}
