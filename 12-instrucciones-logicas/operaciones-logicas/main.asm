; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Operaciones logicas
; Descripción: Aplica las instrucciones lógicas AND, OR, XOR, NOT y TEST sobre valores binarios y muestra los registros.

INCLUDE Irvine32.inc

.data
mensaje BYTE "Hola mundo", 0        ; MENSAJE DE PRUEBA

.code
main PROC
    mov eax, 0                      ; LIMPIAMOS EAX
    mov ebx, 0                      ; LIMPIAMOS EBX

    mov al, 00000101b               ; AL = 00000101b
    mov bl, al                      ; COPIAMOS AL EN BL
    and bl, 00000001b               ; AND CON 00000001b, SOLO SE CONSERVA EL BIT 0 (BL = 00000001b)

    call dumpregs                   ; MOSTRAR LOS REGISTROS
    
    mov al, 00000101b               ; AL = 00000101b
    or al,  00000010b               ; OR CON 00000010b, SE ENCIENDE EL BIT 1 (AL = 00000111b)

    call dumpregs                   ; MOSTRAR LOS REGISTROS

    mov al, 00000101b               ; AL = 00000101b
    xor al, 00000010b               ; XOR CON 00000010b, SE INVIERTE EL BIT 1 (AL = 00000111b)

    call dumpregs                   ; MOSTRAR LOS REGISTROS

    not al                          ; NOT INVIERTE TODOS LOS BITS (AL = 11111000b)
    not al                          ; SE INVIERTEN OTRA VEZ, AL REGRESA A 00000111b

    call dumpregs                   ; MOSTRAR LOS REGISTROS

   test al, 00000010b               ; TEST HACE UN AND SIN GUARDAR EL RESULTADO, SOLO MODIFICA LAS BANDERAS


    exit                            ; TERMINA EL PROGRAMA
main ENDP
END main