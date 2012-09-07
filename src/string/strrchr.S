#ifdef TEST
.globl strrchr_
strrchr_:
#else
.globl strrchr
strrchr:
#endif
#ifdef __x86_64__
	xor	%rax, %rax
	test	%rdi, %rdi
	je	3f
1:
	movb	(%rdi), %bl
	cmp	%bl, %sil
	je	2f
	test	%bl, %bl
	je	3f
	inc	%rdi
	jmp	1b
2:
	movq	%rdi, %rax
	inc	%rdi
	jmp	1b
3:	ret
#endif
