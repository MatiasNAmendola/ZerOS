#ifdef TEST
.globl memmove_
memmove_:
#else
.globl memmove
memmove:
#endif
#ifdef __x86_64__
	pushq	%rax
	test	%cx, %cx
	je	3f
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
3:
	ret
#endif
