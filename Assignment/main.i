# 1 "main.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "main.c"



# 1 "sprites8.h" 1
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
# 2 "sprites8.h" 2




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







u16 sprites8[] = {






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
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,1,1,1,1,0,0,
    0,1,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,

    0,0,1,1,1,1,0,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,1,0,1,0,
    0,1,0,0,1,1,1,0,
    0,1,0,0,0,1,1,0,
    0,0,1,1,1,0,1,1,

    0,0,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,1,1,1,0,0,
    0,1,0,1,1,0,0,0,
    0,1,0,0,1,1,0,0,
    0,1,0,0,0,1,1,0,
    0,1,0,0,0,1,1,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,0,1,1,1,1,0,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,0,1,1,0,
    0,1,0,0,0,1,1,0,
    0,0,1,1,1,1,0,0,

    0,1,1,1,1,1,0,0,
    0,1,1,1,1,1,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,

    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,0,0,1,0,0,
    0,0,0,1,1,0,0,0,

    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,0,1,1,0,1,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,1,1,0,
    0,1,0,0,0,0,1,0,

    0,1,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,1,1,0,0,1,0,0,
    0,0,1,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,0,1,1,0,0,
    0,1,0,0,0,1,1,0,
    0,1,0,0,0,0,1,0,

    0,1,1,0,0,1,0,0,
    0,1,1,0,0,1,0,0,
    0,0,1,1,1,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,1,0,0,0,0,

    0,1,1,1,1,1,1,0,
    0,0,1,1,1,1,0,0,
    0,0,0,0,1,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,1,0,0,0,0,0,
    0,1,0,0,0,0,0,0,
    0,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,0,




    0,0,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,1,1,0,
    0,1,1,0,1,0,1,0,
    0,1,1,1,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,0,1,0,0,0,
    0,0,1,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,1,1,1,0,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,0,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,1,1,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,1,0,0,0,0,
    0,1,1,1,1,1,1,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,0,1,0,
    0,0,0,0,0,0,1,0,
    0,0,0,1,1,1,0,0,
    0,0,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,0,1,1,0,0,
    0,0,0,1,1,1,0,0,
    0,0,1,1,0,1,0,0,
    0,1,1,0,0,1,0,0,
    0,1,1,1,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,

    0,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,0,1,1,1,1,0,0,
    0,0,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,1,1,1,1,0,
    0,0,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,1,1,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,1,0,0,0,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,0,1,1,0,



    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    0,1,1,1,1,1,1,0,
    0,0,1,1,1,1,0,0,

};
# 5 "main.c" 2
# 1 "sprites16.h" 1







u16 sprites16[] = {






    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,

    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,


    0,0,0,0,0,0,13,1,
    0,0,0,0,0,0,13,2,
    0,0,0,0,0,13,2,2,
    0,0,0,0,0,13,1,1,
    0,0,0,0,13,1,1,1,
    0,0,0,0,13,1,1,1,
    0,0,0,13,1,1,1,1,
    0,0,0,13,1,1,1,1,

    1,13,0,0,0,0,0,0,
    2,13,0,0,0,0,0,0,
    2,2,13,0,0,0,0,0,
    1,1,13,0,0,0,0,0,
    1,1,1,13,0,0,0,0,
    1,1,1,13,0,0,0,0,
    1,1,1,3,13,0,0,0,
    1,1,1,1,13,0,0,0,

    1,1,1,13,1,1,1,1,
    1,1,1,13,1,1,1,1,
    1,1,1,13,1,1,1,1,
    1,1,1,0,0,0,0,0,
    1,1,1,0,0,0,0,0,
    1,1,1,0,0,0,0,0,
    1,1,1,0,0,0,0,0,
    1,1,1,0,0,0,0,0,

    1,1,1,1,13,1,1,1,
    1,1,1,1,13,1,1,1,
    1,1,1,1,13,1,1,1,
    0,0,0,0,0,1,1,1,
    0,0,0,0,0,1,1,1,
    0,0,0,0,0,1,1,1,
    0,0,0,0,0,1,1,1,
    0,0,0,0,0,1,1,1,



    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,

    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,

    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,
    0,0,0,0,0,0,11,11,

    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,
    11,11,0,0,0,0,0,0,



    0,0,0,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,1,1,1,1,1,
    0,1,1,7,7,1,1,1,
    0,1,1,7,7,1,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,0,0,0,0,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,0,1,1,0,
    1,1,1,1,1,1,1,0,
    1,1,1,7,7,1,1,0,
    0,1,1,7,7,1,1,0,
    0,0,1,1,1,1,0,0,

    0,7,7,7,7,7,7,7,
    0,1,1,7,7,1,1,7,
    1,1,1,1,1,1,1,1,
    0,1,1,1,1,1,1,1,
    0,1,1,1,1,1,1,1,
    0,0,1,1,1,1,1,1,
    0,0,0,1,1,1,1,1,
    0,0,0,0,1,1,1,1,

    7,7,7,7,7,7,7,0,
    7,1,1,7,7,1,1,0,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,0,
    1,1,1,1,1,1,1,0,
    1,1,1,1,1,1,0,0,
    1,1,1,1,1,0,0,0,
    1,1,1,1,0,0,0,0,
# 186 "sprites16.h"
};
# 6 "main.c" 2

