.globl   highScore
     .p2align 2
	.type    highScore,%function
highScore:
  swp     r4, r4, [sp]			 @ pop last input argument from stack and put it in r4
  stmfd   sp!, {r4-r11, lr}     @ save content of r4-r11 and link register into the sp register


cmp    r1, #1
addeq  r0, r0, r4 		@ yhigh = yhigh + SCREEN_HEIGHT/5
addeq r5, r4, r4, LSL #1 @ r5 = 3 * screenheight/5
subeq r6, r0, r4 		@ r6 = yhigh - SCREEN_HEIGHT/5
cmp r6, r5				
movgt r0, r6

cmp    r2, #1
subeq  r0, r0, r4
muleq r3, r3, r4
addeq r6, r0, r3
Cmp     r0, r4, LSL #1
addlt   r0, r0, r4

bx       lr


  @ Exit from function
  ldmfd   sp!, {r4-r11, lr}     @ Recover past state of r4-r11 and link register from sp register
  swp     r4, r4, [sp]			 @ Restore state of r4
  mov     pc, lr					 @ Branch back to lr (go back to C code that called this function)
