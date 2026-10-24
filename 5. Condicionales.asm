; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 5 condicionales



INCLUDE Irvine32.inc

.data

.code
main PROC
	
	mov ebx, 1 
	
ciclo:
	cmp ebx, 10 
	
	jg fin 

	mov eax, ebx 
	call WriteDec 
	call Crlf 

	inc abx 

	jmp ciclo
	

fin:
	exit

main ENDP
END main
