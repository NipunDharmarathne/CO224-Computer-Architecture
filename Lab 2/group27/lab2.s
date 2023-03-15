@ ARM Assembly - lab 2
@ Group Number : 27
@ E Number : E/18/077, E/18/227
@ Name : Dharmarathne N.S., Mudalige D.H.

	.text 	@ instruction memory
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	@ load values
	
	@ Write YOUR CODE HERE
	
	@	Sum = 0;
	@	for (i=0;i<10;i++){
	@		for(j=5;j<15;j++){
	@			if(i+j<10) sum+=i*2
	@			else sum+=(i&j);	
	@		}	
	@	} 
	@ Put final sum to r5


	@ ---------------------

		mov r2, #0		@ i=0
		mov r5, #0		@ Sum=0	
	
	Loop1: 
		cmp r2, #10			@ Compare i and 10
		bge ExitLoop1		@ If i>=10, branch to ExitLoop1 
		
		mov r3, #5			@ j=5
	
	Loop2:			
		cmp r3, #15			@ Compare j and 15
		bge ExitLoop2		@ If j>=15, branch to ExitLoop2

		add r4, r2, r3		@ r4=i+j
		cmp r4, #10			@ Compare (i+j) and 10
		bge Else			@ If (i+j)>=10, branch to Else
		
		add r5, r5, r2		@ Sum=Sum+i
		add r5, r5, r2		@ Sum=Sum+i
		add r3, r3, #1		@ j=j+1
		b Loop2				@ Branch to Loop2
	
	Else:
		and r6, r2, r3		@ r6=i&j 
		add r5, r5, r6		@ Sum=Sum+(i&j)
		add r3, r3, #1		@ j=j+1
		b Loop2				@ Branch to Loop2
	
	ExitLoop2:
		add r2, r2, #1		@ i=i+1
		b Loop1				@ Branch to Loop1
	
	ExitLoop1:
	
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
format: .asciz "The Answer is %d (Expect 300 if correct)\n"

