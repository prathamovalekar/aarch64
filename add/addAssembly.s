	.data
	.align 3
a:	.quad 0x0A
b:	.quad 0x05
c:	.quad 0
.LCO	:string"c=%lld\n"
	.align 2
	.text
	.global main
	.type main,@function
	.extern printf

	sub sp,sp,8
	str x30,[sp]

main:	mov x9,0x05
	mov x10,0x0a
	

	add x11,x9,x10
	
	mov x0,x11
	bl printf
	
	ldr x30,[sp]
	add sp,sp,8

	ret

