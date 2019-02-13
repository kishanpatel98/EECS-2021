  .text
main:
      addi   $t0, $0, 60
      addi   $t1, $0, 7
      #---------------------
      # division
      div    $t0, $t1
      mflo   $a0
      add    $v0, $0, 1     # service #1 for printInt
      syscall
      add    $v0, $s0, 11   # service #11 for printChar
      add    $a0, $0, ' '
      syscall               # print a space
      add    $v0, $0, 1     # service #1 for printInt
      mfhi   $a0
      syscall
      #---------------------
      add    $v0, $s0, 11   # service #11 for printChar
      add    $a0, $0, 10
      syscall               # print a newline
      # multiplication
      add    $v0, $0, 1     # service #1 for printInt
      mult   $t0, $t1
      mfhi   $a0
      syscall
      mflo   $a0
      syscall
      #---------------------
      jr     $ra            # return
