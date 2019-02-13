# Translate:
# float x = (new Scanner(System.in)).nextFloat();
# float y = 2 * x;
# float z = y;
# if (z < 0) { z = -y; }
# output z;
#################################################
	.data
two:	.float	2.0
zero:	.float	0.0

	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi	$v0, $0, 6
	syscall			# $f0 = x

	jal	twice

	lwc1	$f1, zero($0)
	add.s	$f0, $f12,$f1
	jal	absolute


	addi	$v0, $0, 2
	syscall			# print $f12

done:	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra

#---------------------------------------------
# Take float in f0; return 2*f0 in f12
#---------------------------------------------
twice:	lwc1	$f1, two($0)
	mul.s	$f12, $f0, $f1	# f12 = f0 * 2
	jr	$ra

#---------------------------------------------
# Take float in f0; return abs(f0) in f12
#---------------------------------------------
absolute:	
	lwc1	$f1, zero($0)
	add.s	$f12, $f0, $f1		# f12 = f0
	c.lt.s	$f0, $f1		# set flag if f0<0
	bc1f	skip
	sub.s	$f12, $f1, $f12		# f12 = -f12
skip:	jr	$ra
