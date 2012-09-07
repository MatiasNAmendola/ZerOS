#ifdef TEST
.globl strncmp_
strncmp_:
#else
.globl strncmp
strncmp:
#endif
#ifdef __x86_64__
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	pushq	%rdx
	movq	%rdx,  %rcx
	movq	$0,   %rdx
1:
	dec	%rcx
	movb	(%rsi), %al
	movb	(%rdi), %ah
	cmp	$0, %rcx
	je	2f
	cmp	%ah, %al
	jl	1f
	jg	3f
	cmp	$0, %al
	je	2f
	cmp	$0, %ah
	je	2f
	inc	%rsi
	inc	%rdi
	jmp	1b
1:
	movq	-1, %rax
	jmp	1f
3:
	movq	1, %rax
	jmp	1f
2:
	movq	$0, %rax
1:
	popq	%rdx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	ret
#undef str1
#undef str2
#undef num
#endif
