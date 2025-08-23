	.file	"operaciones.c"
	.intel_syntax noprefix
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
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -8[rbp]
	lea	rcx, .LC1[rip]
	mov	rdx, rax
	call	scanf
	lea	rax, .LC2[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -17[rbp]
	lea	rcx, .LC3[rip]
	mov	rdx, rax
	call	scanf
	lea	rax, .LC4[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -12[rbp]
	lea	rcx, .LC1[rip]
	mov	rdx, rax
	call	scanf
	movzx	eax, BYTE PTR -17[rbp]
	cmp	al, 43
	jne	.L2
	movss	xmm1, DWORD PTR -8[rbp]
	movss	xmm0, DWORD PTR -12[rbp]
	addss	xmm0, xmm1
	movss	DWORD PTR -4[rbp], xmm0
	pxor	xmm2, xmm2
	cvtss2sd	xmm2, DWORD PTR -4[rbp]
	movss	xmm0, DWORD PTR -12[rbp]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, xmm0
	movss	xmm0, DWORD PTR -8[rbp]
	cvtss2sd	xmm0, xmm0
	movapd	xmm3, xmm2
	movapd	xmm2, xmm3
	movq	r8, xmm3
	movapd	xmm3, xmm1
	movapd	xmm1, xmm3
	movq	rcx, xmm3
	movapd	xmm3, xmm0
	movapd	xmm0, xmm3
	movq	rdx, xmm3
	lea	rax, .LC5[rip]
	movapd	xmm3, xmm2
	mov	r9, r8
	movapd	xmm2, xmm1
	mov	r8, rcx
	movapd	xmm1, xmm0
	mov	rcx, rax
	call	printf
	jmp	.L3
.L2:
	movzx	eax, BYTE PTR -17[rbp]
	cmp	al, 45
	jne	.L4
	movss	xmm0, DWORD PTR -8[rbp]
	movss	xmm1, DWORD PTR -12[rbp]
	subss	xmm0, xmm1
	movss	DWORD PTR -4[rbp], xmm0
	pxor	xmm2, xmm2
	cvtss2sd	xmm2, DWORD PTR -4[rbp]
	movss	xmm0, DWORD PTR -12[rbp]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, xmm0
	movss	xmm0, DWORD PTR -8[rbp]
	cvtss2sd	xmm0, xmm0
	movapd	xmm3, xmm2
	movapd	xmm2, xmm3
	movq	r8, xmm3
	movapd	xmm3, xmm1
	movapd	xmm1, xmm3
	movq	rcx, xmm3
	movapd	xmm3, xmm0
	movapd	xmm0, xmm3
	movq	rdx, xmm3
	lea	rax, .LC6[rip]
	movapd	xmm3, xmm2
	mov	r9, r8
	movapd	xmm2, xmm1
	mov	r8, rcx
	movapd	xmm1, xmm0
	mov	rcx, rax
	call	printf
	jmp	.L3
.L4:
	movzx	eax, BYTE PTR -17[rbp]
	cmp	al, 42
	jne	.L5
	movss	xmm1, DWORD PTR -8[rbp]
	movss	xmm0, DWORD PTR -12[rbp]
	mulss	xmm0, xmm1
	movss	DWORD PTR -4[rbp], xmm0
	pxor	xmm2, xmm2
	cvtss2sd	xmm2, DWORD PTR -4[rbp]
	movss	xmm0, DWORD PTR -12[rbp]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, xmm0
	movss	xmm0, DWORD PTR -8[rbp]
	cvtss2sd	xmm0, xmm0
	movapd	xmm3, xmm2
	movapd	xmm2, xmm3
	movq	r8, xmm3
	movapd	xmm3, xmm1
	movapd	xmm1, xmm3
	movq	rcx, xmm3
	movapd	xmm3, xmm0
	movapd	xmm0, xmm3
	movq	rdx, xmm3
	lea	rax, .LC7[rip]
	movapd	xmm3, xmm2
	mov	r9, r8
	movapd	xmm2, xmm1
	mov	r8, rcx
	movapd	xmm1, xmm0
	mov	rcx, rax
	call	printf
	jmp	.L3
.L5:
	movzx	eax, BYTE PTR -17[rbp]
	cmp	al, 47
	jne	.L6
	movss	xmm0, DWORD PTR -12[rbp]
	pxor	xmm1, xmm1
	ucomiss	xmm0, xmm1
	jp	.L10
	pxor	xmm1, xmm1
	ucomiss	xmm0, xmm1
	je	.L7
.L10:
	movss	xmm0, DWORD PTR -8[rbp]
	movss	xmm1, DWORD PTR -12[rbp]
	divss	xmm0, xmm1
	movss	DWORD PTR -4[rbp], xmm0
	pxor	xmm2, xmm2
	cvtss2sd	xmm2, DWORD PTR -4[rbp]
	movss	xmm0, DWORD PTR -12[rbp]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, xmm0
	movss	xmm0, DWORD PTR -8[rbp]
	cvtss2sd	xmm0, xmm0
	movapd	xmm3, xmm2
	movapd	xmm2, xmm3
	movq	r8, xmm3
	movapd	xmm3, xmm1
	movapd	xmm1, xmm3
	movq	rcx, xmm3
	movapd	xmm3, xmm0
	movapd	xmm0, xmm3
	movq	rdx, xmm3
	lea	rax, .LC9[rip]
	movapd	xmm3, xmm2
	mov	r9, r8
	movapd	xmm2, xmm1
	mov	r8, rcx
	movapd	xmm1, xmm0
	mov	rcx, rax
	call	printf
	jmp	.L3
.L7:
	lea	rax, .LC10[rip]
	mov	rcx, rax
	call	puts
	jmp	.L3
.L6:
	lea	rax, .LC11[rip]
	mov	rcx, rax
	call	puts
.L3:
	lea	rax, .LC12[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -16[rbp]
	lea	rcx, .LC1[rip]
	mov	rdx, rax
	call	scanf
	mov	eax, 0
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-Builds project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
