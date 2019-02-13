# Read x and y as int,
# output z = x + y;
######################


	.text
main:	addi	$v0, $0, 5	# v0 = 5
	syscall			# v0=input x
	add	$t0, $0, $v0	# t0 = x

	addi    $v0, $0, 5      
        syscall                 
        add     $t1, $0, $v0    # t1 = y

	add	$t2, $t0, $t1	# t2 = z
	
	###################################
	
	sub	$t3, $t0, $t1	# t3 = x-y
	addi	$t3, $t3, -10	# t3 = x-y-10
	
	###################################

	add	$t4, $0, $t0	# t4 = x
	slt	$t9, $t0, $t1	# t9 = 1 if x<y else 0
	beq	$t9, $0, skip
	add	$t4, $0, $t1	# t4 = y

skip:	#--------------------	# t4 is now max(x,y)

	mult	$t3, $t4	# Hi|Lo = product
	mflo	$t5		# t5 = product (hopefully!)

	#--------------------  

	add	$a0, $t2, $t5
	addi	$a0, $a0, 1	# a0 = answer

	addi	$v0, $0, 1
	syscall

	jr	$ra





