#ifdef TEST
.globl atoi_
atoi_:
#else
.globl atoi
atoi:
#endif
#ifdef __x86_64__
	xorq	%rax, %rax
	cmp	$0, (%rdi)
	je	2f
	mov	$10, %rcx
	movb	(%rdi), %dl
	cmp	$45, %dl	/* '-' */
	je	3f
1:
	mov	(%rdi), %dl
	cmp	$0, %dl
	je	2f
	cmp	$57, %dl	/* '9' */
	ja	2f
	cmp	$48, %dl	/* '0' */
	jb	2f
	sub	$48, %dl	/* '0' */
	imul	$10, %rax, %rax 
	add	%dl, %al
	inc	%rdi
	jmp	1b
2:
	ret
3:
	inc	%rdi
	mov	$1, %rcx
	jmp	1b
#endif
