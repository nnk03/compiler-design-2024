	.file	1 "simple_non_array_assign.c"
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
	.rdata
	.align	2
$LC0:
	.ascii	"%d\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16

	lui	$2, %hi(x)
	addiu	$2, $2, %lo(x)
	addiu	$sp, $sp, -4
	sw	$2, 0($sp)

	li	$2, 1923
	addiu	$sp, $sp, -4
	sw	$2, 0($sp)

	lw	$3, 0($sp)
	addiu	$sp, $sp, 4

	lw	$2, 0($sp)
	addiu	$sp, $sp, 4

	sw	$3, 0($2)

	lui	$2,%hi(x)
	lw	$2,%lo(x)($2)
	move	$5,$2
	lui	$2,%hi($LC0)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
