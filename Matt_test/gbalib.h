#define INPUT                      (KEY_MASK & (~REG_KEYS))

void drawSprite(int spritenumb, int N, int x, int y)
{   
    // Gift function: displays sprite number numb on screen at position (x,y), as sprite object N
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
    *(unsigned short *)(0x7000004 + 8*N) = spritenumb*8;
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