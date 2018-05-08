.data

.text

.globl fat
fat:

	pushq %rbp
	movq %rsp, %rbp
	subq $16,  %rsp

	movl %r12d, -8(%rbp)
	movl %r13d, -16(%rbp)
	movl %edi,  %r12d

	cmpl $0, %r12d
	jne else_if
		movl $1,  %eax
		jmp end_if
	else_if:
		movl %r12d,  %r13d
		subl $1,     %r13d
		movl %r13d,  %edi
		call fat	
		movl -8(%rbp),  %r12d
		movl -16(%rbp), %r13d
		imull %r12d,  %eax
	end_if:

	leave
	ret
