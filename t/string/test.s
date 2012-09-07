	.file	"test.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"[\033[35m%s\033[0m]\t\t\t[\033[1;32mPass\033[0m]\n"
	.align 8
.LC1:
	.string	"[\033[35m%s\033[0m]\t\t\t[\033[1;31mFail\033[0m]\n"
	.text
	.globl	test_
	.type	test_, @function
test_:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpl	$0, -12(%rbp)
	je	.L2
	movl	$.LC0, %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	$.LC1, %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	test_, .-test_
	.section	.rodata
.LC2:
	.string	"Hello"
.LC3:
	.string	"strlen"
.LC4:
	.string	"strcmp"
.LC5:
	.string	"strncmp"
.LC6:
	.string	"Hello World!"
.LC7:
	.string	"strcpy"
.LC8:
	.string	"memcpy"
	.align 8
.LC9:
	.string	"memmove can be very very useful."
.LC10:
	.string	"memmove"
.LC11:
	.string	"memcmp"
.LC12:
	.string	"strcat"
.LC13:
	.string	"Hello World"
.LC14:
	.string	"strncat"
.LC15:
	.string	" World!"
.LC16:
	.string	"strchr"
.LC17:
	.string	"memchr"
.LC18:
	.string	"aeiou"
.LC19:
	.string	"strcspn"
.LC20:
	.string	"ld!"
.LC21:
	.string	"strrchr"
	.align 8
.LC22:
	.string	"almost every programmer should know memset!"
	.align 8
.LC23:
	.string	"------ every programmer should know memset!"
.LC24:
	.string	"memset"
.LC25:
	.string	" "
	.align 8
.LC26:
	.string	" every programmer should know memset!"
.LC27:
	.string	"strpbrk"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -120(%rbp)
	movl	$0, -116(%rbp)
	movl	$.LC2, %edi
	movl	$0, %eax
	call	strlen_
	cmpl	$5, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$.LC2, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$4, %edx
	movl	$.LC2, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	strncmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC5, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movq	$.LC6, -144(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	strlen_
	cltq
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -136(%rbp)
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strcpy_
	movq	-136(%rbp), %rdx
	movq	-144(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	strlen_
	cltq
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -136(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	strlen_
	leal	1(%rax), %edx
	movq	-144(%rbp), %rcx
	movq	-136(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	memcpy_
	movq	-136(%rbp), %rdx
	movq	-144(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC8, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$1835885933, -112(%rbp)
	movl	$543520367, -108(%rbp)
	movl	$544104803, -104(%rbp)
	movl	$1981834594, -100(%rbp)
	movl	$544830053, -96(%rbp)
	movl	$1717924725, -92(%rbp)
	movl	$774794357, -88(%rbp)
	movl	$774778414, -84(%rbp)
	movb	$0, -80(%rbp)
	leaq	-112(%rbp), %rax
	leaq	15(%rax), %rcx
	leaq	-112(%rbp), %rax
	addq	$20, %rax
	movl	$11, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	memmove_
	leaq	-112(%rbp), %rax
	movl	$.LC9, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC10, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$.LC6, %edi
	movl	$0, %eax
	call	strlen_
	movl	%eax, %edx
	movl	$.LC6, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	memcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$1819043144, -64(%rbp)
	movl	$111, -60(%rbp)
	movw	$0, -56(%rbp)
	movl	$1919899424, -48(%rbp)
	movl	$2188396, -44(%rbp)
	movw	$0, -40(%rbp)
	leaq	-48(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strcat_
	leaq	-64(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC12, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$1819043144, -32(%rbp)
	movl	$111, -28(%rbp)
	movw	$0, -24(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	strlen_
	leal	-1(%rax), %edx
	leaq	-48(%rbp), %rcx
	leaq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strncat_
	leaq	-32(%rbp), %rax
	movl	$.LC13, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC14, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$32, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	strchr_
	movl	$.LC15, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC16, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$7, %edx
	movl	$32, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	memchr_
	movl	$.LC15, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC17, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$.LC18, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	strcspn_
	cmpl	$1, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC19, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$108, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	strrchr_
	movl	$.LC20, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC21, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$.LC22, %edi
	movl	$0, %eax
	call	strlen_
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movl	$.LC22, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strcpy_
	movq	-128(%rbp), %rax
	movl	$6, %edx
	movl	$45, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	memset_
	movl	$.LC23, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC24, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movq	-128(%rbp), %rax
	movl	$.LC25, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	strpbrk_
	movl	$.LC26, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	strcmp_
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC27, %edi
	call	test_
	addl	%eax, -120(%rbp)
	addl	$1, -116(%rbp)
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
