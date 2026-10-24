; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 6. Decremento e Incremento


INCLUDE Irvine32.inc

.data
PINcorrecto = 1234

msgpin BYTE "Ingresa el PIN: ",0
msgerror BYTE "PIN incorrecto",0
msgintentos BYTE "Intentos restantes: ",0
msgacceso BYTE "Acceso permitido",0
msgbloqueado BYTE "intentos excedidos, borrando datos del dispositivo...",0

.code

main PROC

    mov ebx, 3

intentar:

    mov edx, OFFSET msgpin ;pide el PIN
    call WriteString
    call ReadInt

    cmp eax, PINcorrecto  ;compara el PIN ingresado con el correcto
    je acceso   ;si son iguales da acceso

    mov edx, OFFSET msgerror ; de lo contrario manda un mensaje de error
    call WriteString
    call Crlf

    dec ebx  ;resta el numero de intentos maximos

    jz bloqueado  ; si el numero de inentos llega a 0 bloquea 

    mov edx, OFFSET msgintentos  ; si aun hay intentos los muestra
    call WriteString

    mov eax, ebx
    call WriteDec
    call Crlf

    jmp intentar  ;regresa a al intento

acceso:

    mov edx, OFFSET msgacceso  
    call WriteString
    call Crlf
    jmp fin

bloqueado:

    mov edx, OFFSET msgbloqueado
    call WriteString
    call Crlf

fin:

    exit

main ENDP

END main