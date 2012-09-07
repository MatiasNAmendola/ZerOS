.globl	clear

#define textmemptr $753664
.data
/*ATTIBUTE*/
.align	4
.type	attribute, @object
.size	attribute, 4
attribute:
/*CSR_X*/
.long	15
.bss
.align	4
.type	csr_x, @object
.size	csr_x, 4
csr_x:
/*CSR_Y*/
.zero	4
.align	4
.type	csr_y, @object
.size	csr_y, 4
csr_y:
.zero	4
.text
/*BEGIN CODE*/

.globl	init_video
init_video:
	jmp	cls
	ret

.globl	cls
cls:
#ifdef __i386__
	xor	%ebx, %ebx
	mov	attribute, %edi
	sal	$8, %edi
	or	$32, %edi
1:
	mov	textmemptr, %eax
	mov	$80, %edx
	mov	$' ', %esi
	add	%rbx, %eax
	add	$160, %ebx
	call	memset
	cmp	$4000, %ebx
	jne	1b
	xorl	csr_x, csr_x
	xorl	csr_y, csr_y
	jmp	move_csr
	ret
#endif
#ifdef __i386__
move_csr:
	pushl	%ebx
	movl	csr_y, %eax
	popl	%ebx
	ret
#endif
