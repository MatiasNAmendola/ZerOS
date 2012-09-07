#ifdef TEST
.globl strncpy_
strncpy_:
#else
.globl strncpy
strncpy:
#endif
#ifdef __x86_64__
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
	movb	(%rsi), %al
	cmp	$0, %al
	je	1f
	jmp	1b
1:

	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rdi, %rax
	popq	%rbp
	ret 
#endif
