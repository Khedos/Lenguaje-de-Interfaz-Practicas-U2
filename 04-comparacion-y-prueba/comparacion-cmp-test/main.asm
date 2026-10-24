; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Comparacion cmp test
; Descripción: Compara valores con CMP y examina bits con TEST, mostrando cómo cambian las banderas de EFLAGS sin modificar los operandos; al final indica si un número capturado es par o impar.

INCLUDE Irvine32.inc

.data
msjIguales BYTE "CMP EAX, EBX con valores iguales (ZF = 1):", 0
msjMenor BYTE "CMP EAX, EBX con EAX = 5 y EBX = 8 (CF = 1, SF = 1):", 0
msjBitUno BYTE "TEST EAX, 1 con EAX = 1, el bit 0 esta encendido (ZF = 0):", 0
msjBitCero BYTE "TEST EAX, 1 con EAX = 4, el bit 0 esta apagado (ZF = 1):", 0
msjCaptura BYTE "Ingrese un numero: ", 0
msjPar BYTE "El numero es par", 0
msjImpar BYTE "El numero es impar", 0

.code
main PROC

    ; ---- CMP CON VALORES IGUALES ----
    mov edx, OFFSET msjIguales          ; MENSAJE DE LA PRIMERA COMPARACION
    call WriteString
    call Crlf
    mov eax, 12345678h                  ; EAX = 12345678h
    mov ebx, 12345678h                  ; EBX = 12345678h
    cmp eax, ebx                        ; RESTA EAX - EBX SIN GUARDAR EL RESULTADO, COMO DA 0 ZF = 1
    call DumpRegs                       ; MOSTRAR REGISTROS, EAX Y EBX NO CAMBIAN

    ; ---- CMP CON EAX MENOR A EBX ----
    mov edx, OFFSET msjMenor            ; MENSAJE DE LA SEGUNDA COMPARACION
    call WriteString
    call Crlf
    mov eax, 5                          ; EAX = 5
    mov ebx, 8                          ; EBX = 8
    cmp eax, ebx                        ; 5 - 8 DA NEGATIVO, SE ACTIVAN CF Y SF, ZF = 0
    call DumpRegs                       ; MOSTRAR REGISTROS

    ; ---- TEST CON EL BIT 0 ENCENDIDO ----
    mov edx, OFFSET msjBitUno           ; MENSAJE DEL PRIMER TEST
    call WriteString
    call Crlf
    mov eax, 1                          ; EAX = 00000001b
    test eax, 1                         ; AND ENTRE EAX Y 1 SIN GUARDAR EL RESULTADO, DA 1 POR LO QUE ZF = 0
    call DumpRegs                       ; MOSTRAR REGISTROS, EAX SIGUE VALIENDO 1

    ; ---- TEST CON EL BIT 0 APAGADO ----
    mov edx, OFFSET msjBitCero          ; MENSAJE DEL SEGUNDO TEST
    call WriteString
    call Crlf
    mov eax, 4                          ; EAX = 00000100b
    test eax, 1                         ; AND ENTRE EAX Y 1 DA 0, POR LO QUE ZF = 1
    call DumpRegs                       ; MOSTRAR REGISTROS, EAX SIGUE VALIENDO 4

    ; ---- USO PRACTICO DE TEST: PAR O IMPAR ----
    mov edx, OFFSET msjCaptura          ; MENSAJE DE CAPTURA
    call WriteString
    call ReadInt                        ; CAPTURAMOS EL NUMERO EN EAX

    test eax, 1                         ; REVISAMOS EL BIT 0 DEL NUMERO
    jz esPar                            ; SI ZF = 1 EL BIT 0 ES 0, EL NUMERO ES PAR

    mov edx, OFFSET msjImpar            ; IMPRESION DE NUMERO IMPAR
    call WriteString
    call Crlf
    jmp fin                             ; BRINCA A ETIQUETA FIN

    esPar:
        mov edx, OFFSET msjPar          ; IMPRESION DE NUMERO PAR
        call WriteString
        call Crlf

    fin:
        exit                            ; TERMINA EL PROGRAMA
main ENDP
END main
