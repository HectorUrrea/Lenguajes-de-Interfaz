; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 10. obtencion de una cadena decimal

INCLUDE Irvine32.inc

.data
    
    buffer BYTE 20 DUP(0)

.code
main PROC

   mov eax, 357
    mov ecx, 0          ; contador de digitos
    mov ebx, 10         ; divisor

extraerDigitos:
    mov edx, 0       
    div ebx             ; eax / 10
    
    push edx            ; guardar el digito en la pila
    inc ecx             

    cmp eax, 0
    jne extraerDigitos

    mov esi, OFFSET buffer

guardarCadena:
    pop edx             
    add dl, 30h         ; convertir a ascii
    mov [esi], dl       ; guardar en la cadena
    inc esi
    loop guardarCadena

    

    ; mostrar la cadena completa
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit

main ENDP
END main