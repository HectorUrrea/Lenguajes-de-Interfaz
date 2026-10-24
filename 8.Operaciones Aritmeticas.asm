; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 8. opreaciones aritmeticas

INCLUDE Irvine32.inc

.data

.code
main PROC

    ; 1. operaciones de suma y resta

    mov eax, 50
    mov ebx, 20

    add eax, ebx
    sub eax, 15
    call DumpRegs

    nop

    ; 2. cf: acarreo en una suma sin signo

    mov eax, 0
    mov al, 255
    add al, 1

    nop

    ; 3. of: condicion de desbordamiento

    mov eax, 0
    mov al, 127
    add al, 1

    nop

    ; 4. mul: multiplicacion dentro de 32 bits

    mov eax, 25
    mov ebx, 3

    mul ebx

    nop

    ; 5. mul: producto que necesita mas de 32 bits

    mov eax, 65537
    mov ebx, 65537

    mul ebx

    nop

    ; 6. imul: multiplicacion con signo

    mov eax, -5
    imul eax, eax, 3

    nop

    ; 7. div: division sin signo

    mov eax, 125
    mov edx, 0
    mov ebx, 12

    div ebx

    nop

    ; 8. idiv: division con signo

    mov eax, -125
    cdq
    mov ebx, 12

    idiv ebx

    nop

    exit

main ENDP
END main