#ifdef TEST
.globl strcspn_
strcspn_:
#else
.globl strcspn
strcspn:
#endif
#ifdef __x86_64__
	mov	%rsi, %rcx
	xor	%rax, %rax
1:
	movb	(%rsi), %dl
	cmpb	(%rdi), %dl
	je	3f
	inc	%rsi
	cmpb	$0, (%rsi)
	jne	1b
2:
	mov	%rcx, %rsi
	inc	%rdi
	inc	%rax
	cmp	$0, (%rdi)
	jne	1b
3:
	ret
#endif
