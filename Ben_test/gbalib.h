#define INPUT                      (KEY_MASK & (~REG_KEYS))

void drawSprite(int spritenumb, int N, int x, int y)
{   
    // Gift function: displays sprite number numb on screen at position (x,y), as sprite object N
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;

    if (spritenumb <= SPRITE8) {
        *(unsigned short *)(0x7000004 + 8*N) = spritenumb*2;
        *(unsigned short *)(0x7000002 + 8*N) = x;
    }
    else if (spritenumb >= 40) 
    {
        *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
        *(unsigned short *)(0x7000004 + 8*N) = (spritenumb/4*8);
    }
    // else {*(unsigned short *)(0x7000004 + 8*N) = spritenumb*32;}
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
    for (i = 0; i <= (43*16*16); i++) {spriteData[i+((37)*8*8)] = (sprites16[i*2+1] << 8) + sprites16[i*2];}
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

void ClearScreen()
{
    int x,y,c=0;
    for (x = 0; x < SCREEN_WIDTH; x++){
        for (y = 0; y < SCREEN_HEIGHT; y++){
                drawSprite(SPACE,c,x,y); c++;
                }
            } 

}

