	.file	"fibo.c"
	.text
	.p2align 4
	.globl	fibo
	.type	fibo, @function
fibo:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	testq	%rdi, %rdi
	jle	.L28
	movq	%rdi, %r12
	cmpq	$1, %rdi
	je	.L2
	leaq	-1(%rdi), %r15
	xorl	%r12d, %r12d
.L27:
	cmpq	$1, %r15
	je	.L50
	leaq	-1(%r15), %r13
	xorl	%r14d, %r14d
	movq	%r12, 56(%rsp)
	movq	%r13, 64(%rsp)
	movq	%r13, %rbp
	movq	%r14, %r12
.L26:
	cmpq	$1, %rbp
	je	.L49
	movq	%r15, 72(%rsp)
	leaq	-1(%rbp), %rcx
	xorl	%r14d, %r14d
	movq	%rbp, 80(%rsp)
	movq	%rcx, %rbp
.L25:
	cmpq	$1, %rbp
	je	.L48
	movq	%r14, 96(%rsp)
	leaq	-1(%rbp), %rdi
	xorl	%r15d, %r15d
	movq	%rbp, %r13
	movq	%rcx, 104(%rsp)
	movq	%r12, 88(%rsp)
	movq	%rdi, %r12
.L24:
	cmpq	$1, %r12
	je	.L47
	leaq	-1(%r12), %r11
	xorl	%r14d, %r14d
	movq	%r15, 112(%rsp)
	movq	%r14, 32(%rsp)
	movq	%r11, %rbp
	movq	%rdi, 120(%rsp)
	movq	%r11, 128(%rsp)
	movq	%r12, 136(%rsp)
.L23:
	cmpq	$1, %rbp
	je	.L46
	leaq	-1(%rbp), %r12
	movq	%rbp, 152(%rsp)
	xorl	%r15d, %r15d
	movq	%r12, 144(%rsp)
	movq	%r12, %r14
.L22:
	cmpq	$1, %r14
	je	.L45
	leaq	-1(%r14), %rbp
	movq	%r13, 8(%rsp)
	xorl	%ecx, %ecx
	movq	%rbp, 16(%rsp)
	movq	%rbp, %rbx
	movq	%r14, 24(%rsp)
.L21:
	cmpq	$1, %rbx
	je	.L44
	leaq	-1(%rbx), %rbp
	xorl	%r13d, %r13d
	movq	%rbp, %r14
	movq	%rbp, %rdx
	movq	%rcx, %rbp
	movq	%rbx, %rcx
	movq	%r14, %rbx
.L20:
	movq	%rbx, %r14
	cmpq	$1, %rbx
	je	.L43
	movq	%rbx, 40(%rsp)
	xorl	%r12d, %r12d
	movq	%rdx, %rbx
.L16:
	leaq	-1(%r14), %rdi
	movq	%rcx, 48(%rsp)
	call	fibo
	movq	48(%rsp), %rcx
	addq	%rax, %r12
	subq	$2, %r14
	je	.L52
	cmpq	$1, %r14
	jne	.L16
	movq	%rbx, %rdx
	movq	40(%rsp), %rbx
	addq	$1, %r12
.L18:
	addq	%r12, %r13
	subq	$2, %rbx
	jne	.L20
.L43:
	movq	%rcx, %rbx
	leaq	1(%r13), %rsi
	movq	%rbp, %rcx
	addq	%rsi, %rcx
	subq	$2, %rbx
	cmpq	$1, %rdx
	jne	.L21
.L44:
	movq	24(%rsp), %r14
	movq	%rcx, %rbx
	movq	16(%rsp), %rbp
	addq	$1, %rbx
	movq	8(%rsp), %r13
	addq	%rbx, %r15
	subq	$2, %r14
	cmpq	$1, %rbp
	jne	.L22
.L45:
	movq	152(%rsp), %rbp
	movq	144(%rsp), %r12
	addq	$1, %r15
	addq	%r15, 32(%rsp)
	subq	$2, %rbp
	cmpq	$1, %r12
	jne	.L23
.L46:
	movq	32(%rsp), %r14
	movq	112(%rsp), %r15
	movq	136(%rsp), %r12
	movq	128(%rsp), %r11
	addq	$1, %r14
	movq	120(%rsp), %rdi
	addq	%r14, %r15
	subq	$2, %r12
	cmpq	$1, %r11
	jne	.L24
.L47:
	movq	96(%rsp), %r14
	movq	%r13, %rbp
	addq	$1, %r15
	movq	88(%rsp), %r12
	movq	104(%rsp), %rcx
	subq	$2, %rbp
	addq	%r15, %r14
	cmpq	$1, %rdi
	jne	.L25
.L48:
	movq	80(%rsp), %rbp
	addq	$1, %r14
	movq	72(%rsp), %r15
	addq	%r14, %r12
	subq	$2, %rbp
	cmpq	$1, %rcx
	jne	.L26
.L49:
	movq	%r12, %r14
	movq	64(%rsp), %r13
	movq	56(%rsp), %r12
	subq	$2, %r15
	addq	$1, %r14
	addq	%r14, %r12
	cmpq	$1, %r13
	jne	.L27
.L50:
	addq	$1, %r12
.L2:
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	movq	%rbx, %rdx
	movq	40(%rsp), %rbx
	jmp	.L18
.L28:
	xorl	%r12d, %r12d
	jmp	.L2
	.cfi_endproc
.LFE23:
	.size	fibo, .-fibo
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"fibo of %ld is %ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rbp
	movl	$1, %ecx
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$1, %edx
	movq	%rbp, %rsi
	movl	$2, %edi
	movl	$2, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L54:
	movq	%rbx, %r8
	xorl	%r9d, %r9d
.L55:
	leaq	-1(%r8), %rdi
	call	fibo
	addq	%rax, %r9
	subq	$2, %r8
	je	.L56
	cmpq	$1, %r8
	jne	.L55
	addq	$1, %r9
.L56:
	movq	%rbx, %rdx
	movq	%r9, %rcx
	movq	%rbp, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpq	$45, %rbx
	jne	.L54
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
