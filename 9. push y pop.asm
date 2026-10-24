; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 9. push y pop

INCLUDE Irvine32.inc

.code

main PROC

    mov eax, 30

    call DumpRegs

    push eax 

    call DumpRegs
    nop

    ; bloque 2 orden LIFO

    mov eax, 10
    push eax

    mov eax, 20
    push eax 

    mov eax, 30
    push eax
    call DumpRegs
    nop

    pop eax
    pop ebx
    pop ecx
    call   DumpRegs
    nop
    exit 

main ENDP
END main