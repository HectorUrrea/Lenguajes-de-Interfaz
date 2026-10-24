; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 5.1 repetir que el usuario ingrese 0



INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingresa un numero (0 para salir): ", 0

.code
main PROC

ciclo:
    mov edx, OFFSET prompt 
    call WriteString
    call ReadInt ;lee el numero ingresado
    call Crlf
   
    cmp eax, 0   ; lo compara con 0
  
    jne ciclo ; si no son iguales regresa al cicloS

    exit

main ENDP
END main