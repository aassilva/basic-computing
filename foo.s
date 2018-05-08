.data

.text

.globl foot
foot:

	pushq %rbp
	movq %rsp, %rbp
	subq $16,  %rsp

	movl %r12, -8(%rbp)
	movl %r13d, -16(%rbp)
	movq $(%edi),  %r12d
	movl $0,    %r13d   #coloca 0 no s

	movl $0,    %r8d   #coloca 0 no i

	Loop:
		cmpl %r8d,  %esi
		jg end_loop
		addl %r12d,  %r13d

		cmpl $0, %r12d
		je end_if
			movq $0,  $(%edi)
			movl $0,  %r13d
		end_if
			incl %r8d
			addl $4, %r12d
	end_loop:
		movl -8(%rbp),  %r12d
		movl -16(%rbp), %r13d

	leave
	ret
