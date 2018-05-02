
		.data
		.align 3

temp: 		.quad 0
		
		.text
		.align 2
		.global smallerElement
		.type smallerElement, @function

smallerElement:	
		cmp x0,x1
		bge exit_1
		ret
	exit_1:	mov x0,x1
		ret
