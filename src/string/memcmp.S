#ifdef TEST
.globl memcmp_
memcmp_:
#else
.globl memcmp
memcmp:
#endif
#ifdef __x86_64__
	movq	%rdx, %rcx
1:
	movb	(%rsi), %al
	movb	(%rdi), %bl
	test	%rcx, %rcx
	je	1f
	dec	%rcx
	cmp	%al, %bl
	je	1b
	jb	2f
	ja	3f
2:
	movq	-1, %rax
	jmp	4f
3:
	movq	$1, %rax
	jmp	4f
1:
	xor	%rax, %rax
4:
	ret	

#endif
