#ifdef TEST
.globl strcpy_
strcpy_:
#else
.globl strcpy
strcpy:
#endif
#ifdef __x86_64__
	push	%rsi
	push	%rdi	
	mov	$0, %cx
	cld
	
1:
	movsb
	movb	(%rsi), %al
	cmp	$0, %al
	je	1f
	jmp	1b
1:
	movsb
	popq	%rsi
	popq	%rdi
	movq	%rdi, %rax
	ret
#endif
