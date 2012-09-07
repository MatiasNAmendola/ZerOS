#ifdef TEST
.globl memset_
memset_:
#else
.globl memset
memset:
#endif
#ifdef __x86_64__
	push	%rdi
	mov	%sil, %al
	movq	%rdx, %rcx
	rep	stosb
	pop	%rax
	ret
#endif
