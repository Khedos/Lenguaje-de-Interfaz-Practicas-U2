; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Push pop
; Descripción: Guarda un valor en la pila con PUSH y lo recupera con POP.

INCLUDE Irvine32.inc

.data
mensaje BYTE "Hola mundo", 0        ; MENSAJE DE PRUEBA

.code
main PROC
    mov eax, 20                     ; EAX = 20
    push eax                        ; GUARDAMOS EAX EN LA PILA (ESP DISMINUYE 4 BYTES)
    
    pop eax                         ; RECUPERAMOS EL VALOR DE LA CIMA EN EAX (ESP AUMENTA 4 BYTES)


    exit                            ; TERMINA EL PROGRAMA
main ENDP
END main
