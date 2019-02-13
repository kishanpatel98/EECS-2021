	.globl	Rectangle
	.globl	getArea

	.text
Rectangle:
	add	$t5, $a0, $0
	addi	$v0, $0, 9
	addi	$a0, $0, 8
	syscall			# v0 = address of 8B block
	add	$a0, $t5, $0

	sw	$a0, 0($v0)
	sw	$a1, 4($v0)
		
	jr	$ra

getArea:
	lw	$t1, 0($a0)	# width
	lw	$t2, 4($a0)	# height
	mult	$t1, $t2
	mflo	$v0
	jr	$ra
