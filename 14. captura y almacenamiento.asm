; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 14. Captura y alamcenamiento de datos numericos.


INCLUDE Irvine32.inc

.data
mensaje BYTE "Cantidad de tarjetas recibidas (1-99): ",0
errorMsg BYTE "Error: ingrese un numero entre 1 y 99.",0
resultado BYTE "Existencia actual: ",0
unidades BYTE " unidades",0

buffer BYTE 10 DUP(0)
bufferNumero BYTE 12 DUP(0)

cantidadRecibida DWORD 0
existenciaActual DWORD 25

.code
main PROC

pedirCantidad:

    mov edx, OFFSET mensaje
    call WriteString

    mov edx, OFFSET buffer

    mov ecx, SIZEOF buffer
    call ReadString

    ; validar longitud: 1 o 2 digitos
    cmp eax, 1
    jb entradaInvalida

    cmp eax, 2
    ja entradaInvalida

    ; guardar longitud
    mov ecx, eax
    mov esi, OFFSET buffer
    mov ebx, 0

validarDigitos:

    movzx eax, BYTE PTR [esi]

    cmp al, '0'
    jb entradaInvalida

    cmp al, '9'
    ja entradaInvalida

    ; convertir ascii a numero
    sub eax, '0'

    ; acumular: numero = numero * 10 + digito
    imul ebx, 10
    add ebx, eax

    inc esi
    loop validarDigitos

    ; rechazar cero
    cmp ebx, 1
    jb entradaInvalida

    cmp ebx, 99
    ja entradaInvalida

    ; guardar cantidad recibida
    mov cantidadRecibida, ebx

    ; sumar a las 25 unidades iniciales
    mov eax, 25
    add eax, cantidadRecibida
    mov existenciaActual, eax

    ; mostrar resultado
    mov edx, OFFSET resultado
    call WriteString

    mov eax, existenciaActual
    call convertirDecimal

    mov edx, OFFSET bufferNumero
    call WriteString

    mov edx, OFFSET unidades
    call WriteString
    call Crlf

    jmp terminar

entradaInvalida:

    mov edx, OFFSET errorMsg
    call WriteString
    call Crlf
    jmp pedirCantidad

terminar:
    exit

main ENDP

; conversion de numero a cadena decimal

convertirDecimal PROC
    pushad

    mov edi, OFFSET bufferNumero
    add edi, SIZEOF bufferNumero - 1
    mov BYTE PTR [edi], 0

    mov ebx, 10

convertir:
    mov edx, 0
    div ebx

    add dl, '0'
    dec edi
    mov [edi], dl

    cmp eax, 0
    jne convertir

    ; mover la cadena al inicio del buffer
    mov esi, edi
    mov edi, OFFSET bufferNumero

copiar:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi

    cmp al, 0
    jne copiar

    popad
    ret
convertirDecimal ENDP

END main