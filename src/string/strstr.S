#ifdef TEST
.globl strstr_
strstr_:
#else
.globl strstr
strstr:
#endif
#ifdef __x86_64__
	testq	%rdi, %rdi
	je	3f
	testq	%rsi, %rsi
	je	3f
	xorq	%rcx, %rcx
1:
	movb	(%rdi), %dl
	cmpb	(%rsi), %dl
	je	2f
	cmp	$0, (%rdi)
	je	3f
	inc	(%rdi)
	jmp	1b
2:
	movb	(%rdi), %dl
	cmpb	(%rsi
#endif
