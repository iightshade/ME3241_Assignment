.globl   highScore
     .p2align 2
	.type    highScore,%function
highScore:
  swp     r4, r4, [sp]			 @ pop last input argument from stack and put it in r4
  stmfd   sp!, {r4-r11, lr}     @ save content of r4-r11 and link register into the sp register


cmp    r1, #1
bne down
addeq  r0, r0, r4 		@ yhigh = yhigh + SCREEN_HEIGHT/5
addeq r5, r4, r4, LSL #1 @ r5 = 3 * screenheight/5
subeq r6, r0, r4 		@ r6 = yhigh - SCREEN_HEIGHT/5
cmp r6, r5				@ (yhigh - SCREEN_HEIGHT/5) > (3*SCREEN_HEIGHT/5)
movgt r0, r6			@ yhigh = yhigh-(SCREEN_HEIGHT/5
b done

down:
cmp    r2, #1
subeq  r0, r0, r4
muleq r5, r3, r4 		@ r5 = entryno*SCREEN_HEIGHT/5
addeq r6, r0, r5 		@ r6 = yhigh + entryno*SCREEN_HEIGHT/5
addeq r8, r4, r4
Cmp     r6, r8		 	@ (yhigh + entryno*SCREEN_HEIGHT/5) < (2*SCREEN_HEIGHT/5)
addlt   r0, r0, r4 		@ yhigh = yhigh+(SCREEN_HEIGHT/5

done:
end:

  @ Exit from function
  ldmfd   sp!, {r4-r11, lr}     @ Recover past state of r4-r11 and link register from sp register
  swp     r4, r4, [sp]			 @ Restore state of r4
  mov     pc, lr					 @ Branch back to lr (go back to C code that called this function)
