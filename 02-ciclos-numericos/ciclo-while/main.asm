; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Ciclo while
; Descripción: Imprime los números del 1 al 10 usando un ciclo while.

INCLUDE Irvine32.inc

.data

.code
main PROC
    mov ebx, 1                      ; EBX = 1, VALOR INICIAL

    ciclo:
        cmp ebx, 10                 ; COMPARAMOS EBX CON 10
        jg fin                      ; SI EBX ES MAYOR A 10 BRINCA A ETIQUETA FIN

        mov eax, ebx                ; EAX = EBX PARA IMPRIMIRLO
        call WriteDec               ; IMPRIMIR EL NUMERO
        call Crlf                   ; SALTO DE LINEA

        inc ebx                     ; INCREMENTAMOS EBX
        jmp ciclo                   ; REGRESA A ETIQUETA CICLO

    fin:
        exit                        ; TERMINA EL PROGRAMA

main ENDP
END main
