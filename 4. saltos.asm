; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 4 saltos


INCLUDE Irvine32.inc

.data
msgDiferentes    BYTE "Los numeros son diferentes.", 0
msgiguales       BYTE "Los numeros son iguales.", 0
.code
main PROC
	mov eax, 10
	mov ebx, 10
	
	cmp eax, ebx  ;compara ambos numeros

	je iguales  ;si son iguales salta a iguales

	mov edx, OFFSET msgDiferentes ;de lo contrario son diferentes
	call WriteString

	jmp fin  ;salta al final 
	
iguales:
	mov edx, OFFSET msgiguales
	call WriteString

fin:
	call Crif
	exit

main ENDP
END main
