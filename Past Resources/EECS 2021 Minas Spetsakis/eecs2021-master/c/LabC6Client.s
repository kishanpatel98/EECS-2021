        .text
main:   sw      $ra, 0($sp)
        addi    $sp, $sp, -4
        lw      $a0, MAX($0)
        addi    $v0, $0, 1
        syscall                # print MAX
        jal     println
        lbu     $a0, SIZE($0)
        addi    $v0, $0, 1
        syscall                # print SIZE
        jal     println
        jal     getCount
        add     $a0, $0, $v0
        addi    $v0, $0, 1
        syscall                # print getCount
        jal     println
        addi    $v0, $0, 5
        syscall
        add     $a0, $0, $v0
        jal     setCount       # setCount with user input
        jal     getCount
        add     $a0, $0, $v0
        addi    $v0, $0, 1
        syscall                # print getCount
        jal     println
        addi    $v0, $0, 5
        syscall
        add     $a0, $0, $v0
        jal     signum         # call signum with user input
        add     $a0, $0, $v0
        addi    $v0, $0, 1
        syscall                # print return value of signum
        jal     println
        jal     getCount
        add     $a0, $0, $v0
        addi    $v0, $0, 1
        syscall                # print getCount
        jal     println
        addi    $sp, $sp, 4
        lw      $ra, 0($sp)
        jr      $ra
