; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Leer dato consola
; Descripción: Pide el nombre del usuario, lo captura con ReadString y lo muestra en la consola.

INCLUDE Irvine32.inc

.data
mensaje BYTE "Escribe tu nombre", 0  ; MENSAJE PARA PEDIR EL NOMBRE
nombre BYTE 15 DUP(0)                ; BUFFER DONDE SE GUARDA EL NOMBRE

.code
main PROC
    mov edx, OFFSET mensaje          ; DIRECCION DEL MENSAJE
    call WriteString                 ; IMPRIMIR MENSAJE
    call Crlf                        ; SALTO DE LINEA

    mov edx, OFFSET nombre           ; DIRECCION DEL BUFFER
    mov ecx, sizeof nombre           ; TAMANO MAXIMO DEL BUFFER
    call ReadString                  ; CAPTURAMOS EL NOMBRE
    call Crlf                        ; SALTO DE LINEA

    mov edx, OFFSET nombre           ; DIRECCION DEL NOMBRE CAPTURADO
    call WriteString                 ; IMPRIMIR EL NOMBRE
    call Crlf                        ; SALTO DE LINEA

    exit                             ; TERMINA EL PROGRAMA
main ENDP
END main
