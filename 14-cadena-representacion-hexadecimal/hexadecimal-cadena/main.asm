; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Hexadecimal cadena
; Descripción: Convierte un número de 32 bits a una cadena con su representación hexadecimal y la muestra en la consola.

INCLUDE Irvine32.inc

.data
numero DWORD 12AB34CDh              ; NUMERO A CONVERTIR
bufferHex BYTE 9 DUP(0)             ; 8 DIGITOS HEXADECIMALES + TERMINADOR NULO

msjNumero BYTE "Numero en hexadecimal (cadena): ", 0

.code
main PROC
    mov eax, numero                 ; EAX = NUMERO A CONVERTIR
    call convertirHex               ; CONVIERTE EAX Y LO GUARDA EN bufferHex

    mov edx, OFFSET msjNumero       ; MENSAJE DEL RESULTADO
    call WriteString

    mov edx, OFFSET bufferHex       ; IMPRIMIR LA CADENA HEXADECIMAL
    call WriteString
    call Crlf

    exit
main ENDP

;----------------------------------------------------------
; RECIBE EL NUMERO EN EAX Y DEJA LA CADENA EN bufferHex
;----------------------------------------------------------
convertirHex PROC
    push eax                        ; GUARDAMOS LOS REGISTROS QUE VAMOS A USAR
    push ecx
    push edx
    push esi

    mov esi, 7                      ; ESI COMIENZA EN LA ULTIMA POSICION DE LOS DIGITOS
    mov ecx, 8                      ; 8 DIGITOS HEXADECIMALES EN 32 BITS

    extraerDigito:
        mov edx, eax                ; COPIAMOS EL NUMERO PARA NO PERDERLO
        and edx, 0Fh                ; MASCARA 0Fh, NOS QUEDAMOS CON EL NIBBLE INFERIOR (0 A 15)

        cmp dl, 9
        ja esLetra                  ; SI EL VALOR ES MAYOR A 9 BRINCA A ETIQUETA esLetra

        add dl, '0'                 ; VALORES 0-9: SUMAR '0' PARA OBTENER '0' A '9'
        jmp guardarDigito

    esLetra:
        sub dl, 10                  ; VALORES 10-15: RESTAR 10
        add dl, 'A'                 ; Y SUMAR 'A' PARA OBTENER 'A' A 'F'

    guardarDigito:
        mov bufferHex[esi], dl      ; GUARDAMOS EL CARACTER EN EL BUFFER
        dec esi                     ; RETROCEDEMOS UNA POSICION (ESCRITURA DE 7 HASTA 0)
        shr eax, 4                  ; DESPLAZAMOS 4 BITS A LA DERECHA PARA EL SIGUIENTE DIGITO
        loop extraerDigito          ; REPETIR HASTA OBTENER LOS 8 DIGITOS

    mov bufferHex[8], 0             ; TERMINADOR NULO EN LA POSICION 8

    pop esi                         ; RESTAURAMOS LOS REGISTROS EN ORDEN INVERSO
    pop edx
    pop ecx
    pop eax
    ret
convertirHex ENDP

END main