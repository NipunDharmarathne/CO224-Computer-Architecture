@ ARM Assembly - exercise 7 
@ Group Number : 27
@ E Number : E/18/077, E/18/227
@ Name : Dharmarathne N.S., Mudalige D.H.

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
Fibonacci:
	sub sp, sp, #12		@ Adjust stack for 3 items
	str lr, [sp, #8]	@ Save return address
	str r6, [sp, #4]	@ Save a variable register space in the stack
	str r0, [sp, #0]	@ Save argument n
	
	cmp r0, #2			@ Compare n with 2
	bgt Else
	
	mov r0, #1			@ result = 1
	add sp, sp, #12		@ Pop 3 items from stack
	mov pc, lr			@ Return to caller

Else:
	sub r0, r0, #1		@ decrement n by 1
	bl Fibonacci		@ Nested call Fibonacci(n-1)
		
	mov r6, r0			@ Store returned value of Fibonacci(n-1) in r6
	ldr r0, [sp, #0]	@ Restore n
	sub r0, r0, #2		@ decrement n by 2
	bl Fibonacci		@ Nested call Fibonacci(n-2)
	
	add r0, r0, r6		@ Store Fibonacci(n-1) + Fibonacci(n-2) in r0
	
	ldr lr, [sp, #8]	@ Restore n
	ldr r6, [sp, #4]	@ Restore the previous variable register value
	add sp, sp, #12		@ Pop 3 items from stack
	mov pc, lr			@ Return back to main where it was


@ ---------------------
	
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the Fibonacci function
	mov r0, r4 	@the arg1 load
	bl Fibonacci
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
format: .asciz "F_%d is %d\n"

