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



    0,0,0,0,4,3,3,1,
    0,0,0,0,0,4,3,3,
    0,0,0,0,0,0,4,3,
    0,0,0,0,4,4,1,3,
    0,0,0,4,3,3,3,1,
    0,0,0,4,3,3,1,1,
    0,0,4,3,3,3,1,1,
    4,3,3,1,3,3,3,3,


    1,1,1,4,0,0,0,0,
    1,1,4,0,0,0,0,0,
    1,4,0,0,0,0,0,0,
    1,1,4,4,0,0,0,0,
    1,1,1,1,4,0,0,0,
    1,1,1,1,4,0,0,0,
    1,1,1,1,1,4,0,0,
    1,1,1,1,1,1,1,4,

    4,3,3,1,3,3,3,3,
    0,4,3,3,1,3,3,1,
    0,0,4,1,3,1,3,3,
    0,0,0,4,3,3,3,3,
    0,0,0,0,4,1,3,3,
    0,0,0,0,0,4,3,3,
    0,0,0,0,0,0,4,3,
    0,0,0,0,0,0,0,4,


    1,1,1,1,1,1,1,4,
    1,1,1,1,1,1,4,0,
    1,1,1,1,1,4,0,0,
    1,1,1,1,4,0,0,0,
    1,1,1,4,0,0,0,0,
    1,1,4,0,0,0,0,0,
    1,4,0,0,0,0,0,0,
    4,0,0,0,0,0,0,0,

};
# 6 "main.c" 2
# 1 "sprites32.h" 1
# 10 "sprites32.h"
u16 sprites32[] = {




    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,4,4,
    0,0,0,0,0,0,4,4,
    0,0,0,0,4,4,3,3,
    0,0,0,0,4,4,3,3,
    0,0,4,4,4,4,4,4,
    0,0,4,4,4,4,4,4,


    0,0,4,4,4,4,4,4,
    0,0,4,4,4,4,4,4,
    4,4,3,3,3,3,1,1,
    4,4,3,3,3,3,1,1,
    3,3,3,3,3,3,3,3,
    3,3,3,3,3,3,3,3,
    4,4,4,4,4,4,3,3,
    4,4,4,4,4,4,3,3,

    0,0,4,4,3,3,3,3,
    0,0,4,4,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,


    3,3,1,1,1,1,1,1,
    3,3,1,1,1,1,1,1,
    1,1,1,1,3,3,1,1,
    1,1,1,1,3,3,1,1,
    1,1,1,1,3,3,1,1,
    1,1,1,1,3,3,1,1,
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,



    4,4,4,4,4,4,0,0,
    4,4,4,4,4,4,0,0,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,4,4,4,4,1,1,
    1,1,4,4,4,4,1,1,
    4,4,3,3,3,3,4,4,
    4,4,3,3,3,3,4,4,


    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    4,4,0,0,0,0,0,0,
    4,4,0,0,0,0,0,0,
    1,1,4,4,0,0,0,0,
    1,1,4,4,0,0,0,0,
    1,1,1,1,4,4,0,0,
    1,1,1,1,4,4,0,0,


    4,4,1,1,3,3,4,4,
    4,4,1,1,3,3,4,4,
    3,3,4,4,4,4,1,1,
    3,3,4,4,4,4,1,1,
    3,3,3,3,3,3,3,3,
    3,3,3,3,3,3,3,3,
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,


    1,1,1,1,4,4,0,0,
    1,1,1,1,4,4,0,0,
    1,1,1,1,1,0,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,



    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    0,0,4,4,3,3,3,3,
    0,0,4,4,3,3,3,3,


    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    3,3,1,1,1,1,1,1,
    3,3,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    3,3,3,3,1,1,1,1,
    3,3,3,3,1,1,1,1,



    0,0,4,4,3,3,4,4,
    0,0,4,4,3,3,4,4,
    0,0,0,0,4,4,3,3,
    0,0,0,0,4,4,3,3,
    0,0,0,0,0,0,4,4,
    0,0,0,0,0,0,4,4,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,


    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    3,3,3,3,1,1,1,1,
    3,3,3,3,1,1,1,1,
    4,4,3,3,1,1,1,1,
    4,4,3,3,1,1,1,1,
    0,0,4,4,4,4,4,4,
    0,0,4,4,4,4,4,4,




    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,


    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,4,4,0,0,
    1,1,1,1,4,4,0,0,



    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    4,4,4,4,4,4,0,0,
    4,4,4,4,4,4,0,0,


    4,4,4,4,4,4,0,0,
    4,4,4,4,4,4,0,0,
    1,1,4,4,0,0,0,0,
    4,4,4,4,0,0,0,0,
    4,4,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,


};
# 7 "main.c" 2

