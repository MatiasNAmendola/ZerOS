	.file	"test.c"
	.text
	.p2align 4,,15
	.globl	scroll
	.type	scroll, @function
scroll:
.LFB0:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	csr_y, %eax
	movl	%ebx, 20(%esp)
	movl	attrib, %ebx
	.cfi_offset 3, -12
	movl	%esi, 24(%esp)
	cmpl	$24, %eax
	jle	.L1
	.cfi_offset 6, -8
	subl	$24, %eax
	movl	textmemptr, %edx
	imull	$-160, %eax, %esi
	leal	(%eax,%eax,4), %eax
	sall	$5, %eax
	addl	%edx, %eax
	addl	$4000, %esi
	movl	%esi, 8(%esp)
	sall	$8, %ebx
	movl	%edx, (%esp)
	orl	$32, %ebx
	movl	%eax, 4(%esp)
	call	memcpy
	addl	textmemptr, %esi
	movl	$80, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	call	memsetw
	movl	$24, csr_y
.L1:
	movl	20(%esp), %ebx
	movl	24(%esp), %esi
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	.cfi_restore 6
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE0:
	.size	scroll, .-scroll
	.p2align 4,,15
	.globl	move_csr
	.type	move_csr, @function
move_csr:
.LFB1:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	csr_y, %eax
	movl	$14, 4(%esp)
	movl	$980, (%esp)
	leal	(%eax,%eax,4), %ebx
	sall	$4, %ebx
	addl	csr_x, %ebx
	call	outportb
	movl	$981, (%esp)
	movl	%ebx, %eax
	shrl	$8, %eax
	movl	%eax, 4(%esp)
	call	outportb
	movl	$15, 4(%esp)
	movl	$980, (%esp)
	call	outportb
	movl	%ebx, 4(%esp)
	movl	$981, (%esp)
	call	outportb
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_def_cfa_offset 4
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE1:
	.size	move_csr, .-move_csr
	.p2align 4,,15
	.globl	cls
	.type	cls, @function
cls:
.LFB2:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	xorl	%ebx, %ebx
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	attrib, %esi
	sall	$8, %esi
	orl	$32, %esi
	.p2align 4,,7
	.p2align 3
.L6:
	movl	textmemptr, %eax
	movl	$80, 8(%esp)
	movl	%esi, 4(%esp)
	addl	%ebx, %eax
	addl	$160, %ebx
	movl	%eax, (%esp)
	call	memsetw
	cmpl	$4000, %ebx
	jne	.L6
	movl	$0, csr_x
	movl	$0, csr_y
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	popl	%esi
	.cfi_def_cfa_offset 4
	.cfi_restore 6
	jmp	move_csr
	.cfi_endproc
.LFE2:
	.size	cls, .-cls
	.p2align 4,,15
	.globl	putch
	.type	putch, @function
putch:
.LFB3:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movl	attrib, %edx
	movzbl	16(%esp), %eax
	cmpb	$8, %al
	je	.L18
	cmpb	$9, %al
	je	.L19
	cmpb	$13, %al
	je	.L20
	cmpb	$10, %al
	.p2align 4,,5
	je	.L17
	cmpb	$31, %al
	.p2align 4,,5
	jbe	.L21
	movl	csr_y, %ecx
	sall	$8, %edx
	movzbl	%al, %eax
	movl	csr_x, %ebx
	orl	%edx, %eax
	movl	textmemptr, %edx
	leal	(%ecx,%ecx,4), %ecx
	sall	$4, %ecx
	addl	%ebx, %ecx
	movw	%ax, (%edx,%ecx,2)
	leal	1(%ebx), %eax
	cmpl	$79, %eax
	movl	%eax, csr_x
	jle	.L15
	.p2align 4,,7
	.p2align 3
.L17:
	addl	$1, csr_y
	movl	$0, csr_x
.L15:
	call	scroll
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_def_cfa_offset 4
	.cfi_restore 3
	jmp	move_csr
	.p2align 4,,7
	.p2align 3
.L18:
	.cfi_restore_state
	movl	csr_x, %eax
	testl	%eax, %eax
	je	.L15
	subl	$1, %eax
	movl	%eax, csr_x
	jmp	.L11
	.p2align 4,,7
	.p2align 3
.L19:
	movl	csr_x, %eax
	addl	$8, %eax
	andl	$-8, %eax
	movl	%eax, csr_x
.L11:
	cmpl	$79, %eax
	jg	.L17
	jmp	.L15
	.p2align 4,,7
	.p2align 3
.L20:
	movl	$0, csr_x
	call	scroll
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	jmp	move_csr
	.p2align 4,,7
	.p2align 3
.L21:
	.cfi_restore_state
	movl	csr_x, %eax
	jmp	.L11
	.cfi_endproc
.LFE3:
	.size	putch, .-putch
	.p2align 4,,15
	.globl	puts
	.type	puts, @function
puts:
.LFB4:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	xorl	%ebx, %ebx
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %esi
	jmp	.L23
	.p2align 4,,7
	.p2align 3
.L24:
	movzbl	(%esi,%ebx), %eax
	addl	$1, %ebx
	movl	%eax, (%esp)
	call	putch
.L23:
	movl	%esi, (%esp)
	call	strlen
	cmpl	%eax, %ebx
	jb	.L24
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	popl	%esi
	.cfi_def_cfa_offset 4
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE4:
	.size	puts, .-puts
	.p2align 4,,15
	.globl	settextcolor
	.type	settextcolor, @function
settextcolor:
.LFB5:
	.cfi_startproc
	movzbl	8(%esp), %eax
	movzbl	4(%esp), %edx
	sall	$4, %eax
	andl	$15, %edx
	orl	%edx, %eax
	movl	%eax, attrib
	ret
	.cfi_endproc
.LFE5:
	.size	settextcolor, .-settextcolor
	.p2align 4,,15
	.globl	init_video
	.type	init_video, @function
init_video:
.LFB6:
	.cfi_startproc
	movl	$753664, textmemptr
	jmp	cls
	.cfi_endproc
.LFE6:
	.size	init_video, .-init_video
	.globl	csr_y
	.bss
	.align 4
	.type	csr_y, @object
	.size	csr_y, 4
csr_y:
	.zero	4
	.globl	csr_x
	.align 4
	.type	csr_x, @object
	.size	csr_x, 4
csr_x:
	.zero	4
	.globl	attrib
	.data
	.align 4
	.type	attrib, @object
	.size	attrib, 4
attrib:
	.long	15
	.comm	textmemptr,4,4
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
