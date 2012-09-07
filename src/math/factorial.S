.globl factorial
factorial:
#ifdef __x86_64__
	movq	%rdi, %rcx
	movq	%rdi, %rax
	dec	%rcx
1:
	mul	%rcx
	dec	%rcx
	jnz	1b
	ret	
#endif