# 1 "myhandler.h" 1
# 1 "gbalib.h" 1

# 1 "/usr/local/arm-thumb-elf/sys-include/time.h" 1 3 4
# 10 "/usr/local/arm-thumb-elf/sys-include/time.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 1 3 4
# 15 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/newlib.h" 1 3 4
# 16 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 2 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/sys/config.h" 1 3 4



# 1 "/usr/local/arm-thumb-elf/sys-include/machine/ieeefp.h" 1 3 4
# 5 "/usr/local/arm-thumb-elf/sys-include/sys/config.h" 2 3 4
# 17 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 2 3 4
# 11 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 1 3 4
# 14 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/sys/_types.h" 1 3 4
# 12 "/usr/local/arm-thumb-elf/sys-include/sys/_types.h" 3 4
typedef long _off_t;
__extension__ typedef long long _off64_t;


typedef int _ssize_t;





# 1 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 1 3 4
# 354 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 23 "/usr/local/arm-thumb-elf/sys-include/sys/_types.h" 2 3 4


typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;

typedef int _flock_t;
# 15 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 2 3 4




typedef unsigned long __ULong;
# 40 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};
# 68 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _atexit {
        struct _atexit *_next;
        int _ind;
        void (*_fns[32])(void);
        void *_fnargs[32];
        __ULong _fntypes;
};
# 91 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct __sbuf {
        unsigned char *_base;
        int _size;
};






typedef long _fpos_t;
# 156 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (void * _cookie, char *_buf, int _n);
  int (*_write) (void * _cookie, const char *_buf, int _n);

  _fpos_t (*_seek) (void * _cookie, _fpos_t _offset, int _whence);
  int (*_close) (void * _cookie);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

};
# 249 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
typedef struct __sFILE __FILE;


struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 280 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 532 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 728 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
extern struct _reent *_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 12 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4






# 1 "/usr/local/arm-thumb-elf/sys-include/machine/time.h" 1 3 4
# 19 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4
# 27 "/usr/local/arm-thumb-elf/sys-include/time.h" 3 4
# 1 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 1 3 4
# 213 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 28 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4

# 1 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 1 3 4
# 24 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef short int __int16_t;
typedef unsigned short int __uint16_t;





typedef int __int32_t;
typedef unsigned int __uint32_t;






__extension__ typedef long long __int64_t;
__extension__ typedef unsigned long long __uint64_t;
# 59 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
# 1 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 1 3 4
# 151 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 325 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef int wchar_t;
# 60 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 2 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/machine/types.h" 1 3 4
# 36 "/usr/local/arm-thumb-elf/sys-include/machine/types.h" 3 4
typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;
# 61 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 2 3 4
# 82 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;



typedef unsigned short ushort;
typedef unsigned int uint;



typedef unsigned long clock_t;




typedef long time_t;




struct timespec {
  time_t tv_sec;
  long tv_nsec;
};

struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;
typedef char * caddr_t;







typedef unsigned short ino_t;
# 158 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef short dev_t;




typedef long off_t;

typedef unsigned short uid_t;
typedef unsigned short gid_t;


typedef int pid_t;
typedef long key_t;
typedef _ssize_t ssize_t;
# 184 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef unsigned int mode_t __attribute__ ((__mode__ (__SI__)));



