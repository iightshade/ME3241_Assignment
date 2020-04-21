# 1 "main.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "main.c"



# 1 "sprites.h" 1
# 1 "gba.h" 1







typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef signed char s8;
typedef signed short s16;
typedef signed int s32;

typedef unsigned char byte;
typedef unsigned short hword;
typedef unsigned int word;
# 211 "gba.h"
enum
{
    VBLANK_HANDLER,
    HBLANK_HANDLER,
    VCOUNT_HANDLER,
    TIMER0_HANDLER,
    TIMER1_HANDLER,
    TIMER2_HANDLER,
    TIMER3_HANDLER,
    SERIAL_COM_HANDLER,
    DMA0_HANDLER,
    DMA1_HANDLER,
    DMA2_HANDLER,
    DMA3_HANDLER,
    KEYS_HANDLER,
    CART_HANDLER,
    MAX_INTERRUPT_HANDLERS,
};
# 267 "gba.h"
typedef void (*fp)(void);
# 2 "sprites.h" 2




int palette[] = {
((0) + (0<<5) + (0<<10)),
((31) + (31<<5) + (31<<10)),
((0) + (31<<5) + (31<<10)),
((26) + (26<<5) + (26<<10)),
((9) + (9<<5) + (9<<10)),
((31) + (31<<5) + (0<<10)),
((31) + (0<<5) + (0<<10)),
((0) + (0<<5) + (31<<10)),
((11) + (8<<5) + (3<<10)),
((27) + (27<<5) + (27<<10)),
((16) + (16<<5) + (16<<10)),
((31) + (17<<5) + (17<<10)),
((31) + (24<<5) + (24<<10)),
((27) + (0<<5) + (0<<10)),
((0) + (16<<5) + (0<<10)),
((0) + (31<<5) + (0<<10)),
((16) + (31<<5) + (16<<10)),
((23) + (31<<5) + (23<<10))
};




u16 sprites[] = {


    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,

    0,0,1,1,1,1,0,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,

    0,1,1,1,1,1,0,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,1,1,1,1,0,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,1,1,1,1,0,0,

    0,0,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,0,1,1,1,1,1,0,

    0,1,1,1,1,1,0,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,1,1,1,1,0,0,

    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,1,1,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,1,1,1,1,0,

    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,1,1,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,

    0,0,1,1,1,1,0,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,0,0,
    0,1,0,0,1,1,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,

    0,1,1,1,1,1,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,1,1,1,1,1,0,0,

    0,0,0,0,0,0,1,0,
    0,0,0,0,0,0,1,0,
    0,0,0,0,0,0,1,0,
    0,0,0,0,0,0,1,0,
    0,0,0,0,0,0,1,0,
    0,0,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,1,0,0,0,1,0,0,
    0,1,0,0,1,0,0,0,
    0,1,0,1,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,0,1,0,0,0,0,
    0,1,0,0,1,0,0,0,
    0,1,0,0,0,1,0,0,
    0,1,0,0,0,0,1,0,

    0,1,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,
    0,1,1,1,1,1,1,0,

    0,1,0,0,0,0,1,0,
    0,1,1,0,0,1,1,0,
    0,1,0,1,1,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,

    0,1,0,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,0,1,0,0,1,0,
    0,1,0,0,1,0,1,0,
    0,1,0,0,0,1,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,

    0,0,1,1,1,1,0,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,0,1,1,1,1,0,0,


    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    0,1,1,1,1,1,1,0,
    0,0,1,1,1,1,0,0,
# 340 "sprites.h"
};
# 5 "main.c" 2

# 1 "gbalib.h" 1


void drawSprite(int sprites, int N, int x, int y)
{

    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = sprites*2;
}

void fillPalette(void)
{
    int i;

    for (i = 0; i < 20; i++)
        ((unsigned short *) 0x5000200)[i] = palette[i];
}

void fillSprites(void)
{
    int i,numsprites;

    numsprites = 50;
    for (i = 0; i < (numsprites)*8*8/2; i++)
    ((unsigned short *) 0x6010000)[i] = (sprites[i*2+1] << 8) + sprites[i*2];

}

void popSprite(int sprites, char dir, int count, int x, int y)
{
    int i; int step = 240/count;
    if (dir == 'L'){
        for (i=0;i<240;i+=step){
            drawSprite(sprites,i,(x+i)%240,y);
        }
    }
    if (dir == 'R'){
        for (i=240;i>0;i-=step){
            drawSprite(sprites,i,(i-x)%240,y);
        }
    }
}
# 7 "main.c" 2
# 1 "myhandler.h" 1





int counter = 0;
int countertens = 0;

void Handler(void)
{
    u16 Flag;
    int x,y,steps,a1,a2;
    int newline = 0;
    int d[50]={},l[10]={};
    int i = 0, j, k, linecount = 1;
    char ch[50]="GAME>";
    a1 = 0; a2 = 1;
    steps = 10;

    *(u16*)0x4000208 = 0x00;
    Flag = *(u16*)0x4000202;
# 31 "myhandler.h"
    if ((*(u16*)0x4000202 & 0x8) == 0x8)
    {
      while (ch[i] != '\0'){d[i] = ch[i]; i++;}
      x = 240 / 2 - i / 2 * steps;
      y = 160 / 2;

      for(k = 0; k <= i - 1; k++){
        drawSprite(d[k] - 64, k, (x + k *steps), y);
      }
    }
# 70 "myhandler.h"
    if ((*(u16*)0x4000202 & 0x10) == 0x10)
        {
# 83 "myhandler.h"
    }

    if (0x100==1) {
      for(k = 0; k <= i-1; k++) drawSprite(d[k] - 64, k, (x+2*k*steps), y);
    }
    *(u16*)0x4000202 = Flag;
    *(u16*)0x4000208 = 0x01;
}
# 8 "main.c" 2
# 19 "main.c"
int main(void)
{


    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;


    *(unsigned short *) 0x5000200 = 0;
    *(unsigned short *) 0x5000202 = ((31) + (31<<5) + (31<<10));

    fillPalette();
    fillSprites();


    *(u16*)0x4000208 = 0x0;
    (*(unsigned int*)0x3007FFC) = (int)&Handler;
    *(u16*)0x4000200 |= 0x8 | 0x10 | 0x1000;
    *(volatile u16*)0x4000132 |= 0x7FFF;
    *(u16*)0x4000208 = 0x1;


    *(u16*)0x4000100 = 49141;
    *(u16*)0x4000102 |= 0x0003 | 0x0080 | 0x0040;

    *(u16*)0x4000104 = 57337;
    *(u16*)0x4000106 |= 0x0003 | 0x0080 | 0x0040;

    while(1);

        return 0;
}
