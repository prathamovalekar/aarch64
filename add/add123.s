	.arch armv8-a
	.file	"add.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"c=%lld"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	mov	x0, 10
	str	x0, [x29, 24]
	mov	x0, 5
	str	x0, [x29, 32]
	ldr	x1, [x29, 24]
	ldr	x0, [x29, 32]
	add	x0, x1, x0
	str	x0, [x29, 40]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	ldr	x1, [x29, 40]
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 48
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
