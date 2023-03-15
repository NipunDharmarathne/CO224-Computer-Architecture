@ ARM Assembly - exercise 6 
@ Group Number : 27
@ E Number : E/18/077, E/18/227
@ Name : Dharmarathne N.S., Mudalige D.H.

	.text 	@ instruction memory
	
	
@ Write YOUR CODE HERE	

@ ---------------------	
fact:
	sub sp, sp, #4    @ adjust stack for 1 item
	str r7, [sp, #0]  @ store the value of r7
	mov r7, r0        @ assign r7 with r0 value
	mov r0, #1        @ fac=1
	
	Loop:
		cmp r7, #1      @ Compare i with 1
		ble Exit        @ branch to 'Exit' if i<=1
		
		mul r0, r7, r0  @ fac *= i
		sub r7, r7, #1  @ i--
		b Loop          @ Unconditional branching to Loop
		
Exit:
	ldr r7, [sp, #0]  @ restore the value of r7
	add sp, sp, #4    @ release the stack
	mov pc, lr        @ Update the Program Counter to current Link Register value
	
@ ---------------------	

.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the fact function
	mov r0, r4 	@the arg1 load
	bl fact
	mov r5,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "Factorial of %d is %d\n"

