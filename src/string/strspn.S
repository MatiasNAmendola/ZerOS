#ifdef TEST
.globl strspn_
strspn_:
#else
.globl strspn
strspn:
#endif
#ifdef __x86_64__
	xorq	%rax, %rax
	testq	%rdi, %rdi
	je	4f
	cmp	$0, %rdi
	je	4f
	movq	%rsi, %rcx
1:
	movb	(%rsi), %dl
	cmpb	(%rdi),	%dl
	je	3f
	cmp	$0, (%rsi)
	je	2f
	inc	%rsi
	cmp	$0, (%rdi)
	je	4f
	jmp	1b
2:
	movq	%rcx, %rsi
	jmp	1b
3:
	movq	%rcx, %rsi
	inc	%rdi
	jmp	1b
2:		
	movb	(%rsi), %dl
	cmpb	(%rdi), %dl
	jne	1f
	inc	%rax
	inc	%rdi
	cmp	$0, (%rdi)
	je	4f
	jmp	2b
1:
	cmpb	$0, (%rdi)
	je	4f
	cmpb	$0, (%rsi)
	jne	4f
	movq	%rcx, %rsi
	jmp	2b
	
4:
	ret
#endif
