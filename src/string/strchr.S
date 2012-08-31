.globl strchr
#ifdef __x86_64__
strchr:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdx
	movb	%rdx, %dl
	movq	$0, %rax
	cmp	$0, %rsi
	je	2f
1:
	movb	(%rsi), %bl
	cmp	%bl,%rdx
	je	2f
	cmp	$0, %bl
	je	2f
	jmp	1b 
2:
	movq	%rsi, %rax
	popq	%rdx
	popq	%rsi
	popq	%rbp
	ret
#endif
