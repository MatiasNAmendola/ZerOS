.globl strncmp
#ifdef __x86_64__
#define str1	8(%rbp)
#define str2	12(%rbp)
#define num	16(%rbp)
strncmp:
	pushq	%rbp
	movq	%rsp, %rbp
	
	movq	str1, %rsi
	movq	str2, %rdi
	movq	num,  %rcx
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
	popq	%rbp
	ret
3:
	movq	1, %rax
	popq	%rbp
	ret
2:
	movq	$0, %rax
	popq	%rbp
	ret
#undef str1
#undef str2
#undef num
#endif