# 1 "gbalib.h" 1


void drawSprite(int spritenumb, int N, int x, int y)
{

    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;

    if (spritenumb <= 37) {
        *(unsigned short *)(0x7000004 + 8*N) = spritenumb*2;
        *(unsigned short *)(0x7000002 + 8*N) = x;
    }
    else if (spritenumb >= 40)
    {
        *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
        *(unsigned short *)(0x7000004 + 8*N) = (spritenumb/4*8);
    }

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
    for (i = 0; i <= (37 -1)*8*8; i++) ((unsigned short *) 0x6010000)[i] = (sprites8[i*2+1] << 8) + sprites8[i*2];
    for (i = 0; i <= (43*16*16); i++) {((unsigned short *) 0x6010000)[i+((37)*8*8)] = (sprites16[i*2+1] << 8) + sprites16[i*2];}
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

void ClearScreen()
{
    int x,y,c=0;
    for (x = 0; x < 240 +20; x++){
        for (y = 0; y < 160 +20; y++){
                drawSprite(0,c,x,y); c++;
                }
            }

}
# 8 "main.c" 2
# 1 "myhandler.h" 1





int counter = 0;
int pos = 0;
int playerX = 240/2, playerY = 160 -20;

int menu_point = 160/2 + 1*20-20;
int menumap = 1, gamemap = 0, highscore = 0;
int CS = 0;

int NAlien;
int spriteCounter;
int laserPositions[10][3];
int laserCounter = 0;
int laserTimeCounter = 0;

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


int pressedButtons[8] = {};

int endcount;
int saved_counter[20] ={};
int entryno = 0;
int yhigh = 10;

void Handler(void)
{
    u16 Flag; int x,y,steps,a1,a2; int newline = 0;
    int d[50]={},l[10]={},i=0,j,linecount=1,k, c=0,mod=0;

    a1 = 0; a2 = 1;

    *(u16*)0x4000208 = 0x00;
    Flag = *(u16*)0x4000202;

    if (menumap == 1){
        if ((*(u16*)0x4000202 & 0x20) == 0x20){
            char ch[50]=" NEW GAME>HIGHSCORE>CREDITS>";
            steps = 10;

            while (ch[i]!='\0'){d[i]=ch[i]; i++;}

            for(j=0;j<=i-1;j++){
                if (d[j]==62){
                    l[linecount]=j-mod;
                    mod = j; linecount ++;
                    }
                }

            for(j=1;j<=linecount;j++){
                x = 240/2 - 8/2*steps;
                y = 160/2 + j*20-20;

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

            if (menu_point > 160/2 + 3*20-20) menu_point = 160/2 + 3*20-20;
            if (menu_point < 160/2 + 1*20-20) menu_point = 160/2 + 1*20-20;

            drawSprite(37, c, 240/2 - 5*steps, menu_point);

            if (menu_point == (160/2 + 1*20-20) && pressedButtons[0] == 1){
                menumap = 0; gamemap = 1; highscore = 0; CS=1; pressedButtons[0] = 0;
            }
            if (menu_point == (160/2 + 2*20-20) && pressedButtons[0] == 1){
                menumap = 0; gamemap = 0; highscore = 1; CS=1; pressedButtons[0] = 0;
            }
        }

    }

    if (highscore == 1){
        if (CS==1){ClearScreen();CS--;}
        if ((*(u16*)0x4000202 & 0x20) == 0x20){
            int ones, tens, min_ones, min_tens;
            char ch[50]=" HIGHSCORE>SCOLL UP>OR DOWN>";
            steps = 10; linecount = 1;
            while (ch[i]!='\0'){d[i]=ch[i]; i++;}

            for(j=0;j<=i-1;j++){
                if (d[j]==62){
                    l[linecount]=j-mod;
                    mod = j; linecount ++;
                    }
                }

            for(j=1;j<=linecount;j++){
                x = 240/2 - 100;
                y = 160/2 - 20 + j*20-20;

                for(k=0;k<=l[j]-1;k++){
                    drawSprite(d[c]-64,c,(x+k*steps),y);
                    c++;
                    }
                }

            checkbutton();

            x = 240 - 50; spriteCounter = 300;
            if(pressedButtons[6] == 1){
                  yhigh = yhigh-10;
                  if (yhigh < 10) yhigh = 10;
                  pressedButtons[6] = 0;
                }
            if(pressedButtons[7] == 1){
                  yhigh = yhigh+10;
                  if (yhigh > 160 - entryno*10) yhigh = 160;
                  pressedButtons[7] = 0;
                }

            for (j=0;j<entryno;j++){

                spriteCounter += 5;
                ones = saved_counter[j]%10;
                tens = saved_counter[j]/10%6;
                min_ones = saved_counter[j]/60%10;
                min_tens = saved_counter[j]/600;

                drawSprite(j+1+27,spriteCounter+5,x-5*steps-7,yhigh+j*10);

                drawSprite(ones+27,spriteCounter+1,x,yhigh+j*10);
                drawSprite(tens+27,spriteCounter+2,x-steps,yhigh+j*10);
                drawSprite(min_ones+27,spriteCounter+3,x-2*steps-7,yhigh+j*10);
                drawSprite(min_tens+27,spriteCounter+4,x-3*steps-7,yhigh+j*10);

            }

            if(pressedButtons[1] == 1){
            ClearScreen(); menumap = 1; gamemap = 0; highscore = 0; pressedButtons[1] = 0; yhigh = 10;
            }
        }
    }


    if (gamemap == 1){
        if (CS==1){ClearScreen();CS--;}
        if ((*(u16*)0x4000202 & 0x8) == 0x8){


        int ones, tens, min_ones, min_tens, distx;
        steps = 7; spriteCounter = 0;

        x = 240 - 15; y = 10;

        ones = counter%10;
        tens = counter/10%6;
        min_ones = counter/60%10;
        min_tens = counter/600;
        drawSprite(ones+27,spriteCounter+1,x,y);
        drawSprite(tens+27,spriteCounter+2,x-steps,y);
        drawSprite(min_ones+27,spriteCounter+3,x-2*steps-7,y);
        drawSprite(min_tens+27,spriteCounter+4,x-3*steps-7,y);
        distx = x-3*steps-7;

        char ch[50]="LIVES>";
        while (ch[i]!='\0') {d[i]=ch[i]; i++;}
        x = distx-100;
        for(k=0;k<=i-1;k++) drawSprite(d[k]-64,spriteCounter+10+k,(x+k*steps),y);
        counter++;
        }


        if ((*(u16*)0x4000202 & 0x10) == 0x10){

        checkbutton();
        spriteCounter = 10001;


        if(pressedButtons[4] == 1){
          playerX = playerX + 1;
          if(playerX > maxAlienRight) playerX = maxAlienRight;
          pressedButtons[4] = 0;
        }
        if(pressedButtons[5] == 1){
          playerX = playerX - 1;
          if(playerX < maxAlienLeft) playerX = maxAlienLeft;
          pressedButtons[5] = 0;
        }

        drawSprite(40, spriteCounter, playerX, playerY);
        spriteCounter++;




        laserTimeCounter++;
        if(laserTimeCounter > 25){
          if(pressedButtons[6] == 1){
            createLaser();
            laserTimeCounter = 0;
          }
        }
        pressedButtons[6] = 0;


        for( i = 0; i < 10; i++){
          if(laserPositions[i][0] == 1){
            laserPositions[i][2] = laserPositions[i][2] - 2;
          }
          if(laserPositions[i][0] == 0){
            deactivateLaser(i);
          }
            drawSprite(40 +4, spriteCounter, laserPositions[i][1], laserPositions[i][2]);
            spriteCounter++;



          if(laserPositions[i][2] < -20){
            deactivateLaser(i);
          }
        }




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



        for(i = 0; i < totalNumAliens; i++){

            NAlien = 200;
            for(j = 0; j < laserCounter; j++){
                if(laserPositions[j][1] >= alienPositions[i][1]-8 && laserPositions[j][1] < alienPositions[i][1]+8 && laserPositions[j][2] == alienPositions[i][2]){
                    if(alienPositions[i][0] == 1){
                      deactivateLaser(j);
                      alienPositions[i][0] = 0;
                      endcount++;
                    }
                  }
                }
          if(alienPositions[i][0] == 1){
            drawSprite(40 +4 +4, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
          if(alienPositions[i][0] == 0){
            drawSprite(0, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
         }
      }

      if(endcount == totalNumAliens){
        ClearScreen(); saved_counter[entryno] = counter; counter = 0; menumap = 1; gamemap = 0; highscore = 0; endcount = 0; laserCounter = 0; entryno++;
        for(i = 0; i < totalNumAliens; i++){
            alienPositions[i][0] = 1;
            }
        }
    }

    *(u16*)0x4000202 = Flag;
    *(u16*)0x4000208 = 0x01;
}

int checkbutton(void)
{

    u16 buttons = (0x3FF & (~*(volatile u16*)0x4000130));

    if ((buttons & 0x001) == 0x001)
    {

        pressedButtons[0] = 1;
    }
    if ((buttons & 0x002) == 0x002)
    {

        pressedButtons[1] = 1;
    }
    if ((buttons & 0x004) == 0x004)
    {
        pressedButtons[2] = 1;
    }
    if ((buttons & 0x008) == 0x008)
    {
        pressedButtons[3] = 1;
    }
    if ((buttons & 0x010) == 0x010)
    {

                pressedButtons[4] = 1;
    }
    if ((buttons & 0x020) == 0x020)
    {

                pressedButtons[5] = 1;
    }
    if ((buttons & 0x040) == 0x040)
    {

        pressedButtons[6] = 1;
    }
    if ((buttons & 0x080) == 0x080)
    {

       pressedButtons[7] = 1;
    }

         return 0;
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

void deactivateLaser(int i){
  laserPositions[i][0] = 0;
  laserPositions[i][2] = -20;
}
# 9 "main.c" 2
# 20 "main.c"
int main(void)
{


    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;


    *(unsigned short *) 0x5000200 = 0;
    *(unsigned short *) 0x5000202 = ((31) + (31<<5) + (31<<10));

    fillPalette();
    fillSprites();


    *(u16*)0x4000208 = 0x0;
    (*(unsigned int*)0x3007FFC) = (int)&Handler;
    *(u16*)0x4000200 |= 0x8 | 0x10 | 0x20 | 0x40 | 0x1000;
    *(volatile u16*)0x4000132 |= 0x7FFF;
    *(u16*)0x4000208 = 0x1;


    *(u16*)0x4000100 = 49141;
    *(u16*)0x4000102 |= 0x0003 | 0x0080 | 0x0040;

    *(u16*)0x4000104 = 65255;
    *(u16*)0x4000106 |= 0x0003 | 0x0080 | 0x0040;

    *(u16*)0x4000108 = 64509;
    *(u16*)0x400010A |= 0x0003 | 0x0080 | 0x0040;

    *(u16*)0x400010C = 64509;
    *(u16*)0x400010E |= 0x0003 | 0x0080 | 0x0040;

    while(1);

        return 0;
}
