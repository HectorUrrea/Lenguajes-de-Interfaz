; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 6.1 estacionamiento


INCLUDE Irvine32.inc

.data
accesopluma = 1

msgpin BYTE "Que hace el vehiculo? Sale (0) - Entra (1)",0
msgerror BYTE "Ingresa un valor correcto",0
msgintentos BYTE "Intentos restantes: ",0
msgacceso BYTE "Cajon ocupado de manera correcta",0
msgsalida BYTE "Cajon desocupado de manera correcta",0

.code

main PROC

    mov ebx, 10

intentar:

    mov edx, OFFSET msgpin
    call WriteString
    call ReadInt

    cmp eax, accesopluma
    je acceso

    mov edx, OFFSET msgerror
    call WriteString
    call Crlf

    dec ebx

    jz bloqueado

    mov edx, OFFSET msgintentos
    call WriteString

    mov eax, ebx
    call WriteDec
    call Crlf

    jmp intentar

acceso:

    mov edx, OFFSET msgacceso
    call WriteString
    call Crlf
    jmp fin

bloqueado:

    mov edx, OFFSET msgsalida
    call WriteString
    call Crlf

fin:

    exit

main ENDP

END main