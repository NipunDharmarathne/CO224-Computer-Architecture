@ ARM Assembly - lab 3.1
@ Group Number : 27
@ E Number : E/18/077, E/18/227
@ Name : Dharmarathne N.S., Mudalige D.H.

@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	

mypow:
	sub sp, sp, #8    @ adjust stack for 2 items
	str r7, [sp, #4]  @ store the value of r7
	str r6, [sp, #0]  @ store the value of r6
	mov r6, r0        @ assign r6 with x value
	mov r7, r1        @ assign r7 with n value
	mov r0, #1        @ pow=1	

	Loop:
		cmp r7, #1      @ Compare i with 1
		blt Exit        @ branch to 'Exit' if (i<1)
		
		mul r0, r6, r0  @ pow *= x
		sub r7, r7, #1  @ i--
		b Loop          @ Unconditional branching to Loop
Exit:
	ldr r7, [sp, #4]  @ restore the value of r7
	ldr r6, [sp, #0]  @ restore the value of r6	
	add sp, sp, #8    @ release the stack
	mov pc, lr        @ Update the Program Counter to current Link Register value
	
@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value x
	mov r5, #3 	@the value n
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl mypow
	mov r6,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	mov r3, r6
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "%d^%d is %d\n"

