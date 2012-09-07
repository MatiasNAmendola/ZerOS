#ifdef TEST
.globl strncat_
strncat_:
#else
.globl strncat
strncat:
#endif
#ifdef __x86_64__
	pushq	%rsi
	push	%rdi
	movq	%rdx, %rcx
	cmp	$0, %rcx
	je	2f
	xor	%al, %al
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
	popq	%rdi
	popq	%rsi
	movq	%rdi, %rax
	ret
#endif


