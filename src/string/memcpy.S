#ifdef TEST
.globl memcpy_
memcpy_:
#else
.globl memcpy
memcpy:
#endif
#ifdef __x86_64__
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rcx
	cld
	rep movsb
	popq	%rsi
	popq	%rdi
	movq	%rdi, %rax
	ret
#endif
