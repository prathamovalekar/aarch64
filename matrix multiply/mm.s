//Matrix Multiplier


//X9 - X15	temporary registers
//X16,X17 	Scratch Register
//X18
//X19 - X27	Saved
//X28		sp	
//X29		fp
//X30		lr

//x9   	    - i
//x10       - j
//x11 	    - k
//x5 | x12  - (A[i][j])
//x6 | x13  - (B[j][k])
//x7 | x14  - (C[i][k])
//x15	    - temp


.data 
.align 		3

.text 
.global 	mm
.type		mm, @function
.align		2


mm: 
	sub sp, sp, 8			//make room to save old fp
	str x29, [sp]			//save old fp
	mov	x29, sp				//fp = sp

	sub	sp, sp,48 			//make room to save parameters 
	str x3, [x29,-8]		//M
	str	x4, [x29, -16]		//N
 	str	x5, [x29, -24]		//P	
	str	x0, [x29, -32]		//A[]
	str x1, [x29, -40]		//B[]
	str	x2, [x29, -48]		//C[]	
	

for_k:
	mov	x11, 0				//k = 0

for_k_next:
	ldr	x0, [x29,-24]		//P
	cmp	x11, x0				//k<p
	bge for_k_exit		

for_i:	
	mov	x9, 0 				//i = 0
for_i_next:
	ldr	x0, [x29, -8]		
	cmp	x9, x0				//i < M
	bge for_i_exit
	mov	x15,0				//temp = 0
for_j:	
	mov x10,0 				//j=0

for_j_next:
	ldr 	x0,[x29,-16] 		
	cmp 	x10, x0			// j<N
        bge	for_j_exit

	ldr x2, [x29,-32]		// a[i]
	ldr x0, [x29,-16]		// N
	lsl x1, x9, 3			// i * 8
	mul x1, x1, x0			// (i*8) * N
	lsl x0,x10,3			// j * 8 
	add x1, x1, x0			// (i * 8) * N + (j * 8)
	add x1, x1, x2			
	ldr x12, [x1]			// (A[i][j]


//----------------------------------------------------------------------------------------------------------------
		
	ldr x2, [x29, -40]		// B[]
	ldr x0, [x29,-24]		// P
	lsl x1, x10, 3			// j * 8
	mul x1, x1, x0			// j * 8 * P
	lsl x0, x11, 3			// k * 8 
	add x1, x0, x1			// j * 8 * P + k * 8
	add x1, x1, x2			
	ldr x13, [x1]			// (B[j][k]

//---------------------------------------------------------------------------------------------------------------- 

	mul x14, x12, x13 		// A * B
	add x15, x15, x14		// temp = temp + A * B
	add x10, x10, 1			// j = j + 1
	b for_j_next 

for_j_exit: 

	ldr x2, [x29, -48] 		// C[ ]	
	ldr x0,[x29,-24]		// P
	lsl x1,x9,3				// i * 8 
	mul x1, x1, x0			// i * 8 * P
    lsl x0, x11, 3			// k* 8
    add x1, x1, x0			// i*8*P + k*8
	add x1, x1, x2			// C[i][k]
	str x15, [x1]			// c[i][k] = temp
	add x9, x9, 1			// i = i + 1
	b for_i_next
	
for_i_exit: 

	add x11, x11, 1			// k = k + 1
	b for_k_next

for_k_exit:

	add sp, sp, 48
	ldr x29, [sp]
	add sp, sp, 8
	mov x0, 0
	ret

