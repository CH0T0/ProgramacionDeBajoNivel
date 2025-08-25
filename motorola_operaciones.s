		.file	"operaciones.c"          # Nombre original del archivo fuente en C
	.text
	.section .rdata,"dr"       # Sección de datos de solo lectura (constantes, cadenas de texto)

.LC0:
	.ascii "Ingrese el primer numero: \0"    # Mensaje para pedir el primer número
.LC1:
	.ascii "%f\0"                            # Formato de lectura para float en scanf
	.align 8
.LC2:
	.ascii "Ingrese la operacion (+, -, *, /): \0"   # Mensaje para pedir la operación
.LC3:
	.ascii " %c\0"                           # Formato para leer un caracter (operador)
.LC4:
	.ascii "Ingrese el segundo numero: \0"   # Mensaje para pedir el segundo número
	.align 8
.LC5:
	.ascii "La suma de %.2f + %.2f = %.2f\12\0"      # Mensaje de resultado de suma
	.align 8
.LC6:
	.ascii "La resta de %.2f - %.2f = %.2f\12\0"     # Mensaje de resultado de resta
	.align 8
.LC7:
	.ascii "La multiplicacion de %.2f * %.2f = %.2f\12\0" # Mensaje de resultado de multiplicación
	.align 8
.LC9:
	.ascii "La division de %.2f / %.2f = %.2f\12\0"  # Mensaje de resultado de división
	.align 8
.LC10:
	.ascii "Error: No se puede dividir por cero\0"   # Mensaje de error por división entre 0
.LC11:
	.ascii "Operacion no valida\0"                   # Mensaje de error por operación inválida
	.align 8
.LC12:
	.ascii "Este texto es solo para probar el funcionamiento sin que se cierre XD\0" # Mensaje final
	.text

	.globl	main              # Declaración global de la función main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main             # Inicio de la definición de la función main
main:
	pushq	%rbp               # Guarda el puntero base anterior en la pila
	.seh_pushreg	%rbp
	movq	%rsp, %rbp         # Establece el puntero base actual
	.seh_setframe	%rbp, 0
	subq	$64, %rsp          # Reserva 64 bytes en la pila para variables locales
	.seh_stackalloc	64
	.seh_endprologue
	call	__main             # Llamada a inicialización del entorno C (runtime)

	# ---- Imprime "Ingrese el primer número" ----
	leaq	.LC0(%rip), %rax   # Carga la dirección del mensaje .LC0
	movq	%rax, %rcx         # Pasa la dirección a RCX (1er argumento en Windows x64)
	call	printf              # Llama a printf para imprimir el mensaje

	# ---- Lee el primer número (float) ----
	leaq	-8(%rbp), %rax     # Reserva espacio en pila para guardar número1
	leaq	.LC1(%rip), %rcx   # Dirección del formato "%f"
	movq	%rax, %rdx         # Dirección de variable número1 como argumento
	call	scanf               # Llama a scanf para leer el número

	# ---- Imprime "Ingrese la operación (+, -, *, /): " ----
	leaq	.LC2(%rip), %rax   # Dirección del mensaje .LC2
	movq	%rax, %rcx         # Pasa mensaje a RCX
	call	printf              # Llama a printf

	# ---- Lee el operador (+, -, *, /) ----
	leaq	-17(%rbp), %rax    # Reserva espacio en pila para guardar el caracter
	leaq	.LC3(%rip), %rcx   # Dirección del formato "%c"
	movq	%rax, %rdx         # Dirección de variable operador como argumento
	call	scanf               # Llama a scanf para leer el operador

	# ---- Imprime "Ingrese el segundo número" ----
	leaq	.LC4(%rip), %rax   # Dirección del mensaje .LC4
	movq	%rax, %rcx         # Pasa mensaje a RCX
	call	printf              # Llama a printf

	# ---- Lee el segundo número (float) ----
	leaq	-12(%rbp), %rax    # Reserva espacio en pila para guardar número2
	leaq	.LC1(%rip), %rcx   # Dirección del formato "%f"
	movq	%rax, %rdx         # Dirección de variable número2 como argumento
	call	scanf               # Llama a scanf

	# ---- Verifica el operador ingresado ----
	movzbl	-17(%rbp), %eax    # Carga el operador leído en AL
	cmpb	$43, %al           # Compara con '+' (ASCII 43)
	jne	.L2                 # Si no es '+', salta a .L2

	# ===== Operación SUMA =====
	movss	-8(%rbp), %xmm1    # Carga número1 en XMM1
	movss	-12(%rbp), %xmm0   # Carga número2 en XMM0
	addss	%xmm1, %xmm0       # Realiza la suma
	movss	%xmm0, -4(%rbp)    # Guarda el resultado en variable local
	leaq	.LC5(%rip), %rax   # Dirección del mensaje de suma
	movq	%rax, %rcx         # Pasa mensaje a RCX
	call	printf              # Imprime el resultado
	jmp	.L3                 # Salta al final

