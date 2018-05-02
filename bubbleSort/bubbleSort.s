
//extern void bubblesort(long long int A[],long long int n);
//x0=A
//x1=n
//x2=n-1
//x3=n-k-1
//x9=flag
//x10=k
//x11=i
//x12=temp

		.data
		.align 3

temp: 	.quad 0
		
		.text
		.align 2
		.global bubblesort
		.type bubblesort, @function
		
bubblesort:
		mov x10,1		// k=1
		sub x2,x1,1		// x2=n-1

for1:	cmp x10,x2
		bgt for1_exit		//branch only when k>n-1
		
		mov x9,0		//flag=0
		sub x3,x2,x10	//x3=n-k-1
		mov x11,0		//i=0
			
for2:		cmp x11,x3		
		bgt for2_exit
		
		//finding A[i] and A[i+1]
		lsl x4,x11,3	//i*8
		add x5,x4,x0	//A[i]	Address
		add x6,x5,8		//A[i+1]Address
		ldr x7,[x5]		//A[i]	Value
		ldr x8,[x6]		//A[i+1]Value
		
if1:	cmp x7,x8		// which value is smaller
		ble if1_exit
		// if x7>x8 then switch
		str x8,[x5]
		str x7,[x6]
		mov x9,1		// flag=1

if1_exit:
		add x11,x11,1	//i++
		b for2

for2_exit:
if2:	cmp x9,0		// if(flag==1)
		beq for1_exit	//if yes exit program
		add x10,x10,1	//else k++
		b for1			//branch to for1

for1_exit:
		mov x0,0
		ret
	





		
	
		
