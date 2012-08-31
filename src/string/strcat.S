.globl strcat
#ifdef __x86_64__
strcat:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi

	movb	$0, %al
repne	scasb
	dec	%rdi
1:
	mov	(%rsi), %al
	cmp	$0, %al
	je	1f
	movsb
	jmp	1b
1:
	popq	%rdi
	movq	%rdi, %rax
	popq	%rsi
	popq	%rbp
	ret
#endif