typedef unsigned short nlink_t;
# 210 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef long fd_mask;







typedef struct _types_fd_set {
        fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;
# 30 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4



struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;
};

clock_t clock (void);
double difftime (time_t _time2, time_t _time1);
time_t mktime (struct tm *_timeptr);
time_t time (time_t *_timer);

char *asctime (const struct tm *_tblock);
char *ctime (const time_t *_time);
struct tm *gmtime (const time_t *_timer);
struct tm *localtime (const time_t *_timer);

size_t strftime (char *_s, size_t _maxsize, const char *_fmt, const struct tm *_t);

char *asctime_r (const struct tm *, char *);
char *ctime_r (const time_t *, char *);
struct tm *gmtime_r (const time_t *, struct tm *);
struct tm *localtime_r (const time_t *, struct tm *);








char *strptime (const char *, const char *, struct tm *);
void tzset (void);
void _tzset_r (struct _reent *);
# 98 "/usr/local/arm-thumb-elf/sys-include/time.h" 3 4
extern time_t _timezone;
extern int _daylight;
extern char *_tzname[2];
# 126 "/usr/local/arm-thumb-elf/sys-include/time.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/sys/features.h" 1 3 4
# 127 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4
# 3 "gbalib.h" 2



int winlosecounter = 0;
int counter = 0;
int pos = 0;
int playerX = 240/2, playerY = 160 -20;

int menu_point = 160/2 + 1*20-20;
int menumap = 1, gamemap = 0, highscore = 0, credits = 0;;
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


int pressedButtons[8] = {};
int alienLaserPositions[10][3];
int alienlaserCounter = 0;
int alienlaserTimeCounter = 0;

int endcount;
int saved_counter[20] ={};
int entryno = 0;
int yhigh = 10;
int lives = 3;

int playerSpriteCounter = 30;
int playerLaserSpriteCounter = 200;
int alienSpriteCounter = 100;
int alienLaserSpriteCounter = 500;






void ClearScreen(void)
{
    int x,y,c=0;
    for (x = 0; x < 240 +20; x++){
        for (y = 0; y < 160 +20; y++){
                drawSprite(0,c,x,y); c++;
                }
            }

}

