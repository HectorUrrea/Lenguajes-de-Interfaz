; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 15. manipulacion de archivos

INCLUDE Irvine32.inc

.data

    nombreArchivo BYTE "Inventario.txt", 0 
    texto BYTE "125", 0 
    archivoHandle DWORD ?

    mensajeExito BYTE "Archivo guardado correctamente. ", 0 
    mensajeError BYTE "Ocurrio un error, el archivo no se a guardado correctamente! ", 0 

.code

main PROC

    ; 1 - Crear el archivo.
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile

    cmp eax, INVALID_HANDLE_VALUE
    je error

    mov archivoHandle , eax 

    ; 2 - Escribir texto ("125").
    mov eax, archivoHandle
    mov edx, OFFSET texto
    mov ecx, SIZEOF texto - 1
    call WriteToFile

    jc errorEscritura

    cmp eax, SIZEOF texto - 1
    jne errorEscritura 

    ; 3 - Cerrar archivo.txt.
    mov eax, archivoHandle 
    call CloseFile

    test eax, eax
    jz error

    mov edx, OFFSET mensajeError
    call WriteString
    jmp fin

errorEscritura

    mov eax, archivoHandle
    call CloseFile
    
error

    mod edx, OFFSET mensajeError
    call WriteString

fin

    exit

main ENDP

END main

