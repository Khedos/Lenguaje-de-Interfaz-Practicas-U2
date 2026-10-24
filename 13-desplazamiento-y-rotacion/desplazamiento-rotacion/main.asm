; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Desplazamiento rotacion
; Descripción: Muestra el uso de las instrucciones de desplazamiento (SHL, SHR, SAR) y de rotación (ROR, ROL, RCL, RCR) sobre valores binarios.

INCLUDE Irvine32.inc

.data
mensaje BYTE "Hola mundo", 0        ; MENSAJE DE PRUEBA

.code
main PROC
	mov al, 00011000b               ; AL = 00011000b
	shl al, 1 ;DESPLAZAR 1 POSICION A LA IZQUIERDA
	call WriteBin                   ; IMPRIMIR AL EN BINARIO

	mov al, 00001101b               ; AL = 00001101b
	shr al, 1 ;DESPLAZAR 1 POSICION A LA DERECHA

	mov al, -8                      ; AL = -8 (11111000b)
	sar al, 1                       ; DESPLAZAMIENTO ARITMETICO A LA DERECHA, CONSERVA EL SIGNO (-8 / 2 = -4)
	call WriteBin                   ; IMPRIMIR AL EN BINARIO
	call dumpregs                   ; MOSTRAR LOS REGISTROS

	mov al, -9                      ; AL = -9 (11110111b)
	sar al, 1                       ; DESPLAZAMIENTO ARITMETICO A LA DERECHA (-9 / 2 = -5, REDONDEA HACIA ABAJO)
	call WriteBin                   ; IMPRIMIR AL EN BINARIO
	call dumpregs                   ; MOSTRAR LOS REGISTROS

	mov al, 00001111b               ; AL = 00001111b
	shl al, 2 ;DESPLAZA 2 BITS HACIA LA IZQUIERDA CON CONSTANTE

	mov al, 00001111b               ; AL = 00001111b
	mov cl, 2                       ; CL = 2, CANTIDAD DE BITS A DESPLAZAR
	shr al, cl                      ; DESPLAZAR AL A LA DERECHA LAS POSICIONES QUE INDICA CL
	call WriteBin                   ; IMPRIMIR AL EN BINARIO
	call dumpregs ;DESPLAZAR 2 BITS HACIA LA DERECHA USANDO CL

	mov al, 10000111b               ; AL = 10000111b
	ror al, 1                       ; ROTAR 1 BIT A LA DERECHA, EL BIT 0 PASA AL BIT 7 (AL = 11000011b)

	mov al, 10000111b               ; AL = 10000111b
	rol al, 1                       ; ROTAR 1 BIT A LA IZQUIERDA, EL BIT 7 PASA AL BIT 0 (AL = 00001111b)

	mov al, 10000111b               ; AL = 10000111b
	rcl al, 1                       ; ROTAR A LA IZQUIERDA A TRAVES DEL CARRY, EL BIT 7 VA A CF Y CF ENTRA AL BIT 0

	mov al, 10000111b               ; AL = 10000111b
	rcr al, 1                       ; ROTAR A LA DERECHA A TRAVES DEL CARRY, EL BIT 0 VA A CF Y CF ENTRA AL BIT 7

	;DESCRIBIR CADA UNO

	exit                            ; TERMINA EL PROGRAMA
main ENDP
END main
