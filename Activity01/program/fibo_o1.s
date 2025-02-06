	.file	"fibo.c"
	.text
	.globl	fibo
	.type	fibo, @function
fibo:
.LFB23:
	.cfi_startproc
	endbr64
	movl	$0, %eax
	testq	%rdi, %rdi
	jle	.L6
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbx
	movq	%rdi, %rax
	cmpq	$1, %rdi
	je	.L1
	leaq	-1(%rdi), %rdi
	call	fibo
	movq	%rax, %rbp
	leaq	-2(%rbx), %rdi
	call	fibo
	addq	%rbp, %rax
.L1:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE23:
	.size	fibo, .-fibo
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"fibo of %ld is %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$1, %ebx
	leaq	.LC0(%rip), %rbp
.L10:
	movq	%rbx, %rdi
	call	fibo
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addq	$1, %rbx
	cmpq	$45, %rbx
	jne	.L10
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
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
