.text

.global foo
foo:
  pushq %rbp
  movq %rsp, %rbp
  
  movl $0,  %ecx # i
  movl $0,  %edx # s
  
  loop_for:
    cmpl %esi, %ecx
    jge end_for
      movl %ecx,  %r8d
      imull $4, %r8d, r8d
      addq %rdi,  %r8
      addl (%r8), %edx
 
      cmp $0, (%r8)
      jne end_if
        movl %edx, (%r8)
        movl $0, %edx
      
      end_if
      incl %ecx
      jmp loop_for
  
  end_for:
  
  leave
  ret
