.globl   myadd
     .p2align 2
	.type    myadd,%function
myadd:
  swp     r4, r4, [sp]			 @ pop last input argument from stack and put it in r4
  stmfd   sp!, {r4-r11, lr}     @ save content of r4-r11 and link register into the sp register


cmp     r1, #1
addeq  r0, r0, #1
Cmp     r0, r3
Movgt   r0, r3

cmp    r2, #1
subeq  r0, r0, #1
Cmp     r0, r4
Movlt   r0, r4
bx       lr


  @ Exit from function
  ldmfd   sp!, {r4-r11, lr}     @ Recover past state of r4-r11 and link register from sp register
  swp     r4, r4, [sp]			 @ Restore state of r4
  mov     pc, lr					 @ Branch back to lr (go back to C code that called this function)
