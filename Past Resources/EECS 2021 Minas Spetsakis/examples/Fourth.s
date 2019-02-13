	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4	# save ra

	addi	$a0, $0, 3
	addi	$a1, $0, 4
	jal	Rectangle	# new Recatngle(3,4)
	add	$s1, $v0, $0	# s1 = rec1

	add	$a0, $0, $s1
	jal	getArea		# rec1.getArea

	add	$a0, $v0, $0
	addi	$v0, $0, 1	
	syscall			# print area

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
