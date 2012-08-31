.globl strcmp
#ifdef __x86_64__
#define str1	8(%rbp)
#define str2	12(%rbp)
strcmp:
	pushq	%rbp
	movq	%rsp, %rbp
	
	pushq	%rsi
	pushq	%rcx
	pushq	%rbx

	movq	str1, %rsi
	movq	str2, %rdi
1:
	movb	(%rsi), %al
	movb	(%rdi), %bl
	cmp	%al, %bl
	jne	2f
	cmp	$0, %al
	je	1f
	inc	%rsi
	inc	%rdi
	jmp	1b
1:
	mov	$0, %rax
	jmp	1f
2:
	jg	2f
	movq	-1, %rax
	jmp	1f
2:
	movq	$1, %rax
1:
	popq	%rbx
	popq	%rcx
	popq	%rsi
	popq	%rbp
	
	ret
#endif
