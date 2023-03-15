@ ARM Assembly - lab 3.2 
@ Group Number : 27
@ E Number : E/18/077, E/18/227
@ Name : Dharmarathne N.S., Mudalige D.H.

	.text 	@ instruction memory

@ Write YOUR CODE HERE	

@ ---------------------	
gcd:
	sub sp, sp, #8			@ Allocate 2 items in the stack
	str r8, [sp,#0]			@ Save a variable register space in the stack
	str lr, [sp,#4]			@ Save return address of the main function

	cmp r1,#0				@ Compare b with number 0
	bne While				@ Branch to 'While' if b != 0

	ldr r8, [sp,#0]			@ restore r8
	ldr lr, [sp,#4]			@ Restore return address
	add sp, sp, #8			@ Pop 2 items from stack
	mov pc, lr				@ Return back to main where it was (where b=0 & ans=a)

While:
	mov r8, r0		@ Store a in r8
	mov r0, r1		@ Store b in r0 (Replace a with b)

Loop:				
	cmp r8, r1		@ Compare a with b
	BLT Else		@ Branch to 'Else' if a < b

	sub r8, r8, r1	@ a = a - b
	b Loop			@ Branch to 'Loop'

Else:
	mov r1, r8		@ Move r8 to r1 (r1= a%b , r0=b)
	bl gcd			@ Branch and Link to gcd
	
	ldr r8, [sp,#0]	@ Restore r8
	ldr lr, [sp,#4]	@ Restore lr
	add sp, sp, #8	@ Pop 2 items from stack
	mov pc,lr		@ Return to caller

@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #64 	@the value a
	mov r5, #24 	@the value b
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl gcd
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
format: .asciz "gcd(%d,%d) = %d\n"

