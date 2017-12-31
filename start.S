

.global		main
.global		__stack_start

.section	.init
.global		_start

_start:
		ldr	sp, =__stack_start

		ldr	r0, =__bss_start
		ldr	r1, =__bss_end
		mov	r2, #0
1:		str	r2, [r0], #4
		cmp	r0, r1
		bls	1b

		bl	main
		b	.

