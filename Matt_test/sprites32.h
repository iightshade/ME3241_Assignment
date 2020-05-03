#include "gba.h"

// tile0 tile1 tile0 tile1
// tile2 tile3 tile2 tile3
// tile8 tile9 tile10 tile11
// tile12 tile13 tile14 tile15

// Sprite array, defining each big 16x16 sprite as 4 8x8 tiles, using the palette above

u16 sprites32[] = {
    // Alphaets: https://gist.github.com/paul-v-m/b8eadf031902b8eaa0b0
    
    #define DEATHSTAR1 56
    // Tile 00
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,4,4,
    0,0,0,0,0,0,4,4,
    0,0,0,0,4,4,3,3,
    0,0,0,0,4,4,3,3,
    0,0,4,4,4,4,4,4,
    0,0,4,4,4,4,4,4,

    // Tile 01
    0,0,4,4,4,4,4,4,
    0,0,4,4,4,4,4,4,
    4,4,3,3,3,3,1,1,
    4,4,3,3,3,3,1,1,
    3,3,3,3,3,3,3,3,
    3,3,3,3,3,3,3,3,
    4,4,4,4,4,4,3,3,
    4,4,4,4,4,4,3,3,
    // Tile 02
    0,0,4,4,3,3,3,3,
    0,0,4,4,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
         
    // Tile 03
    3,3,1,1,1,1,1,1,
    3,3,1,1,1,1,1,1,
    1,1,1,1,3,3,1,1,
    1,1,1,1,3,3,1,1,
    1,1,1,1,3,3,1,1,
    1,1,1,1,3,3,1,1,
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,

    #define DEATHSTAR2 60
    // Tile 04
    4,4,4,4,4,4,0,0,
    4,4,4,4,4,4,0,0,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,4,4,4,4,1,1,
    1,1,4,4,4,4,1,1,
    4,4,3,3,3,3,4,4,
    4,4,3,3,3,3,4,4,

    // Tile 05
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    4,4,0,0,0,0,0,0,
    4,4,0,0,0,0,0,0,
    1,1,4,4,0,0,0,0,
    1,1,4,4,0,0,0,0,
    1,1,1,1,4,4,0,0,
    1,1,1,1,4,4,0,0,

    // Tile 06
    4,4,1,1,3,3,4,4,
    4,4,1,1,3,3,4,4,
    3,3,4,4,4,4,1,1,
    3,3,4,4,4,4,1,1,
    3,3,3,3,3,3,3,3,
    3,3,3,3,3,3,3,3,
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
         
    // Tile 07
    1,1,1,1,4,4,0,0,
    1,1,1,1,4,4,0,0,
    1,1,1,1,1,0,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,

    #define DEATHSTAR3 64
    // Tile 08
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    4,4,3,3,3,3,3,3,
    0,0,4,4,3,3,3,3,
    0,0,4,4,3,3,3,3,

    // Tile 09
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    3,3,1,1,1,1,1,1,
    3,3,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    3,3,3,3,1,1,1,1,
    3,3,3,3,1,1,1,1,   
    
    
    // Tile 10
    0,0,4,4,3,3,4,4,
    0,0,4,4,3,3,4,4,
    0,0,0,0,4,4,3,3,
    0,0,0,0,4,4,3,3,
    0,0,0,0,0,0,4,4,
    0,0,0,0,0,0,4,4,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
         
    // Tile 11
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    3,3,3,3,1,1,1,1,
    3,3,3,3,1,1,1,1,
    4,4,3,3,1,1,1,1,
    4,4,3,3,1,1,1,1,
    0,0,4,4,4,4,4,4,
    0,0,4,4,4,4,4,4,
    
    #define DEATHSTAR4 68
 
    // Tile 12
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,

    // Tile 13
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    1,1,1,1,4,4,0,0,
    1,1,1,1,4,4,0,0,
         

    // Tile 14
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,4,4,
    1,1,1,1,1,1,4,4,
    4,4,4,4,4,4,0,0,
    4,4,4,4,4,4,0,0,   
         
    // Tile 15
    4,4,4,4,4,4,0,0,
    4,4,4,4,4,4,0,0,
    1,1,4,4,0,0,0,0,
    4,4,4,4,0,0,0,0,
    4,4,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,

    
};
