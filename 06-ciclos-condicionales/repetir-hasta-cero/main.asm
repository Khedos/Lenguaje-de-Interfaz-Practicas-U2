; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Repetir hasta cero
; Descripción: Ciclo condicional que pide números al usuario y los muestra hasta que se introduce 0; al terminar muestra cuántos números se capturaron y su suma.

INCLUDE Irvine32.inc

.data
msjCaptura BYTE "Ingrese un numero (0 para terminar): ", 0
msjNumero BYTE "Numero capturado: ", 0
msjCantidad BYTE "Cantidad de numeros capturados: ", 0
msjSuma BYTE "Suma de los numeros: ", 0

contador DWORD 0                        ; CANTIDAD DE NUMEROS CAPTURADOS
suma DWORD 0                            ; SUMA DE LOS NUMEROS CAPTURADOS

.code
main PROC

    ciclo:
        mov edx, OFFSET msjCaptura      ; MENSAJE DE CAPTURA
        call WriteString
        call ReadInt                    ; CAPTURAMOS EL NUMERO EN EAX

        cmp eax, 0                      ; COMPARAMOS EL NUMERO CON 0
        je fin                          ; SI EAX = 0 SE CUMPLE LA CONDICION DE SALIDA, BRINCA A FIN

        add suma, eax                   ; SUMAMOS EL NUMERO AL ACUMULADO
        inc contador                    ; UN NUMERO MAS CAPTURADO

        mov edx, OFFSET msjNumero       ; MENSAJE DEL NUMERO CAPTURADO
        call WriteString
        call WriteInt                   ; IMPRIMIR EL NUMERO QUE SIGUE EN EAX
        call Crlf
        call Crlf

        jmp ciclo                       ; REGRESA A ETIQUETA CICLO

    fin:
        call Crlf
        mov edx, OFFSET msjCantidad     ; MENSAJE DE CANTIDAD
        call WriteString
        mov eax, contador               ; EAX = CANTIDAD DE NUMEROS
        call WriteDec                   ; IMPRIMIR LA CANTIDAD
        call Crlf

        mov edx, OFFSET msjSuma         ; MENSAJE DE LA SUMA
        call WriteString
        mov eax, suma                   ; EAX = SUMA DE LOS NUMEROS
        call WriteInt                   ; IMPRIMIR LA SUMA CON SIGNO
        call Crlf

        exit                            ; TERMINA EL PROGRAMA
main ENDP
END main
