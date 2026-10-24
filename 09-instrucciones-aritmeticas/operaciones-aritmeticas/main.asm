; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Operaciones aritmeticas
; Descripción: Realiza multiplicaciones y divisiones con y sin signo usando MUL, IMUL, DIV e IDIV.

INCLUDE Irvine32.inc

.data
mensaje BYTE "Hola mundo", 0        ; MENSAJE DE PRUEBA

.code
main PROC

	;realiza con add y sub
	mov eax, 5                      ; EAX = 5
	add eax, 3                      ; EAX = EAX + 3 (EAX = 8)
	sub eax, 2                      ; EAX = EAX - 2 (EAX = 6)

	mov eax, 5                      ; EAX = 5
	mov ebx, 3                      ; EBX = 3, MUL SOLO RECIBE UN OPERANDO
	mul ebx                         ; EDX:EAX = EAX * EBX SIN SIGNO (EAX = 15)

	mov eax, -5                     ; EAX = -5
	imul eax, eax, 3                ; EAX = EAX * 3 CON SIGNO (EAX = -15)

	mov eax, 125                    ; DIVIDENDO = 125
	mov edx, 0                      ; EDX = 0 ANTES DE DIVIDIR (EDX:EAX ES EL DIVIDENDO)
	mov ebx, 12                     ; DIVISOR = 12

	div ebx                         ; EAX = 125 / 12 = 10, EDX = RESIDUO 5

	mov eax, -125                   ; DIVIDENDO = -125
	cdq                             ; EXTIENDE EL SIGNO DE EAX A EDX (EDX:EAX = -125)
	mov ebx, 12                     ; DIVISOR = 12

	idiv ebx                        ; DIVISION CON SIGNO, EAX = -10, EDX = RESIDUO -5

	exit                            ; TERMINA EL PROGRAMA
main ENDP
END main
