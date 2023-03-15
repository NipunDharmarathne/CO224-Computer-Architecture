@ ARM Assembly - exercise 5
@ Group Number : 27

	.text 	@ instruction memory
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]
	
	@ load values
	mov r0, #10
	mov r1, #5
	mov r2, #7
	mov r3, #-8

	@ Write YOUR CODE HERE
	
	@ j=0;
	@ for (i=0;i<10;i++)
	@ 		j+=i;	
	
	@ Put final j to r5

	@ ---------------------

	mov r4, #0	@ i = 0
	mov r5, #0	@ j = 0

Loop:	cmp r4, #10	@ compare i with 10
	bge Exit	@ if i >= 10 branch to exit
	
	add r5, r5, r4	@ j = j + i
	add r4, r4, #1	@ i = i + 1
	b Loop		@ unconditional(iterative) branch to Loop

Exit:
	
	@ ---------------------
	
	
	@ load aguments and print
	ldr r0, =format
	mov r1, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "The Answer is %d (Expect 45 if correct)\n"

