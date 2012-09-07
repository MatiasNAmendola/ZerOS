#ifdef TEST
.globl abs_
abs_:
#else
.globl abs
abs:
#endif
#ifdef __x86_64__
	cmp	$0, %rdi
	je	1f
	neg	%rdi
1:
	mov	%rdi, %rax
	ret
#endif
