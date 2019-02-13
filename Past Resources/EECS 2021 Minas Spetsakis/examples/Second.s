	.text
main:	addi	$v0, $0, 5	# read x
	syscall
	add	$t0, $v0, $0	# t0 = x
	add	$t1, $0, $0	# t1 = count
	add	$t2, $0, $0	# t2 = i

loop:	slti	$t9, $t2, 32	# t9 = 1 if t2<32 else 0
	beq	$t9, $0, out
	andi	$t9, $t0, 1	# t9 = x & 1
	add	$t1, $t1, $t9	# count += t9
	srl	$t0, $t0, 1	# x = x >>> 1
	addi	$t2, $t2, 1	# i++
	j	loop

out:	add	$a0, $t1, $0
	addi	$v0, $0, 1
	syscall			# print x

	addi	$a0, $0, 10
	addi	$v0, $0, 11
	syscall                 # print CR

	jr $ra
