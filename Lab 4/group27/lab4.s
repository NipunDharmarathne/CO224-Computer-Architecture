@ARM Assembly Example
@Printing reverse of string
@Call it from main
@Group Number : 27
@E Number : E/18/077, E/18/227
@Name : Dharmarathne N.S., Mudalige D.H.

	.text			@instruction memory
	.global main

main:
	SUB sp,sp,#204		@allocate space for 200 chars(scanf) and lr
	STR lr,[sp,#200]	@push (store) lr to the stack
	SUB sp, sp, #4		@allocate space for input number(number of strings)

	@print message asking the number of strings
	LDR r0, =formatpStrNoInputMsg
	BL printf

	@scan the number of strings
	LDR r0, =formatsStrNo
	MOV r1,sp
	BL scanf

	@return value of scanf
	MOV r1,r0
	CMP r1,#1
	ADDNE sp,sp,#4
	BNE Exit

	LDR r4,[sp,#0]	@load the strings number to register r4
	CMP r4,#0		@compare strings number with 0
	BLT Invalid		@if r4<0 branch to Invalid

	ADD sp,sp,#4	@release stack
	MOV r5,#1		@register r5 counter (set r5=0 in the beginning)

@Getting the strings
LoopStr:
	CMP r5,r4		@compare counter with strings no
	BGT Exit		@if (counter>strings no) branch to Exit

	@print the string input message
	MOV r1,r5
	SUB r1,r1,#1
	LDR r0, =formatpStrInputMsg
	BL printf

	@scan the string
	LDR r0, =formatsStr
	MOV r1,sp
	BL scanf

	@print the string output message
	LDR r0, =formatpStrOutputMsg
	MOV r1,r5
	SUB r1,r1,#1
	BL printf

	@take the string length
	MOV r0,sp
	BL StrLen

	MOV r3,sp			@set r3 with sp
	ADD r3,r3,r2		@add String length to r3 address
	SUB sp,sp,#200		@allocate space for reverse string
	MOV r1,sp			@set r1 with sp

@reverse the strings
ReverseStr:
	CMP r2,#0			@compare string length with 0
	BLE ExitReverseStr	@If (string length<=0) branch tp ExitReverseStr

	SUB r3,r3,#1		@Come up in the original word stack

	LDRB r0,[r3,#0]		@Load byte to r0
	STRB r0,[r1,#0]		@Store byte in new stack(reverse string)
	ADD r1,r1,#1		@Going down in new stack
	SUB r2,r2,#1		@Going up in old stack

	B ReverseStr		@branch to ReverseStr

ExitReverseStr:			@print the reversed strings one by one and exit
	ADD r5,r5,#1		@r5++
	MOV r0,#0			@Input null charcter to end of reveerse string
	STRB r0,[r1,#0]

	@Printing reverse string
	LDR r0,=formatsStrReversed
	MOV r1,sp
	BL printf

	ADD sp,sp,#200		@release stack of reverse string
	B LoopStr			@Move to next string

@function to calculate string length
StrLen:
	SUB sp,sp,#4		@make spacce in stack for lr
	STR lr,[sp,#0]		@store lr
	MOV r2,#0			@r2 is string length counter (Set the value to 0 in the beginning)

LoopStrLen:
	LDRB r3,[r0,#0]		@load character by character
	CMP r3,#0			@Compare whether the character is null
	BEQ ExitStrLen		@branch to ExitStrLen if character is null

	ADD r2,r2,#1		@Else r2++ (Increment String length by 1)
	ADD r0,r0,#1		@r0++ (Go to the next character)
	B LoopStrLen		@branch to LoopStrLen

ExitStrLen:				@exit StrLen function
	LDR lr,[sp,#0]		@load lr back
	ADD sp,sp,#4		@release the stack
	MOV pc,lr			@set pc to lr

@to print invalid input message
Invalid:				
	LDR r0, =formatpErrMsg
	BL printf
	ADD sp,sp,#4		@release the stack

@release stack and return to main
Exit:					
	LDR lr,[sp,#200]
	ADD sp,sp,#204
	MOV pc,lr

	.data @data memory
formatpStrNoInputMsg: .asciz "Enter number of strings :\n"
formatsStrNo: .asciz "%d"
formatpStrInputMsg: .asciz "Enter the input string %d: \n"
formatsStr: .asciz "%*c%[^\n]"
formatpStrOutputMsg: .asciz "Output string %d is: \n"
formatsStrReversed: .asciz "%s \n"
formatpErrMsg: .asciz "Invalid number\n"
