	.file	1 "file.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.globl	integer_value_x
	.section	.bss,"aw",@nobits
	.align	2
	.type	integer_value_x, @object
	.size	integer_value_x, 4
integer_value_x:
	.space	4
	.globl	integer_value_y
	.align	2
	.type	integer_value_y, @object
	.size	integer_value_y, 4
integer_value_y:
	.space	4
	.globl	integer_value_z
	.align	2
	.type	integer_value_z, @object
	.size	integer_value_z, 4
integer_value_z:
	.space	4
	.globl	integer_array_int_arr
	.align	2
	.type	integer_array_int_arr, @object
	.size	integer_array_int_arr, 40
integer_array_int_arr:
	.space	40
	.globl	boolean_value_b
	.type	boolean_value_b, @object
	.size	boolean_value_b, 1
boolean_value_b:
	.space	1
	.globl	boolean_array_bool_array
	.align	2
	.type	boolean_array_bool_array, @object
	.size	boolean_array_bool_array, 10
boolean_array_bool_array:
	.space	10
	.globl	x
	.align	2
	.type	x, @object
	.size	x, 4
x:
	.space	4
	.globl	y
	.align	2
	.type	y, @object
	.size	y, 4
y:
	.space	4
	.globl	z
	.align	2
	.type	z, @object
	.size	z, 4
z:
	.space	4
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp

	; lui	$2,%hi(x)
	; li	$3,50			# 0x32
	; sw	$3,%lo(x)($2)

	lui	$2, %hi(x)
	addiu	$sp, $sp, -4
	sw	$2, 0($sp)

	li	$2, 100
	addiu	$sp, $sp, -4
	sw	$2, 0($sp)

	lw	$3, 0($sp)
	addiu	$sp, $sp, 4

	lw	$2, 0($sp)
	addiu	$sp, $sp, 4

	sw	$3, %lo(x)($2)		# final assigning

	move	$2,$0
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
