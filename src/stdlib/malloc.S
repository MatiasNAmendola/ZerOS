#ifdef TEST
.globl malloc_
malloc_:
#else
.globl malloc
malloc:
#endif
#ifdef __x86_64__
	ret
#endif
