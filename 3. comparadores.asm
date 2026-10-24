; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 3. comparadores


INCLUDE Irvine32.inc 

.code
main PROC

    ; condicion 1: zero flag

    ;mov ebx, 1
    ;cmp ebx, 1
    ;call dumpregs

    mov EAX, 01h 
    cmp EAX, EBX
    call dumpRegs

    mov cl, 11111111b 
    cmp cl, cl 
    call dumpRegs

    ; condicion 2: sing flag

    MOV EAX, 0
    MOV EBX, 0

    MOV al, -5
    mov bl, 1
    cmp al, bl
    call dumpRegs

    ; condicion 3 carry flag 

    mov EAX, 0
    mov EBX, 0 

    mov al, 255 
    add al, 1
    call dumpRegs

    ; condii=cion 4 overflow flag

    mov EAX, 0 
    mov EBX, 0 

    mov al, -128
    mov bl, 1
    cmp al, bl 
    call dumpRegs

    ; condicion 5 test

    mov EAX, 0 
    mov EBX, 5 ; 00000101b
    TEST EAX, 1

    ; 00000101b
    ; 00000001b
    ; ==========
    ; 00000001b

    mov EAX, 0 
    mov al, 10000000b 
    TEST al, al

    call dumpRegs

main ENDP

END main