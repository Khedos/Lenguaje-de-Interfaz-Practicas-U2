; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Mostrar longitud captura
; Descripción: Captura el nombre del usuario y muestra cuántos caracteres tiene.

INCLUDE Irvine32.inc

.data
mensaje BYTE "Escribe tu nombre: ", 0       ; MENSAJE PARA PEDIR EL NOMBRE
nombre BYTE 30 DUP(0)                       ; BUFFER DONDE SE GUARDA EL NOMBRE
mensajeLongitud BYTE "La longitud de tu nombre es: ", 0 ; MENSAJE DE LA LONGITUD
longitud DWORD ?                            ; AQUI SE GUARDA LA LONGITUD

.code
main PROC
    mov edx, OFFSET mensaje                 ; DIRECCION DEL MENSAJE
    call WriteString                        ; IMPRIMIR MENSAJE
    call Crlf                               ; SALTO DE LINEA

   mov edx, OFFSET nombre                   ; DIRECCION DEL BUFFER
   mov ecx, sizeof nombre                   ; TAMANO MAXIMO DEL BUFFER
   call ReadString                          ; CAPTURAMOS EL NOMBRE, EAX = LONGITUD

   mov longitud, eax                        ; GUARDAMOS LA LONGITUD
   call Crlf                                ; SALTO DE LINEA

   mov edx, OFFSET mensajeLongitud          ; DIRECCION DEL MENSAJE DE LONGITUD
   call WriteString                         ; IMPRIMIR MENSAJE

   mov eax, longitud                        ; EAX = LONGITUD PARA IMPRIMIRLA
   call WriteDec                            ; IMPRIMIR EN DECIMAL EL VALOR DE EAX
   call Crlf                                ; SALTO DE LINEA
   exit                                     ; TERMINA EL PROGRAMA
main ENDP
END main
