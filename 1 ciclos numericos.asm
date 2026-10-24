; Materia: Lenguajes de Interfaz 
; Alumno: Urrea Esquerra Hector Manuel
; Horario: 8am-9am
; Docente: Dr. José Luis Medina Jiménez 
;Práctica: 1 Ciclos Numericos


INCLUDE Irvine32.inc

.data

.code
main PROC
	mov ecx, 5 ;se inicia el valor de ecx en 5

ciclo:   ;se inicia el ciclo
	mov eax, ecx
	call WriteDec  ;imprime el valor actual de ecx
	call Crlf

	loop ciclo  ;comprueba el valor de ecx, si este es 0 termina, si no regresa al ciclo
	
	exit

main ENDP
END main
