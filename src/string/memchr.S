#ifdef TEST
.globl memchr_
memchr_:
#else
.globl memchr
memchr:
#endif
#ifdef __x86_64__
	test	%rdi, %rdi
	je	3f
	movq	%rdx, %rcx
1:
	mov	(%rdi), %al	
	cmp	%al, %sil
	je	1f
	inc	%rdi
	dec	%rcx
	cmp	$0, %rcx
	je	2f
	jmp	1b	
1:
	movq	%rdi, %rax
3:
	ret
2:
	xorq	%rax, %rax
	jmp	3b
#endif
