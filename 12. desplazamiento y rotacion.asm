; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 12. desplazamiento y rotacion

INCLUDE Irvine32.inc

.code 

main PROC

    mov eax, 0
    mov ebx, 0
    mov ecx, 0 
    mov edx, 0 

    ; 1 - shl - desplazar una posicion a la izquierda.

    mov al, 00000001b
    shl al, 1

    call DumpRegs
    call WriteBin
    call Crlf

    ; 2 - shr - desplazar una posicion a la derecha.

    mov al, 00001101b
    shr al, 1

    call DumpRegs
    call WriteBin
    call Crlf


    ; 3 - sar - conservar el signo.

    mov al, -8
    sar al, 1

    call DumpRegs
    call WriteBin
    call Crlf

    ; 4 - sar - con operaciones no exactas.

    mov al, -9
    sar al, 1 

    call DumpRegs
    call WriteBin
    call Crlf

    ; 5 - conteo - desplazar 2 posiciones hacia la izquierda.

    mov al, 00001111b 
    shl al, 2

    call DumpRegs
    call WriteBin
    call Crlf

    ; 6 - conteo - desplazar 2 posiciones hacia la derecha.

    mov al, 00001111b 
    mov cl, 2
    shr al, cl

    call DumpRegs
    call WriteBin
    call Crlf

    ; 7 - ror, rol, rcl, rcr

    exit

main ENDP

END main