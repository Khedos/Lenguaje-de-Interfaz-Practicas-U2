; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Decimal cadena
; Descripción: Convierte números DWORD a cadenas de caracteres usando divisiones entre 10 y la pila, y los muestra con WriteString.

INCLUDE Irvine32.inc

.data
numeros       DWORD 125, 0, 7, 2026, 4294967295   ; NUMEROS DE PRUEBA
totalNumeros  = LENGTHOF numeros                  ; CANTIDAD DE NUMEROS EN EL ARREGLO

bufferDecimal BYTE 11 DUP(0)    ; 10 DIGITOS MAXIMO (4294967295) + 00h

msgTitulo     BYTE "Conversion de numero decimal a cadena", 0
msgCadena     BYTE "Cadena obtenida: ", 0

.code
main PROC
    mov  edx, OFFSET msgTitulo   ; MENSAJE DE TITULO
    call WriteString
    call Crlf
    call Crlf

    mov  edi, 0                  ; INDICE DEL ARREGLO DE NUMEROS
    mov  ecx, totalNumeros       ; CANTIDAD DE NUMEROS A CONVERTIR

siguienteNumero:
    mov  eax, numeros[edi]       ; EAX = NUMERO A CONVERTIR
    call convertirDecimal        ; EL RESULTADO QUEDA EN bufferDecimal

    mov  edx, OFFSET msgCadena   ; MENSAJE DEL RESULTADO
    call WriteString
    mov  edx, OFFSET bufferDecimal
    call WriteString             ; IMPRIMIR LA CADENA (SIN WriteDec)
    call Crlf

    add  edi, TYPE numeros       ; AVANZAR AL SIGUIENTE DWORD
    loop siguienteNumero         ; REPETIR CON EL SIGUIENTE NUMERO

    call Crlf
    call WaitMsg                 ; ESPERAR A QUE SE PRESIONE UNA TECLA
    exit
main ENDP

;----------------------------------------------------------
; RECIBE EL NUMERO EN EAX Y DEJA LA CADENA EN bufferDecimal
;----------------------------------------------------------
convertirDecimal PROC
    push eax                     ; GUARDAMOS LOS REGISTROS QUE VAMOS A USAR
    push ebx
    push ecx
    push edx
    push esi

    mov  ebx, 10                 ; DIVISOR
    mov  ecx, 0                  ; CONTADOR DE DIGITOS

    ; ---- EXTRAER DIGITOS ----
extraerDigitos:
    mov  edx, 0                  ; EDX = 0 (EDX:EAX ES EL DIVIDENDO)
    div  ebx                     ; EAX = COCIENTE, EDX = RESIDUO
    push edx                     ; GUARDAMOS EL RESIDUO (DIGITO) EN LA PILA
    inc  ecx                     ; UN DIGITO MAS
    cmp  eax, 0
    jne  extraerDigitos          ; SI EL COCIENTE NO ES 0 SEGUIMOS DIVIDIENDO

    ; ---- CONSTRUIR CADENA ----
    mov  esi, 0                  ; ESI = 0, PRIMERA POSICION DEL BUFFER
construirCadena:
    pop  edx                     ; SACAMOS EL DIGITO DE MAYOR VALOR
    add  dl, '0'                 ; CONVERTIR EL DIGITO A CARACTER ASCII
    mov  bufferDecimal[esi], dl  ; GUARDAMOS EL CARACTER EN EL BUFFER
    inc  esi                     ; SIGUIENTE POSICION
    loop construirCadena         ; MIENTRAS QUEDEN DIGITOS

    mov  bufferDecimal[esi], 0   ; AGREGAR TERMINADOR NULO 00h

    pop  esi                     ; RESTAURAMOS LOS REGISTROS EN ORDEN INVERSO
    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
    ret
convertirDecimal ENDP

END main