.L2: # ===== Operación RESTA =====
	movzbl	-17(%rbp), %eax    # Carga el operador
	cmpb	$45, %al           # Compara con '-' (ASCII 45)
	jne	.L4                 # Si no es '-', salta a .L4
	# Realiza la resta
	movss	-8(%rbp), %xmm0    # Carga número1
	movss	-12(%rbp), %xmm1   # Carga número2
	subss	%xmm1, %xmm0       # Resta número1 - número2
	movss	%xmm0, -4(%rbp)    # Guarda el resultado
	leaq	.LC6(%rip), %rax   # Dirección del mensaje de resta
	movq	%rax, %rcx         # Pasa mensaje a RCX
	call	printf              # Imprime resultado
	jmp	.L3                 # Salta al final

.L4: # ===== Operación MULTIPLICACIÓN =====
	movzbl	-17(%rbp), %eax    # Carga el operador
	cmpb	$42, %al           # Compara con '*' (ASCII 42)
	jne	.L5                 # Si no es '*', salta a .L5
	movss	-8(%rbp), %xmm1    # Carga número1
	movss	-12(%rbp), %xmm0   # Carga número2
	mulss	%xmm1, %xmm0       # Multiplica
	movss	%xmm0, -4(%rbp)    # Guarda resultado
	leaq	.LC7(%rip), %rax   # Dirección del mensaje de multiplicación
	movq	%rax, %rcx         # Pasa mensaje a RCX
	call	printf              # Imprime resultado
	jmp	.L3                 # Salta al final

.L5: # ===== Operación DIVISIÓN =====
	movzbl	-17(%rbp), %eax    # Carga operador
	cmpb	$47, %al           # Compara con '/' (ASCII 47)
	jne	.L6                 # Si no es '/', salta a .L6

	# ---- Verifica división entre cero ----
	movss	-12(%rbp), %xmm0   # Carga número2
	pxor	%xmm1, %xmm1       # Limpia XMM1 (pone 0)
	ucomiss	%xmm1, %xmm0       # Compara número2 con 0
	jp	.L10                # Si hay paridad, salta
	je	.L7                 # Si es igual a 0, salta a error

.L10: # División válida
	movss	-8(%rbp), %xmm0    # Carga número1
	movss	-12(%rbp), %xmm1   # Carga número2
	divss	%xmm1, %xmm0       # Divide número1 / número2
	movss	%xmm0, -4(%rbp)    # Guarda resultado
	leaq	.LC9(%rip), %rax   # Dirección del mensaje de división
	movq	%rax, %rcx         # Pasa mensaje a RCX
	call	printf              # Imprime resultado
	jmp	.L3                 # Salta al final

.L7: # ---- Mensaje de error división entre cero ----
	leaq	.LC10(%rip), %rax  # Dirección del mensaje de error
	movq	%rax, %rcx         # Pasa mensaje a RCX
	call	puts                # Llama a puts para mostrar el error
	jmp	.L3                 # Salta al final

.L6: # ---- Operación no válida ----
	leaq	.LC11(%rip), %rax  # Dirección del mensaje de operación no válida
	movq	%rax, %rcx         # Pasa mensaje a RCX
	call	puts                # Imprime mensaje de error

.L3: # ---- Imprime texto final ----
	leaq	.LC12(%rip), %rax  # Dirección del mensaje final
	movq	%rax, %rcx         # Pasa mensaje a RCX
	call	printf              # Imprime mensaje final

	# ---- Pide un valor extra para que no se cierre la consola ----
	leaq	-16(%rbp), %rax    # Dirección de variable temporal
	leaq	.LC1(%rip), %rcx   # Dirección del formato "%f"
	movq	%rax, %rdx         # Pasa variable a RDX
	call	scanf               # Llama a scanf (espera input)

	movl	$0, %eax           # return 0
	addq	$64, %rsp          # Libera los 64 bytes de la pila
	popq	%rbp               # Restaura el puntero base
	ret                      # Retorna de main
	.seh_endproc

	# ---- Declaraciones externas ----
	.def	__main;	.scl	2;	.type	32;	.endef   # Inicializador de entorno C
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-Builds project) 15.2.0" # Identificador de compilador
	.def	printf;	.scl	2;	.type	32;	.endef  # Función printf externa
	.def	scanf;	.scl	2;	.type	32;	.endef   # Función scanf externa
	.def	puts;	.scl	2;	.type	32;	.endef   # Función puts externa

