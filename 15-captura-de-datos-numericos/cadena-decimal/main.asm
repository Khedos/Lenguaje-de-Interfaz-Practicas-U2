; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Cadena decimal
; Descripción: Captura un número como cadena, valida que solo tenga dígitos y que quepa en 32 bits, lo convierte a número y lo muestra.

INCLUDE Irvine32.inc

.data
msjCaptura BYTE "Ingrese un numero (0 a 4294967295): ", 0
msjFormato BYTE "Error: solo se permiten digitos del 0 al 9", 0
msjRango BYTE "Error: el numero no cabe en 32 bits", 0
msjResultado BYTE "Numero almacenado: ", 0

bufferEntrada BYTE 12 DUP(0)        ; BUFFER DONDE ReadString GUARDA LA CADENA
longitud DWORD ?                    ; CANTIDAD DE CARACTERES CAPTURADOS
numero DWORD ?                      ; AQUI SE GUARDA EL NUMERO YA CONVERTIDO

bufferDecimal BYTE 11 DUP(0)        ; BUFFER PARA MOSTRAR EL NUMERO (10 DIGITOS + 00h)

.code
main PROC

    capturar:
        mov edx, OFFSET msjCaptura      ; MENSAJE DE CAPTURA
        call WriteString

        mov edx, OFFSET bufferEntrada   ; DIRECCION DEL BUFFER
        mov ecx, SIZEOF bufferEntrada   ; TAMANO MAXIMO DEL BUFFER
        call ReadString                 ; EAX = LONGITUD DE LA CADENA
        mov longitud, eax

        cmp eax, 0
        je errorFormato                 ; SI LA ENTRADA ESTA VACIA BRINCA A ERROR DE FORMATO

        cmp eax, 10
        ja errorRango                   ; SI TIENE MAS DE 10 DIGITOS NO CABE EN UN DWORD

    ; ---- VALIDAR QUE TODOS LOS CARACTERES SEAN DIGITOS ----
        mov esi, 0                      ; ESI = PRIMERA POSICION DE LA CADENA
        mov ecx, longitud               ; RECORREMOS TODOS LOS CARACTERES

    validar:
        mov al, bufferEntrada[esi]      ; CARGAMOS EL CARACTER ACTUAL
        cmp al, '0'
        jb errorFormato                 ; SI ES MENOR A '0' NO ES DIGITO
        cmp al, '9'
        ja errorFormato                 ; SI ES MAYOR A '9' NO ES DIGITO
        inc esi                         ; SIGUIENTE CARACTER
        loop validar

    ; ---- CONVERTIR LA CADENA A NUMERO ----
        mov eax, 0                      ; ACUMULADO = 0
        mov esi, 0                      ; EMPEZAMOS DE IZQUIERDA A DERECHA
        mov ecx, longitud

    convertir:
        mov ebx, 10
        mul ebx                         ; ACUMULADO = ACUMULADO * 10 (RESULTADO EN EDX:EAX)
        jc errorRango                   ; SI EL RESULTADO NO CABE EN EAX ESTA FUERA DE RANGO

        movzx ebx, bufferEntrada[esi]   ; CARGAMOS EL CARACTER EN EBX
        sub ebx, '0'                    ; RESTAR '0' PARA OBTENER EL VALOR DE 0 A 9
        add eax, ebx                    ; ACUMULADO = ACUMULADO + DIGITO
        jc errorRango                   ; SI HAY ACARREO EL NUMERO PASO DE 4294967295

        inc esi                         ; SIGUIENTE DIGITO
        loop convertir

        mov numero, eax                 ; GUARDAMOS EL NUMERO EN LA VARIABLE DWORD
        jmp mostrar

    errorFormato:
        mov edx, OFFSET msjFormato      ; IMPRESION DE ERROR DE FORMATO
        call WriteString
        call Crlf
        call Crlf
        jmp capturar                    ; SE VUELVE A PEDIR EL NUMERO

    errorRango:
        mov edx, OFFSET msjRango        ; IMPRESION DE ERROR DE RANGO
        call WriteString
        call Crlf
        call Crlf
        jmp capturar                    ; SE VUELVE A PEDIR EL NUMERO

    mostrar:
        mov edx, OFFSET msjResultado    ; MENSAJE DEL RESULTADO
        call WriteString

        mov eax, numero                 ; EAX = NUMERO GUARDADO
        call convertirDecimal           ; LO REGRESAMOS A CADENA PARA MOSTRARLO SIN WriteDec
        mov edx, OFFSET bufferDecimal
        call WriteString
        call Crlf

    fin:
        exit
main ENDP

;----------------------------------------------------------
; RECIBE EL NUMERO EN EAX Y DEJA LA CADENA EN bufferDecimal
;----------------------------------------------------------
convertirDecimal PROC
    push eax                        ; GUARDAMOS LOS REGISTROS QUE VAMOS A USAR
    push ebx
    push ecx
    push edx
    push esi

    mov ebx, 10                     ; DIVISOR
    mov ecx, 0                      ; CONTADOR DE DIGITOS

    extraerDigitos:
        mov edx, 0                  ; EDX = 0 ANTES DE DIVIDIR
        div ebx                     ; EAX = COCIENTE, EDX = RESIDUO
        push edx                    ; GUARDAMOS EL RESIDUO EN LA PILA
        inc ecx                     ; UN DIGITO MAS
        cmp eax, 0
        jne extraerDigitos          ; SI EL COCIENTE NO ES 0 SEGUIMOS DIVIDIENDO

    mov esi, 0                      ; PRIMERA POSICION DEL BUFFER

    construirCadena:
        pop edx                     ; SACAMOS EL DIGITO DE MAYOR VALOR
        add dl, '0'                 ; CONVERTIMOS EL DIGITO A CARACTER ASCII
        mov bufferDecimal[esi], dl  ; GUARDAMOS EL CARACTER
        inc esi                     ; SIGUIENTE POSICION
        loop construirCadena        ; MIENTRAS QUEDEN DIGITOS

    mov bufferDecimal[esi], 0       ; TERMINADOR NULO

    pop esi                         ; RESTAURAMOS LOS REGISTROS EN ORDEN INVERSO
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
convertirDecimal ENDP

END main