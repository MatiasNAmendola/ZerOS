#ifdef TEST
.globl strtol_
strtol_:
#else
.globl strtol
strtol:
#endif
#define ZERO	$48
#define NINE	$57
#define _x_	$120
#ifdef __x86_64__
	xorq	%rax, %rax
	test	%rdi, %rdi
	je	4f
	movq	$10, %rbx
	movq	$1, %rcx
	cmp	ZERO, (%rdi)
	jne	1f
	inc	%rdi
	cmp	_x_, (%rdi)
	jne	2f
	inc	%rdi
	jmp	5f
1:
	cmp	$45, (%rdi)
	jne	3f
	movq	$-1, %rcx
	inc	%rdi
	jmp	3f
2:
	cmp	$43, (%rdi)
	jne	3f
	inc %rdi
3:
	cmp	ZERO, (%rdi)
	jb	4f
	cmp	NINE, (%rdi)
	ja	4f
	movb	(%rdi), %dl
	sub	ZERO, %dl
	mul	%rbx
	add	%rax, (%rdx)
	jmp	3b
4:
	ret
5:
	/* TODO: Add 0x------- parsing */
	jmp	1b
#endif
