.globl memcpy
#ifdef __x86_64__
memcpy:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	mov	$0, %cx
	cld
1:
	movsb
	dec	%rdx
	cmp	$0, %rdx
	je	1f
	jmp	1b
1:
	popq	%rdi
	popq	%rsi
	popq	%rdi
	movq	%rdi, %rax
	popq	%rbp
	ret
#endif
