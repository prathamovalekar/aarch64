//x0 = address of array "a"	(source 1)
//x1 = address of array "b" (source 2)
//x3 = address of array "c"	(destination)
//x11= i
//x10=temp

		.data
		.align 3

temp: 	.quad 0
		
		.text
		.align 2
		.global arrayAddition
		.type arrayAddition, @function

arrayAddition:
		mov x11,0	//i
		mov x10,0	//temp
		
	for:	
		cmp x11,x3
		bge for_exit
		lsl x4,x11,3	//i*8

		add x5,x4,x0	//address of a[i]
		add x6,x4,x1	//address of b[i]
		add x7,x4,x2	//address of c[i]

		ldr x8,[x5]		//getting the value at a[i] in x8
		ldr x9,[x6]		//getting the value at b[i] in x9
		add x10,x8,x9	//a[i]+b[i]
		str x10,[x7]	//storing the addition at c[i]
		add x11,x11,1	/i++
		b for
for_exit:
		ret
