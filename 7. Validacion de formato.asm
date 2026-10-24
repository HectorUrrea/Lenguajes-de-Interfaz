; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 7. Validacion de formato 

INCLUDE Irvine32.inc

.data
cadena BYTE "TEC-123",0  ;cadena a validar

msgValido   BYTE "Formato valido",0 
msgInvalido BYTE "Formato invalido",0

.code
main PROC
   
   ; validar que la longitud sea 7

    mov esi, 0

contar:
    mov al, cadena[esi]
    cmp al, 0
    je verifi0carLongitud

    inc esi
    jmp contar

verificarLongitud:
    cmp esi, 7
    jne formatoInvalido

    ; validar que las letras esten estre A-Z

    mov esi, 0

validarLetras:

    mov al, cadena[esi]

    cmp al, 'A'
    jb formatoInvalido

    cmp al, 'Z'
    ja formatoInvalido

    inc esi

    cmp esi, 3
    jl validarLetras


    ; validar el guion

    mov al, cadena[esi]

    cmp al, '-'
    jne formatoInvalido

    inc esi

    ; validar los digitos

validarDigitos:

    mov al, cadena[esi]

    cmp al, '0'
    jb formatoInvalido

    cmp al, '9'
    ja formatoInvalido

    inc esi

    cmp esi, 7
    jl validarDigitos

    ; mensaje de formato correcto

    mov edx, OFFSET msgValido
    call WriteString
    call Crlf

    jmp terminar


formatoInvalido:  ;mensaje de formato invalido

    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf


terminar:

    exit

main ENDP
END main