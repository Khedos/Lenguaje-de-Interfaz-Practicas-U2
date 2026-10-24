; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Saltos condicionales
; Descripción: Captura dos números, los compara con CMP y usa saltos condicionales (JE, JG, JA, JB) y el salto incondicional JMP para decidir qué mensaje mostrar, primero como valores con signo y después sin signo.

INCLUDE Irvine32.inc

.data
msjPrimero BYTE "Ingrese el primer numero: ", 0
msjSegundo BYTE "Ingrese el segundo numero: ", 0
msjConSigno BYTE "Comparacion con signo (JE, JG): ", 0
msjSinSigno BYTE "Comparacion sin signo (JE, JA, JB): ", 0
msjIgual BYTE "los numeros son iguales", 0
msjMayor BYTE "el primero es mayor", 0
msjMenor BYTE "el primero es menor", 0

numero1 DWORD ?
numero2 DWORD ?

.code
main PROC
    mov edx, OFFSET msjPrimero          ; MENSAJE DEL PRIMER NUMERO
    call WriteString
    call ReadInt                        ; CAPTURAMOS EL PRIMER NUMERO EN EAX
    mov numero1, eax                    ; GUARDAMOS EL PRIMER NUMERO

    mov edx, OFFSET msjSegundo          ; MENSAJE DEL SEGUNDO NUMERO
    call WriteString
    call ReadInt                        ; CAPTURAMOS EL SEGUNDO NUMERO EN EAX
    mov numero2, eax                    ; GUARDAMOS EL SEGUNDO NUMERO
    call Crlf

    ; ---- COMPARACION CON SIGNO ----
    mov edx, OFFSET msjConSigno         ; MENSAJE DE COMPARACION CON SIGNO
    call WriteString

    mov eax, numero1                    ; EAX = PRIMER NUMERO
    mov ebx, numero2                    ; EBX = SEGUNDO NUMERO
    cmp eax, ebx                        ; COMPARAMOS EAX CON EBX, SE ACTUALIZAN LAS BANDERAS
    je igualSigno                       ; SI ZF = 1 LOS NUMEROS SON IGUALES, BRINCA A igualSigno
    jg mayorSigno                       ; SI EAX ES MAYOR (CON SIGNO) BRINCA A mayorSigno

    mov edx, OFFSET msjMenor            ; SI NO BRINCO, EL PRIMERO ES MENOR
    call WriteString
    jmp sinSigno                        ; SALTO INCONDICIONAL A LA SIGUIENTE COMPARACION

    igualSigno:
        mov edx, OFFSET msjIgual        ; IMPRESION DE NUMEROS IGUALES
        call WriteString
        jmp sinSigno                    ; SALTO INCONDICIONAL A LA SIGUIENTE COMPARACION

    mayorSigno:
        mov edx, OFFSET msjMayor        ; IMPRESION DE PRIMERO MAYOR
        call WriteString

    ; ---- COMPARACION SIN SIGNO ----
    sinSigno:
        call Crlf
        mov edx, OFFSET msjSinSigno     ; MENSAJE DE COMPARACION SIN SIGNO
        call WriteString

        mov eax, numero1                ; EAX = PRIMER NUMERO
        mov ebx, numero2                ; EBX = SEGUNDO NUMERO
        cmp eax, ebx                    ; COMPARAMOS OTRA VEZ, AHORA SE INTERPRETA CON CF Y ZF
        je igualSinSigno                ; SI ZF = 1 LOS NUMEROS SON IGUALES
        ja mayorSinSigno                ; SI EAX ESTA ARRIBA (SIN SIGNO) BRINCA A mayorSinSigno
        jb menorSinSigno                ; SI EAX ESTA ABAJO (SIN SIGNO) BRINCA A menorSinSigno

    igualSinSigno:
        mov edx, OFFSET msjIgual        ; IMPRESION DE NUMEROS IGUALES
        call WriteString
        jmp fin                         ; BRINCA A ETIQUETA FIN

    mayorSinSigno:
        mov edx, OFFSET msjMayor        ; IMPRESION DE PRIMERO MAYOR
        call WriteString
        jmp fin                         ; BRINCA A ETIQUETA FIN

    menorSinSigno:
        mov edx, OFFSET msjMenor        ; IMPRESION DE PRIMERO MENOR
        call WriteString

    fin:
        call Crlf
        exit                            ; TERMINA EL PROGRAMA
main ENDP
END main
