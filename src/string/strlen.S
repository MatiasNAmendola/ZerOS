#ifdef TEST
.globl	strlen_
strlen_:
#else
.globl	strlen
strlen:
#endif
#ifdef __x86_64__
	pushq	%rdi
	xor	%al, %al
	xor	%rcx, %rcx
	cld
	not	%rcx
	repne	scasb
	not	%rcx
	mov	%rcx, %rax
	dec	%rax
	popq	%rdi
	ret
#else
#ifdef __i386__
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	xorb	%al
	movl	%edi, %esi
	repne	scasb
	movl	%edi, %eax
	subl	%esi, %eax
	decl	%eax
	popl	%edi
	popl	%esi
	popl	%ebp
	ret
#endif
#endif
