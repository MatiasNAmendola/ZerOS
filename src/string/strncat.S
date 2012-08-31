.globl strncat

#ifdef __x86_64__
strncat:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rcx
	cmp	$0, %rcx
	je	2f
	movb	$0, %al
repne	scasb
	movq	$1, %rcx
	dec	%rdi
	dec	%rdx
1:
	movsb
	mov	(%rsi), %al
	cmp	$0, %al
	je	2f
	cmp	$0, %rdx
	je	2f
	dec	%rdx
	jmp	1b
2:
	movb	$0, (%rdi)
	popq	%rdx
	popq	%rdi
	movq	%rdi, %rax
	popq	%rsi
	popq	%rbp
	ret
#endif


