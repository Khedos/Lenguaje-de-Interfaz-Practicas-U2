; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Ejercicio estacionamiento
; Descripción: Simula un estacionamiento con capacidad de 3 lugares: permite la entrada y salida de coches y muestra los espacios disponibles.

INCLUDE Irvine32.inc

.data
msjIngreso BYTE "Bienvenido, ingrese el estado de coche(1 para entrar, 2 para salir): ", 0 ; MENSAJE PARA ELEGIR ENTRADA O SALIDA
msjEspaciosDisponibes BYTE "Espacios disponibles: ", 0 ; MENSAJE DE ESPACIOS DISPONIBLES
msjSinEspacio BYTE "Acceso denegado", 0     ; MENSAJE CUANDO NO HAY LUGAR
msjAcceso BYTE "Acceso permitido", 0        ; MENSAJE CUANDO SI HAY LUGAR

capacidad = 3                               ; CAPACIDAD DEL ESTACIONAMIENTO

.code
main PROC

    mov ebx, capacidad ; CAPACIDAD
    intentar:
        
        mov edx, OFFSET msjEspaciosDisponibes ; MENSAJE ESPACIOS DISPONIBLES
        call WriteString                    ; IMPRIMIR MENSAJE

        mov eax, ebx ; IMRPIMIR ESPACIOS DISPONIBLES
        call WriteDec                       ; IMPRIMIR EN DECIMAL
        call Crlf                           ; SALTO DE LINEA

        mov edx, OFFSET msjIngreso ; MENSAJE DE INGRESO
        call WriteString                    ; IMPRIMIR MENSAJE
        call ReadInt                        ; CAPTURAMOS LA OPCION EN EAX

        cmp eax, 1                          ; COMPARAMOS LA OPCION CON 1
        je acceso       ;SI LA OPCION ES 1 BRINCA A ETIQUETA ACCESO
        jmp salida       ;SI LA OPCION ES 2 BRINCA A ETIQUETA SALIDA

    acceso: 
        cmp ebx, 1                          ; COMPARAMOS LA CAPACIDAD CON 1
        jl accesoDenegado       ;SI LA CAPACIDAD ES MENOR A 1 BRINCA A ACCESO DENEGADO

        
        mov edx, OFFSET msjAcceso  ;IMPRESION DE MENSAJE ACCESO
        call WriteString                    ; IMPRIMIR MENSAJE
        call Crlf
        call Crlf

        dec ebx                 ;DECRENTAMOS LA CAPACIDAD
        jmp intentar                        ; REGRESA A ETIQUETA INTENTAR

    salida:
      inc ebx; INCREMENTAMOS LA CAPACIDAD

      cmp ebx, capacidad ; SI EBX ES MAYOR A LA CAPACIDAD EL ESTACIONAMIENTO ESTARIA VACIO POR LO QUE NO PUEDE SALIR UN LUGAR QUE NO SE TIENE. EL PROGRAMA ACABA
      jg  fin                               ; SI EBX ES MAYOR A LA CAPACIDAD BRINCA A ETIQUETA FIN

      call Crlf                             ; SALTO DE LINEA
      jmp intentar                          ; REGRESA A ETIQUETA INTENTAR
       
    accesoDenegado:     
        mov edx, OFFSET msjSinEspacio   ;IMPRESION DE ACCESO DENEGADO
        call WriteString                    ; IMPRIMIR MENSAJE
        call Crlf
        call Crlf

        jmp intentar                        ; REGRESA A ETIQUETA INTENTAR
     
    fin:
        exit                                ; TERMINA EL PROGRAMA
main ENDP
END main
