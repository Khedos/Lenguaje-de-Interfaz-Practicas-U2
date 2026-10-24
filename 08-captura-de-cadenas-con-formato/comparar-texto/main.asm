; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Comparar texto
; Descripción: Captura una cadena y valida que tenga el formato de 3 letras mayúsculas, un guion y dígitos (AAA-123).

INCLUDE Irvine32.inc

.data
mensaje BYTE "Ingrese una cadena: ", 0  ; MENSAJE PARA PEDIR LA CADENA
texto BYTE "TEC-123"                    ; EJEMPLO DEL FORMATO A VALIDAR
entrada BYTE 30 DUP(0)                  ; BUFFER DONDE SE GUARDA LA ENTRADA
msjValido BYTE "Formato valido", 0      ; MENSAJE CUANDO CUMPLE EL FORMATO
msjInvalido BYTE "Formato invalido", 0  ; MENSAJE CUANDO NO CUMPLE EL FORMATO

.code
main PROC
    mov esi, 0                          ; ESI = 0, PRIMERA POSICION DE LA CADENA
    mov edx, OFFSET mensaje             ; DIRECCION DEL MENSAJE
    call WriteString                    ; IMPRIMIR MENSAJE
    
    mov edx, OFFSET entrada             ; DIRECCION DEL BUFFER
    mov ecx, sizeof entrada             ; TAMANO MAXIMO DEL BUFFER
    call ReadString                     ; CAPTURAMOS LA CADENA, EAX = LONGITUD
    
    cmp eax, 7                          ; LA CADENA DEBE TENER 7 CARACTERES
    je ciclo                            ; SI LA LONGITUD ES 7 BRINCA A ETIQUETA CICLO
    jmp invalido                        ; SI NO, BRINCA A ETIQUETA INVALIDO

ciclo:
    cmp esi, 3                          ; EN LA POSICION 3 DEBE IR EL GUION
    je validarGuion                     ; SI ESI ES 3 BRINCA A ETIQUETA validarGuion
    mov al, entrada[esi]                ; CARGAMOS EL CARACTER ACTUAL DE LA ENTRADA
    cmp al, 'A'                         ; COMPARAMOS CON 'A'
    jb invalido                         ; SI ES MENOR A 'A' NO ES LETRA MAYUSCULA
    jmp validarLetra                    ; BRINCA A ETIQUETA validarLetra

validarLetra:
    cmp al, 'Z'                         ; COMPARAMOS CON 'Z'
    ja invalido                         ; SI ES MAYOR A 'Z' NO ES LETRA MAYUSCULA
    inc esi                             ; SIGUIENTE CARACTER
    jmp ciclo                           ; REGRESA A ETIQUETA CICLO

validarGuion:
    mov al, entrada[esi]                ; CARGAMOS EL CARACTER DE LA POSICION 3
    cmp al, '-'                         ; COMPARAMOS CON '-'
    je validarNum                       ; SI ES GUION BRINCA A ETIQUETA validarNum
    jmp invalido                        ; SI NO ES GUION BRINCA A INVALIDO
    
validarNum:
    inc esi                             ; SIGUIENTE CARACTER
    cmp esi, 7                          ; SI YA SE REVISARON LOS 7 CARACTERES
    je valido                           ; LA CADENA CUMPLE EL FORMATO, BRINCA A VALIDO
    mov al, entrada[esi]                ; CARGAMOS EL CARACTER ACTUAL
    cmp al, '0'                         ; COMPARAMOS CON '0'
    jb invalido                         ; SI ES MENOR A '0' NO ES DIGITO
    jmp validarNum2                     ; BRINCA A ETIQUETA validarNum2

validarNum2:
    cmp al, '9'                         ; COMPARAMOS CON '9'
    ja invalido                         ; SI ES MAYOR A '9' NO ES DIGITO
    jmp validarNum                      ; REGRESA A ETIQUETA validarNum

valido:
    mov edx, OFFSET msjValido           ; IMPRESION DE FORMATO VALIDO
    call WriteString                    ; IMPRIMIR MENSAJE
    call Crlf                           ; SALTO DE LINEA
    jmp fin                             ; BRINCA A ETIQUETA FIN

invalido:
    mov edx, OFFSET msjInvalido         ; IMPRESION DE FORMATO INVALIDO
    call WriteString                    ; IMPRIMIR MENSAJE
    call Crlf                           ; SALTO DE LINEA

fin:
    exit                                ; TERMINA EL PROGRAMA
main ENDP
END main
