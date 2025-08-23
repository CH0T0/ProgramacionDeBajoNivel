	.file	"operaciones.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Ingrese el primer numero: \0"
.LC1:
	.ascii "%f\0"
	.align 8
.LC2:
	.ascii "Ingrese la operacion (+, -, *, /): \0"
.LC3:
	.ascii " %c\0"
.LC4:
	.ascii "Ingrese el segundo numero: \0"
	.align 8
.LC5:
	.ascii "La suma de %.2f + %.2f = %.2f\12\0"
	.align 8
.LC6:
	.ascii "La resta de %.2f - %.2f = %.2f\12\0"
	.align 8
.LC7:
	.ascii "La multiplicacion de %.2f * %.2f = %.2f\12\0"
	.align 8
.LC9:
	.ascii "La division de %.2f / %.2f = %.2f\12\0"
	.align 8
.LC10:
	.ascii "Error: No se puede dividir por cero\0"
.LC11:
	.ascii "Operacion no valida\0"
	.align 8
.LC12:
	.ascii "Este texto es solo para probar el funcionamiento sin que se cierre XD\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-8(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-17(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-12(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movzbl	-17(%rbp), %eax
	cmpb	$43, %al
	jne	.L2
	movss	-8(%rbp), %xmm1
	movss	-12(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm2, %xmm2
	cvtss2sd	-4(%rbp), %xmm2
	movss	-12(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movss	-8(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movapd	%xmm2, %xmm3
	movapd	%xmm3, %xmm2
	movq	%xmm3, %r8
	movapd	%xmm1, %xmm3
	movapd	%xmm3, %xmm1
	movq	%xmm3, %rcx
	movapd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	movq	%xmm3, %rdx
	leaq	.LC5(%rip), %rax
	movapd	%xmm2, %xmm3
	movq	%r8, %r9
	movapd	%xmm1, %xmm2
	movq	%rcx, %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	jmp	.L3
.L2:
	movzbl	-17(%rbp), %eax
	cmpb	$45, %al
	jne	.L4
	movss	-8(%rbp), %xmm0
	movss	-12(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm2, %xmm2
	cvtss2sd	-4(%rbp), %xmm2
	movss	-12(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movss	-8(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movapd	%xmm2, %xmm3
	movapd	%xmm3, %xmm2
	movq	%xmm3, %r8
	movapd	%xmm1, %xmm3
	movapd	%xmm3, %xmm1
	movq	%xmm3, %rcx
	movapd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	movq	%xmm3, %rdx
	leaq	.LC6(%rip), %rax
	movapd	%xmm2, %xmm3
	movq	%r8, %r9
	movapd	%xmm1, %xmm2
	movq	%rcx, %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	jmp	.L3
.L4:
	movzbl	-17(%rbp), %eax
	cmpb	$42, %al
	jne	.L5
	movss	-8(%rbp), %xmm1
	movss	-12(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm2, %xmm2
	cvtss2sd	-4(%rbp), %xmm2
	movss	-12(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movss	-8(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movapd	%xmm2, %xmm3
	movapd	%xmm3, %xmm2
	movq	%xmm3, %r8
	movapd	%xmm1, %xmm3
	movapd	%xmm3, %xmm1
	movq	%xmm3, %rcx
	movapd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	movq	%xmm3, %rdx
	leaq	.LC7(%rip), %rax
	movapd	%xmm2, %xmm3
	movq	%r8, %r9
	movapd	%xmm1, %xmm2
	movq	%rcx, %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	jmp	.L3
.L5:
	movzbl	-17(%rbp), %eax
	cmpb	$47, %al
	jne	.L6
	movss	-12(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L10
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	je	.L7
.L10:
	movss	-8(%rbp), %xmm0
	movss	-12(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm2, %xmm2
	cvtss2sd	-4(%rbp), %xmm2
	movss	-12(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movss	-8(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movapd	%xmm2, %xmm3
	movapd	%xmm3, %xmm2
	movq	%xmm3, %r8
	movapd	%xmm1, %xmm3
	movapd	%xmm3, %xmm1
	movq	%xmm3, %rcx
	movapd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	movq	%xmm3, %rdx
	leaq	.LC9(%rip), %rax
	movapd	%xmm2, %xmm3
	movq	%r8, %r9
	movapd	%xmm1, %xmm2
	movq	%rcx, %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	jmp	.L3
.L7:
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L3
.L6:
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	puts
.L3:
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-16(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-Builds project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
