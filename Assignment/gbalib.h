#define INPUT                      (KEY_MASK & (~REG_KEYS))

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
		  return -1;
    }
    if ((buttons & KEY_LEFT) == KEY_LEFT)
    {
        //buttonL();
		  //return 1;
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

void drawSprite(int sprites, int N, int x, int y)
{
    // Gift function: displays sprite number numb on screen at position (x,y), as sprite object N
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = sprites*2;
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

    numsprites = 50;
    for (i = 0; i < (numsprites)*8*8/2; i++) // numsprites very impt - sets the limit of sprites that can show
    spriteData[i] = (sprites[i*2+1] << 8) + sprites[i*2];

}

void popSprite(int sprites, char dir, int count, int x, int y)
{
    int i; int step = SCREEN_WIDTH/count;
    if (dir == 'L'){
        for (i=0;i<240;i+=step){
            drawSprite(sprites,i,(x+i)%SCREEN_WIDTH,y);
        }
    }
    if (dir == 'R'){
        for (i=SCREEN_WIDTH;i>0;i-=step){
            drawSprite(sprites,i,(i-x)%SCREEN_WIDTH,y);
        }
    }
}
