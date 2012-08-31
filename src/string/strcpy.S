.globl strcpy
#ifdef __x86_64__
strcpy:
	push	%rbp
	movq	%rsp, %rbp	
	push	%rsi
	push	%rdi
	push	%rcx	
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
	popq	%rcx
	popq	%rbp
	ret	$8
#endif