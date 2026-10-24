; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Ciclo do while
; Descripción: Imprime los números del 10 al 100 usando un ciclo do-while.

INCLUDE Irvine32.inc

.data
.code
main PROC
    mov ebx, 10                     ; EBX = 10, VALOR INICIAL

    ciclo:
        mov eax, ebx                ; EAX = EBX PARA IMPRIMIRLO
        call WriteDec               ; IMPRIMIR EL NUMERO
        call Crlf                   ; SALTO DE LINEA

        inc ebx                     ; INCREMENTAMOS EBX
        cmp ebx, 100                ; COMPARAMOS EBX CON 100
        jle ciclo                   ; SI EBX ES MENOR O IGUAL A 100 REGRESA A ETIQUETA CICLO
    exit                            ; TERMINA EL PROGRAMA
main ENDP
END main
