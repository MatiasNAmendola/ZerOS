.globl memcmp
#ifdef __x86_64__
memcmp:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rcx
1:
	movb	(%rsi), %al
	movb	(%rdi), %bl
	cmp	%al, %bl
	cmp	$0, %rcx
	je	1f
	dec	%rcx
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
	movq	$0, %rax
4:
	popq	%rdx
	ret	

#endif
