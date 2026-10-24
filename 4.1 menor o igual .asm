; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 4.1 Mayor, Menor o igual a la entrada del ususario


INCLUDE Irvine32.inc

.data

    prompt1          BYTE "Introduce el primer numero: ", 0
	prompt2          BYTE "Introduce el segundo numero: ", 0
    msgMenor         BYTE "El primer numero es menor.", 0
    msgiguales       BYTE "Los numeros son iguales.", 0
    msgEsmayor       BYTE "El primer numero es mayor.", 0
.code
main PROC

	mov edx, OFFSET prompt1  ;pregunta el primer valor
	call WriteString 
	call ReadInt
	mov ecx, eax  ;guarda el valor ingresado en ecx

	mov edx, OFFSET prompt2 ;pregunta el sagundo valor
	call WriteString 
	call ReadInt
	mov ebx, eax  ;guarda el valor en ebx

	mov eax, ecx
	mov ebx, ebx
	
	cmp eax, ebx  ;compara ambos valores

	je iguales  ; si son iguales salta a iguales

	jg mayor  ; salta a mayor si el primer numero es mayor al segundo
	mov edx, OFFSET msgMenor ; si no se cumplen las anteriores el primer numero es menor al segundo
	call WriteString

	jmp fin
	
iguales:
	mov edx, OFFSET msgiguales
	call WriteString

mayor:
	mov edx, OFFSET msgEsmayor
	call WriteString

fin:
	call Crlf
	exit

main ENDP
END main
