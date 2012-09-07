#ifdef TEST
.globl strpbrk_
strpbrk_:
#else
.globl strpbrk
strpbrk:
#endif
	test	%rdi, %rdi
	je	6f
	mov	%rsi, %rcx
1:
	mov	(%rsi), %al
	cmp	(%rdi), %al
	je	5f
	cmp	$0, (%rdi)
	je	4f
	cmp	$0, (%rsi)
	je	2f
	inc	%rdi
	jmp	1b
2:
	mov	%rcx, %rsi
	jmp	1b
4:
	xor	%rax, %rax
	jmp	6f
5:
	mov	%rdi, %rax
6:
	ret

