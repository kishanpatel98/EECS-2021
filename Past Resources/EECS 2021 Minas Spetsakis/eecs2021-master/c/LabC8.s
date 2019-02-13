                 .globl println
                 .globl printVertical
                 #-----------------------------
                 .text
println:         #-----------------------------
                 addi    $a0, $0, 0xA
                 addi    $v0, $0, 11
                 syscall
                 jr      $ra
printVertical:   #-----------------------------
                 addi    $sp, $sp, -8        # reserve space for 2 registers
                 sw      $ra, 4($sp)         # push return address
                 sw      $a0, 0($sp)         # push a0 (the parameter)

                 sgt     $t0, $a0, $0
                 beq     $t0, $0, return     # if (n <= 0) return
                 addi    $t0, $0, 10         # t0 = 10
                 div     $a0, $t0
                 mflo    $a0                 # a0 /= 10
                 jal     printVertical       # printVertical(a0)
                 lw      $a0, 0($sp)         # restore the parameter
                 addi    $t0, $0, 10         # t0 = 10
                 div     $a0, $t0
                 mfhi    $a0                 # a0 = a0 mod 10
                 addi    $v0, $0, 1
                 syscall                     # print a0
                 jal     println
return:          lw      $a0, 0($sp)         # pop a0
                 lw      $ra, 4($sp)         # pop return address
                 addi    $sp, $sp, 8         # release reserved stack space
                 jr      $ra
