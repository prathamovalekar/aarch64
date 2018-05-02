
		.data
		.align 3

temp: 		.quad 0
		
		.text
		.align 2
		.global sum
		.type sum, @function
		
sum:
		
		add x0,x0,x1
		
		
		
		ret
