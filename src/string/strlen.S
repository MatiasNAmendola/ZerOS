
.globl strlen
#ifdef __x86_64__
strlen:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	movb	$0, %al
	movq	%rdi, %rsi
	cld
repne	scasb
	movq	%rdi, %rax
	sub	%rsi, %rax
	dec	%rax	
	popq	%rdi
	popq	%rsi
	popq	%rbp
	ret
#endif
#ifdef __i386__
strlen:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%esi
	pushl	%ecx

	movb	$0, %al
	movq	%edi, %esi
	cld
repne	scasb
	movl	%edi, %eax
	sub	%esi, %eax
	popl	%edi
	popl	%esi
	popl	%ebp
	ret
#endif
