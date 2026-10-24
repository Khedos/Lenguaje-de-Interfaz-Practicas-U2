; Materia: Lenguajes de Interfaz
; Alumno: Luciano Ivan Villa Zuñiga
; Horario: 8:00 am - 9:00 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Manipulacion archivos
; Descripción: Crea el archivo inventario.txt, escribe en él el texto "125" y muestra si se guardó correctamente.

INCLUDE Irvine32.inc

.data
nombreArchivo BYTE "inventario.txt", 0      ; NOMBRE DEL ARCHIVO A CREAR
texto BYTE "125",0                          ; TEXTO QUE SE VA A ESCRIBIR EN EL ARCHIVO
archivoHandle DWORD ?                       ; AQUI SE GUARDA EL HANDLE DEL ARCHIVO

mensajeEscrito BYTE "Archivo guardado", 0   ; MENSAJE CUANDO SE GUARDA EL ARCHIVO
mensajeError BYTE "Archivo no guardado", 0  ; MENSAJE CUANDO HAY ERROR

.code
main PROC
		mov edx, OFFSET nombreArchivo       ; DIRECCION DEL NOMBRE DEL ARCHIVO
		call CreateOutputFile               ; CREA EL ARCHIVO, EAX = HANDLE

		cmp eax, INVALID_HANDLE_VALUE       ; COMPARAMOS EL HANDLE CON EL VALOR INVALIDO
		je error                            ; SI EL HANDLE ES INVALIDO BRINCA A ETIQUETA ERROR

		mov archivoHandle, eax              ; GUARDAMOS EL HANDLE

		mov eax, archivoHandle              ; EAX = HANDLE DEL ARCHIVO
		mov edx, OFFSET texto               ; DIRECCION DEL TEXTO A ESCRIBIR

		mov ecx, SIZEOF texto - 1           ; CANTIDAD DE BYTES A ESCRIBIR (SIN EL 0 FINAL)
		call WriteToFile                    ; ESCRIBE EN EL ARCHIVO, EAX = BYTES ESCRITOS

		cmp eax, 0                          ; SI EAX ES 0 NO SE ESCRIBIO NADA
		je errorEscritura                   ; SI HUBO ERROR AL ESCRIBIR BRINCA A ETIQUETA errorEscritura

		cmp eax, SIZEOF texto - 1           ; COMPARAMOS LOS BYTES ESCRITOS CON LOS ESPERADOS
		jne errorEscritura                  ; SI NO SE ESCRIBIERON TODOS LOS BYTES BRINCA A ERROR DE ESCRITURA

		mov eax, archivoHandle              ; EAX = HANDLE DEL ARCHIVO
		call CloseFile                      ; CERRAMOS EL ARCHIVO

		test eax, eax                       ; REVISAMOS SI EAX ES 0
		jz error                            ; SI EAX ES 0 NO SE PUDO CERRAR, BRINCA A ETIQUETA ERROR

		mov edx, OFFSET mensajeEscrito      ; IMPRESION DE MENSAJE ARCHIVO GUARDADO
		call WriteString                    ; IMPRIMIR MENSAJE
		jmp fin                             ; BRINCA A ETIQUETA FIN
		exit

	errorEscritura:
		mov eax, archivoHandle              ; EAX = HANDLE DEL ARCHIVO
		call CloseFile                      ; CERRAMOS EL ARCHIVO ANTES DE MOSTRAR EL ERROR

	error:
		mov edx, OFFSET mensajeError        ; IMPRESION DE MENSAJE DE ERROR
		call WriteString                    ; IMPRIMIR MENSAJE

	fin:
		exit                                ; TERMINA EL PROGRAMA
main ENDP
END main
