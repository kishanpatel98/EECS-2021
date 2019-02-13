           .globl println
           .globl isPrime
           #-----------------------------
           .text
println:   #-----------------------------
           addi    $a0, $0, 0xA
           addi    $v0, $0, 11
           syscall
           jr      $ra
isPrime:   #-----------------------------
           addi    $t0, $0, 2          # candidate = 2
           addi    $v0, $0, 1          # result = true

           addi    $sp, $sp, -12       # reserve space for 3 registers
           sw      $a0, 8($sp)         # push a0 (the parameter)
           sw      $ra, 4($sp)         # push return address
           sw      $t0, 0($sp)         # push candidate

loop:      beq     $v0, $0, return     # if (result == false) return
           slt     $t1, $t0, $a0 
           beq     $t1, $0, return     # if (candidate >= i) return
           add     $a1, $0, $t0
           jal     isFactor            # isFactor(a0, a1)
           nor     $v0, $v0, $0        # result = !isFactor(a0, a1)
           andi    $v0, $v0, 1         # bit #0
           lw      $t0, 0($sp)         # restore candidate from stack
           addi    $t0, $t0, 1         # increment t0
           sw      $t0, 0($sp)         # push t0 onto stack
           lw      $a0, 8($sp)         # restore a0 from stack
           j       loop
return:    lw      $t0, 0($sp)         # pop t0
           lw      $ra, 4($sp)         # pop return address
           lw      $a0, 8($sp)         # pop a0
           addi    $sp, $sp, 12        # release reserved stack space
           jr      $ra
isFactor:  div     $a0, $a1
           mfhi    $t0                 # t0 = a0 mod a1
           beq     $t0, $0, true       # if (t0 == 0) return true
           addi    $v0, $0, 0          # return false
           jr      $ra
true:      addi    $v0, $0, 1          # return true
           jr      $ra
  