void ACSIIprint(int x, int y, char ch[50], int j_iclx, int j_icly, int steps, int c)
{
    int i=0,j,k,mod=0,xpos,ypos,linecount=1,d[50]={},l[10]={};

    while (ch[i]!='\0'){d[i]=ch[i]; i++;}
    for(j=0;j<=i-1;j++){
        if (d[j]==62){
            l[linecount]=j-mod;
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

    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;

    if (spritenumb <= 37) {
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
  if (selection==0){
    drawSprite(sprite4, numb, x + 16, y);
    drawSprite(sprite3, numb+1, x, y);
    drawSprite(sprite2, numb+2, x + 16, y -16);
    drawSprite(sprite1, numb+3, x, y -16);}

  if (selection==1){
    drawSprite(sprite4, numb, x, y);
    drawSprite(sprite3, numb+1, x-steps, y);
    drawSprite(sprite2, numb+2, x-2*steps-7, y);
    drawSprite(sprite1, numb+3, x-3*steps-7, y);}
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
    for (i = 0; i <= (60*16*16); i++) {((unsigned short *) 0x6010000)[i+((37)*8*8)] = (sprites16[i*2+1] << 8) + sprites16[i*2];}

}






void checkbutton(void)
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

void deactivateLaser(int i, int spriteNum){
  laserPositions[i][0] = 0;
  laserPositions[i][2] = -30;
  drawSprite(40 +4, spriteNum, laserPositions[i][1], laserPositions[i][2]);

}

void enemyMove(int numRows, int enemyPosition[][3]){
  int i = 0;
  numRows = numRows - 1;
  if(enemyPosition[numRows][1] > maxAlienRight){
    aliensMove = -1;
  }
  if(enemyPosition[0][1] < maxAlienLeft){
    aliensMove = 1;
  }
  for(i = 0; i <= numRows; i++){
    enemyPosition[i][1] = enemyPosition[i][1] + aliensMove;
  }
}

void createAlienLaser(void){
  int attackingAlien = -1;
  int breakCounter = 0;

  while(attackingAlien == -1){
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
  if(attackingAlien != -1){
    alienLaserPositions[alienlaserCounter][0] = 1;
    alienLaserPositions[alienlaserCounter][1] = alienPositions[attackingAlien][1];
    alienLaserPositions[alienlaserCounter][2] = alienPositions[attackingAlien][2];
    alienlaserCounter++;
    if(alienlaserCounter > 9){
      alienlaserCounter = 0;
    }
  }
}

void deactivateAlienLaser(int i, int spriteNum){
  alienLaserPositions[i][0] = 0;
  alienLaserPositions[i][2] = 200;
  drawSprite(40 +4, spriteNum, alienLaserPositions[i][1], alienLaserPositions[i][2]);
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

void createBossLaser(void){
  int attackingAlien = -1;
  int breakCounter = 0;
  int laserSize = 0;

  while(attackingAlien == -1){
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


  if(attackingAlien != -1){

    alienLaserPositions[alienlaserCounter][0] = 1;
    alienLaserPositions[alienlaserCounter][1] = bossPositions[attackingAlien][1];
    alienLaserPositions[alienlaserCounter][2] = bossPositions[attackingAlien][2];
    alienlaserCounter++;
  }
  if(alienlaserCounter > 9){
    alienlaserCounter = 0;
  }

  if(laserSize >= 2){

    alienLaserPositions[alienlaserCounter][0] = 1;
    alienLaserPositions[alienlaserCounter][1] = bossPositions[attackingAlien][1] - 6;
    alienLaserPositions[alienlaserCounter][2] = bossPositions[attackingAlien][2];
    alienlaserCounter++;
  }
  if(alienlaserCounter > 9){
    alienlaserCounter = 0;
  }

  if(laserSize >= 3){

    alienLaserPositions[alienlaserCounter][0] = 1;
    alienLaserPositions[alienlaserCounter][1] = bossPositions[attackingAlien][1] + 6;
    alienLaserPositions[alienlaserCounter][2] = bossPositions[attackingAlien][2];
    alienlaserCounter++;
  }

  if(alienlaserCounter > 9){
    alienlaserCounter = 0;
  }
}
# 2 "myhandler.h" 2


extern int myadd(int a, int b, int c, int d, int e);







void Handler(void)
{
    u16 Flag; int x, y, steps, ones, tens, min_ones, min_tens, j, k, c, i=0;

    *(u16*)0x4000208 = 0x00;
    Flag = *(u16*)0x4000202;

    if ((*(u16*)0x4000202 & 0x20) == 0x20){





            if (menumap == 1){



            x = 240/2 - 100; y = 10; c = 0;
            ACSIIprint(x,y," STAR>WARS>", 1, 1, 10, c);



            c = 10;
            drawfours(56,60,64,68,240/2, 40, c, 0);

            drawSprite(40, c+4, 240/2 + 40, 20 +1*20);



            x = 240/2 - 40; y = 160/2 - 20; c = 30;
            ACSIIprint(x,y," NEW GAME>HIGHSCORE>CREDITS>", 0, 1, 10, c);


            checkbutton();

            if(pressedButtons[6] == 1){ menu_point = menu_point + (-pressedButtons[6])*20; pressedButtons[6] = 0; }
            if(pressedButtons[7] == 1){ menu_point = menu_point + (pressedButtons[7])*20; pressedButtons[7] = 0; }

            if (menu_point > 160/2 + 3*20-20) menu_point = 160/2 + 3*20-20;
            if (menu_point < 160/2 + 1*20-20) menu_point = 160/2 + 1*20-20;



            c=60; drawSprite(37, c, 240/2 - 50, menu_point);

            if (menu_point == (160/2 + 1*20-20) && pressedButtons[0] == 1){
                cleanButtons();
                menumap = 0; gamemap = 1; highscore = 0; credits = 0; CS=1; pressedButtons[0] = 0;
            }
            if (menu_point == (160/2 + 2*20-20) && pressedButtons[0] == 1){
                cleanButtons();
                menumap = 0; gamemap = 0; highscore = 1; credits = 0; CS=1; pressedButtons[0] = 0;
            }
            if (menu_point == (160/2 + 3*20-20) && pressedButtons[0] == 1){
                cleanButtons();
                menumap = 0; gamemap = 0; highscore = 0; credits = 1; CS=1; pressedButtons[0] = 0;
            }
        }







            if (highscore == 1){
                if (CS==1){ClearScreen();CS--;}



                x = 240/2 - 100; y = 160/2 - 40; c = 0;
                ACSIIprint(x,y," HIGHSCORE>SCOLL UP>OR DOWN>", 0, 1, 10, c);

                checkbutton();

                x = 240 - 50;
# 102 "myhandler.h"
                c = 30;

                drawSprite(1+1+27,c+5,x-50-7,yhigh+1*10);
                drawfours(1+27, 1+27, 1+27, 1+27, x, yhigh+1*10, c+1, 1);
# 124 "myhandler.h"
                if(pressedButtons[6] == 1){
                      yhigh = yhigh-10;
                      if (yhigh < 0) yhigh = 0;
                      pressedButtons[6] = 0;
                    }
                if(pressedButtons[7] == 1){
                      yhigh = yhigh+10;
                      if ((yhigh + 50)> 160) yhigh = 160 - 50;
                      pressedButtons[7] = 0;
                    }

                if(pressedButtons[1] == 1){
                ClearScreen(); cleanButtons(); menumap = 1; gamemap = 0; highscore = 0; credits = 0; yhigh = 10;
                }
            }







            if (credits == 1){
                if (CS==1){ClearScreen();CS--;}



                x = 240/2 - 120; y = 160/2 - 40; c = 0;
                ACSIIprint(x,y," THANK YOU FOR PLAYING>FROM BENJAMIN>AND MATTHEW>", 0, 1, 10, c);

                checkbutton();

                if(pressedButtons[1] == 1){
                ClearScreen(); cleanButtons(); menumap = 1; gamemap = 0; highscore = 0; credits = 0; yhigh = 10;
                }

            }
        }






    if (gamemap == 1){
        if (CS==1){ClearScreen();CS--;}


        if ((*(u16*)0x4000202 & 0x8) == 0x8){





        int distx,
        steps = 7;

        x = 240 - 15; y = 16; c = 0;

        ones = counter%10;
        tens = counter/10%6;
        min_ones = counter/60%10;
        min_tens = counter/600;

        drawfours(min_tens+27, min_ones+27, tens+27, ones+27, x, y, c+1, 1);

        distx = x-3*steps-7;

        x = distx-130; c = 5;
        ACSIIprint(x,y," LIVES>", 0, 0, 7, c);

        spriteCounter = 20;
        for(k=0;k<3;k++){
            drawSprite(40, k+spriteCounter, (k*2*steps+50+x), y-5);
            for(i=0;i<3-lives;i++) drawSprite(0, i+spriteCounter, (i*2*steps+50+x), y-5);
            }

        counter++;

        }


        if ((*(u16*)0x4000202 & 0x10) == 0x10){





        checkbutton();
        spriteCounter = playerSpriteCounter;


        playerX = myadd(playerX, pressedButtons[4], pressedButtons[5], maxAlienRight, maxAlienLeft);
        pressedButtons[4] = 0;
        pressedButtons[5] = 0;


        drawSprite(40, spriteCounter, playerX, playerY);




        laserTimeCounter++;
        if(laserTimeCounter > 25 && pressedButtons[6] == 1){
            createLaser();
            laserTimeCounter = 0;
        }
        pressedButtons[6] = 0;


        spriteCounter = playerLaserSpriteCounter;

        for( i = 0; i < 10; i++){
          if(laserPositions[i][0] == 1){
            laserPositions[i][2] = laserPositions[i][2] - 2;
            drawSprite(40 +4, spriteCounter + i, laserPositions[i][1], laserPositions[i][2]);
          }

          if(laserPositions[i][2] < -20){
            deactivateLaser(i, spriteCounter + i);
          }
        }






      if(endcount < numAliens){


        alienTimer++;
        if(alienTimer == 3){
          enemyMove(numAliens, alienPositions);
          alienTimer = 0;
        }



        spriteCounter = playerLaserSpriteCounter;
        NAlien = alienSpriteCounter;
        for(i = 0; i < numAliens; i++){

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
            drawSprite(40 +4 +4, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
          if(alienPositions[i][0] == 0){
            drawSprite(0, NAlien + i, alienPositions[i][1], alienPositions[i][2]);
            }
         }


         alienlaserTimeCounter++;
         if(alienlaserTimeCounter > 150){
           createAlienLaser();
           alienlaserTimeCounter = 0;
         }

         spriteCounter = alienLaserSpriteCounter;
         for( i = 0; i < 10; i++){
           if(alienLaserPositions[i][0] == 1){
             alienLaserPositions[i][2] = alienLaserPositions[i][2] + 2;
             drawSprite(40 +4, spriteCounter + i, alienLaserPositions[i][1], alienLaserPositions[i][2]);
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






       if(endcount >= numAliens){


         alienTimer++;
         if(alienTimer == 3){
           enemyMove(numBosses, bossPositions);
           alienTimer = 0;
         }



         spriteCounter = playerLaserSpriteCounter;
         NAlien = alienSpriteCounter;
         for(i = 0; i <= 2; i++){

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
             if(bossPositions[1][0] >= 1) drawfours(56,60,64,68,bossPositions[i][1], bossPositions[i][2], NAlien+5+i, 0);
            }
             else drawSprite(40 +4 +4 +4, NAlien + i, bossPositions[i][1], bossPositions[i][2]);
             }
           if(bossPositions[i][0] == 0){
            if(i==1){
             if(bossPositions[1][0] == 0) drawfours(0,0,0,0, bossPositions[i][1], bossPositions[i][2], NAlien+5+i, 0);
            }
             drawSprite(0, NAlien + i, bossPositions[i][1], bossPositions[i][2]);
             }
          }


          alienlaserTimeCounter++;
          if(alienlaserTimeCounter > 50){
            createBossLaser();
            alienlaserTimeCounter = 0;
          }

          spriteCounter = alienLaserSpriteCounter;
          for( i = 0; i < 10; i++){
            if(alienLaserPositions[i][0] == 1){
              alienLaserPositions[i][2] = alienLaserPositions[i][2] + 2;
              drawSprite(40 +4, spriteCounter + i, alienLaserPositions[i][1], alienLaserPositions[i][2]);
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


          if (endcount == (numAliens + numBosses)){

              x = 240/2 - 40; y = 160/2; c = 300;
              ACSIIprint(x,y," YOU WIN>", 0, 0, 10, c);

              for( i = 0; i < 10; i++) deactivateAlienLaser(i, alienLaserSpriteCounter + i);
              winlosecounter++;

              if(winlosecounter > 100) winlosecounter = 0;
          }


          if (lives <= 0){

              x = 240/2 - 40; y = 160/2; c = 300;
              ACSIIprint(x,y," YOU LOSE>", 0, 0, 10, c);

              for( i = 0; i < 10; i++) deactivateLaser(i, playerLaserSpriteCounter + i);
              winlosecounter++;

              if(winlosecounter > 100) winlosecounter = 0;
          }


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

    *(u16*)0x4000202 = Flag;
    *(u16*)0x4000208 = 0x01;
  }
# 9 "main.c" 2
# 22 "main.c"
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
