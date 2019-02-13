	.data
x:	.byte	3
y:	.word 	7, -3, 20
z:	.half	12, 15
t:	.ascii	"ABC"
w:	.asciiz	"ABC"
wp:	.byte	65, 66, 67, 0
xAdrs:	.word	x
	.text

main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4	# push ra


	lw	$a0, xAdrs($0)
	addi	$v0, $0, 1
	syscall 


	lb	$a0, x($0)	# t0 = 3
	jal	println

	lw	$a0, y($0)	# t1 = 7
	jal     println

	addi	$t5, $0, 4
	lw	$a0, y($t5)	# t2 = -3
	jal     println

	addi	$t5, $0, 8
	lw	$a0, x($t5)	# t3 = -3
	jal     println

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)	# pop ra
	jr	$ra

###################################
println:
# System.out.println(a0)
#----------------------------------
	addi    $v0, $0, 1
        syscall
	addi    $a0, $0, 10
	addi    $v0, $0, 11
        syscall
	jr	$ra
###################################

	
