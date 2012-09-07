#ifdef TEST
.globl strchr_
strchr_:
#else
.globl strchr
strchr:
#endif
#ifdef __x86_64__
	test	%rdi, %rdi
	je	2f
1:
	mov	(%rdi), %al
	cmp	%al,%sil
	je	2f
	inc	%rdi
	test	%al, %al
	jne	1b
	xor	%edi, %edi
2:
	movq	%rdi, %rax
	ret
#endif
/* TODO: Add x86 Support */
