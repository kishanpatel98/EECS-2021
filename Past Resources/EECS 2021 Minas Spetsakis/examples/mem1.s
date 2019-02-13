	.text
main:	addi	$t0, $0, 333
	sw	$t0, 0x10000010($0)
	lw	$a0, 0x10000010($0)
	addi	$v0, $0, 1
	syscall

	jr	$ra

