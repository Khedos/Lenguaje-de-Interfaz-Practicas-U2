# Lenguaje de Interfaz - Practicas U2

Prácticas de la Unidad 2 de Lenguajes de Interfaz, desarrolladas en ensamblador x86 de 32 bits (MASM) con la biblioteca Irvine32.

## Datos generales

| | |
|---|---|
| **Materia** | Lenguajes de Interfaz |
| **Unidad** | Unidad 2 — Programación básica |
| **Alumno** | Luciano Ivan Villa Zuñiga |
| **Horario** | 8:00 am - 9:00 am |
| **Docente** | Dr. José Luis Medina Jiménez |
| **Institución** | Instituto Tecnológico de Culiacán — Ingeniería en Sistemas Computacionales |

## Índice de prácticas

| Subtema | Práctica | Descripción | Código |
|---|---|---|---|
| 2.2 Ciclos numéricos | Ciclo while | Imprime los números del 1 al 10 usando un ciclo while. | [main.asm](02-ciclos-numericos/ciclo-while/main.asm) |
| 2.2 Ciclos numéricos | Ciclo do while | Imprime los números del 10 al 100 usando un ciclo do-while. | [main.asm](02-ciclos-numericos/ciclo-do-while/main.asm) |
| 2.3 Captura básica de cadenas | Leer dato consola | Pide el nombre del usuario, lo captura con ReadString y lo muestra en la consola. | [main.asm](03-captura-basica-de-cadenas/leer-dato-consola/main.asm) |
| 2.3 Captura básica de cadenas | Mostrar longitud captura | Captura el nombre del usuario y muestra cuántos caracteres tiene. | [main.asm](03-captura-basica-de-cadenas/mostrar-longitud-captura/main.asm) |
| 2.4 Comparación y prueba | Comparacion cmp test | Compara valores con CMP y examina bits con TEST, mostrando cómo cambian las banderas de EFLAGS sin modificar los operandos; al final indica si un número capturado es par o impar. | [main.asm](04-comparacion-y-prueba/comparacion-cmp-test/main.asm) |
| 2.5 Saltos | Saltos condicionales | Captura dos números, los compara con CMP y usa saltos condicionales (JE, JG, JA, JB) y el salto incondicional JMP para decidir qué mensaje mostrar, primero como valores con signo y después sin signo. | [main.asm](05-saltos/saltos-condicionales/main.asm) |
| 2.6 Ciclos condicionales | Repetir hasta cero | Ciclo condicional que pide números al usuario y los muestra hasta que se introduce 0; al terminar muestra cuántos números se capturaron y su suma. | [main.asm](06-ciclos-condicionales/repetir-hasta-cero/main.asm) |
| 2.7 Incremento y decremento | Ejercicio estacionamiento | Simula un estacionamiento con capacidad de 3 lugares: permite la entrada y salida de coches y muestra los espacios disponibles. | [main.asm](07-incremento-y-decremento/ejercicio-estacionamiento/main.asm) |
| 2.8 Captura de cadenas con formato | Comparar texto | Captura una cadena y valida que tenga el formato de 3 letras mayúsculas, un guion y dígitos (AAA-123). | [main.asm](08-captura-de-cadenas-con-formato/comparar-texto/main.asm) |
| 2.9 Instrucciones aritméticas | Operaciones aritmeticas | Realiza multiplicaciones y divisiones con y sin signo usando MUL, IMUL, DIV e IDIV. | [main.asm](09-instrucciones-aritmeticas/operaciones-aritmeticas/main.asm) |
| 2.10 Manipulación de la pila | Push pop | Guarda un valor en la pila con PUSH y lo recupera con POP. | [main.asm](10-manipulacion-de-la-pila/push-pop/main.asm) |
| 2.11 Obtención de cadena con representación decimal | Decimal cadena | Convierte números DWORD a cadenas de caracteres usando divisiones entre 10 y la pila, y los muestra con WriteString. | [main.asm](11-cadena-representacion-decimal/decimal-cadena/main.asm) |
| 2.12 Instrucciones lógicas | Operaciones logicas | Aplica las instrucciones lógicas AND, OR, XOR, NOT y TEST sobre valores binarios y muestra los registros. | [main.asm](12-instrucciones-logicas/operaciones-logicas/main.asm) |
| 2.13 Desplazamiento y rotación | Desplazamiento rotacion | Muestra el uso de las instrucciones de desplazamiento (SHL, SHR, SAR) y de rotación (ROR, ROL, RCL, RCR) sobre valores binarios. | [main.asm](13-desplazamiento-y-rotacion/desplazamiento-rotacion/main.asm) |
| 2.14 Obtención de cadena con representación hexadecimal | Hexadecimal cadena | Convierte un número de 32 bits a una cadena con su representación hexadecimal y la muestra en la consola. | [main.asm](14-cadena-representacion-hexadecimal/hexadecimal-cadena/main.asm) |
| 2.15 Captura y almacenamiento de datos numéricos | Cadena decimal | Captura un número como cadena, valida que solo tenga dígitos y que quepa en 32 bits, lo convierte a número y lo muestra. | [main.asm](15-captura-de-datos-numericos/cadena-decimal/main.asm) |
| 2.16 Operaciones básicas sobre archivos de disco | Manipulacion archivos | Crea el archivo inventario.txt, escribe en él el texto "125" y muestra si se guardó correctamente. | [main.asm](16-archivos-de-disco/manipulacion-archivos/main.asm) |

## Requisitos

- Visual Studio 2022 con las herramientas de C++ y MASM habilitadas.
- Biblioteca Irvine32 instalada en `C:\Irvine`.
