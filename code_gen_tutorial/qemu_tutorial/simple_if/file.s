	.file	1 "file.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.globl	x
	.section	.bss,"aw",@nobits
	.type	x, @object
	.size	x, 1
x:
	.space	1
	.rdata
	.align	2
$LC0:
	.ascii	"%d \012\000"
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
	lui	$2,%hi(x)
	li	$3,1			# 0x1
	sb	$3,%lo(x)($2)
	lui	$2,%hi(x)
	lbu	$2,%lo(x)($2)
	beq	$2,$0,$L2
	nop

	lui	$2,%hi(x)
	sb	$0,%lo(x)($2)
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L2:
	lui	$2,%hi(x)
	li	$3,1			# 0x1
	sb	$3,%lo(x)($2)
$L3:
	lui	$2,%hi(x)
	lbu	$2,%lo(x)($2)
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
