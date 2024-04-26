	.file	1 "file.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.globl	i
	.section	.bss,"aw",@nobits
	.align	2
	.type	i, @object
	.size	i, 4
i:
	.space	4
	.globl	x
	.align	2
	.type	x, @object
	.size	x, 40
x:
	.space	40
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
	lui	$2,%hi(i)
	li	$3,1			# 0x1
	sw	$3,%lo(i)($2)
	lui	$2,%hi(i)
	lw	$2,%lo(i)($2)
	xori	$2,$2,0x1
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
	move	$3,$2
	lui	$2,%hi(i)
	sw	$3,%lo(i)($2)
	lui	$2,%hi(i)
	lw	$2,%lo(i)($2)
	xori	$2,$2,0x1
	sltu	$2,$0,$2
	andi	$2,$2,0x00ff
	move	$3,$2
	lui	$2,%hi(i)
	sw	$3,%lo(i)($2)
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
