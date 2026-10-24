; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 11. operaciones logicas

INCLUDE Irvine32.inc

.code

main PROC

    ; 0 - encendido
    ; 1 - alarma
    ; 2 - conectada
    ; estado inicial 00000101

    ; 1 - and - extraer el estado de encendido

    mov eax, 0
    mov ebx, 0
    mov al, 00000101b
    mov bl, al
    and bl, 00000001b
    call DumpRegs
    nop

    ; 2 - or - encender alarma

    mov eax, 0
    mov al, 00000101b
    or al, 00000010b
    call DumpRegs
    nop

    ; 3 - xor - desconectar y conectar

    mov eax, 0
    mov al, 00000101b
    xor al, 00000100b
    call DumpRegs
    nop

    ; volver a conectar

    xor al, 00000100b
    call DumpRegs
    nop

    ; 4 - not - devolver estados

    mov eax, 0
    mov al, 00000101b
    not al
    call DumpRegs
    nop

    ; 5 - test - evaluar alarma y realizar salto

    mov eax, 0
    mov al, 00000111b
    test al, 00000010b
    jnz alarma_encendida

    ; alarma apagada

    mov ebx, 0
    jmp fin

alarma_encendida:

    ; alarma encendida

    mov ebx, 1
    call DumpRegs
    nop

fin:

    exit

main ENDP
END main