; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 13. Obtención de una cadena hexadecimal.


INCLUDE Irvine32.inc

.data

    numero DWORD 0DC43BA21h

    bufferHex BYTE 9 DUP(0)

    mensaje BYTE "Numero hexadecimal: ", 0

.code

main PROC

    mov eax, numero

    mov esi, 7

    mov ecx, 8

convertir:

    ; guardar temporalmente el numero
    mov ebx, eax

    ; extraer los ultimos 4 bits
    and ebx, 0000000Fh

    ; convertir a caracter ascii
    cmp bl, 9
    jbe esNumero

    ; si es de a hasta f
    add bl, 7

esNumero:

    add bl, '0'

    ; guardar en el buffer
    mov bufferHex[esi], bl

    ; desplazar 4 bits a la derecha
    shr eax, 4

    ; retroceder una posicion
    dec esi

    loop convertir

    ; agregar terminador nulo
    mov bufferHex[8], 0

    ; mostrar resultado
    mov edx, OFFSET mensaje
    call WriteString

    mov edx, OFFSET bufferHex
    call WriteString

    call Crlf

    exit

main ENDP

END main