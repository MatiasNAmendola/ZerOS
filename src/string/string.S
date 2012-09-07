.globl memchr

#ifdef __x86_64__
memchr:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
1:
	movb	(%rdi), %al
	movb	(%rsi), %bl
	cmp	%bl, %al
	je	1f
	inc	%rsi
	dec	%rdx
	jz	2f
1:
	movq	%rsi, %rax
1:
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
2:
	movq	$0, %rax
	jmp	1b
#endif
.globl memcmp
#ifdef __x86_64__
memcmp:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rcx
1:
	movb	(%rsi), %al
	movb	(%rdi), %bl
	cmp	%al, %bl
	cmp	$0, %rcx
	je	1f
	dec	%rcx
	je	1b
	jb	2f
	ja	3f
2:
	movq	-1, %rax
	jmp	4f
3:
	movq	$1, %rax
	jmp	4f
1:
	movq	$0, %rax
4:
	popq	%rdx
	ret	

#endif
.globl memcpy
#ifdef __x86_64__
memcpy:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	mov	$0, %cx
	cld
1:
	movsb
	dec	%rdx
	cmp	$0, %rdx
	je	1f
	jmp	1b
1:
	popq	%rdi
	popq	%rsi
	popq	%rdi
	movq	%rdi, %rax
	popq	%rbp
	ret
#endif
.globl memmove
#ifdef __x86_64__
memmove:
	cmp	$0, %cx
	je	3f
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rcx
	
	cmpq	%rdi, %rsi
	jb	1f

	movq	%rdi, %rdx
	shrq	$1, %rdx
	jnc	11f
	movsb
	decq	%rcx
11:
	movb	%cl, %al
	cmpq	$2, %rdx
	jnc	12f
	movsw
	subq	$2, %rcx
12:
	movb	%cl, %al
	shrq	$2, %rcx
	rep	movsl

	testb	$2, %al
	jz	14f
	movsw
13:
14:
	testb	$1, %al
	jz	15f
	movsb
15:
	jmp 2f

1:
	std
	leaq	-1(%rcx,%rsi),%rsi
	leaq	-1(%rcx,%rdi),%rdi
	movq	%rdi, %rdx
	shrq	$1, %rdx
	jc	21f
	movsb
	decq	%rcx
21:
	decq	%rsi
	decq	%rdi
	movb	%cl, %al
	cmpq	$2, %rcx
	jb	23f
	shrq	$1, %rdx
	jc	22f
	movsw
	subq	$2, %rcx
22:
	subq	$2, %rsi
	subq	$2, %rdi
	movb	%cl, %al
	shrq	$2, %rcx
	rep	movsl
	addq	$2, %rsi
	addq	$2, %rdi
	testb	$2, %al
	jz	24f
	movsw
23:
24:
	incq	%rsi
	incq	%rdi
	testb	$1, %al
	jz	25f
	movsb
25:
	cld
2:
	popq	%rax
	popq	%rdi
	popq	%rsi
	popq	%rbp
3:
	ret
#endif
.globl strcat
#ifdef __x86_64__
strcat:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi

	movb	$0, %al
repne	scasb
	dec	%rdi
1:
	mov	(%rsi), %al
	cmp	$0, %al
	je	1f
	movsb
	jmp	1b
1:
	popq	%rdi
	movq	%rdi, %rax
	popq	%rsi
	popq	%rbp
	ret
#endif

.globl strchr
#ifdef __x86_64__
strchr:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdx
	mov	(%rdx), %dl
	movq	$0, %rax
	cmp	$0, %rsi
	je	2f
1:
	movb	(%rsi), %bl
	cmp	%bl,%dl
	je	2f
	cmp	$0, %bl
	je	2f
	jmp	1b 
2:
	inc	%rsi
	movq	%rsi, %rax
	popq	%rdx
	popq	%rsi
	popq	%rbp
	ret
#endif
/* TODO: Add x86 Support */
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
.globl strcpy
#ifdef __x86_64__
strcpy:
	push	%rbp
	movq	%rsp, %rbp	
	push	%rsi
	push	%rdi
	push	%rcx	
	mov	$0, %cx
	cld
	
1:
	movsb
	movb	(%rsi), %al
	cmp	$0, %al
	je	1f
	jmp	1b
1:
	movsb
	popq	%rsi
	popq	%rdi
	movq	%rdi, %rax
	popq	%rcx
	popq	%rbp
	ret	$8
#endif
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
	movl	%edi, %esi
	cld
repne	scasb
	movl	%edi, %eax
	sub	%esi, %eax
	popl	%edi
	popl	%esi
	popl	%ebp
	ret
#endif
.globl strncat

#ifdef __x86_64__
strncat:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rcx
	cmp	$0, %rcx
	je	2f
	movb	$0, %al
repne	scasb
	movq	$1, %rcx
	dec	%rdi
	dec	%rdx
1:
	movsb
	mov	(%rsi), %al
	cmp	$0, %al
	je	2f
	cmp	$0, %rdx
	je	2f
	dec	%rdx
	jmp	1b
2:
	movb	$0, (%rdi)
	popq	%rdx
	popq	%rdi
	movq	%rdi, %rax
	popq	%rsi
	popq	%rbp
	ret
#endif


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
#ifdef __x86_64__
strncpy:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	mov	$0, %cx
	cld
1:
	movsb
	dec	%rdx
	cmp	$0, %rdx
	je	1f
	movb	(%rsi), %al
	cmp	$0, %al
	je	1f
	jmp	1b
1:

	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rdi, %rax
	popq	%rbp
	ret 
#endif
