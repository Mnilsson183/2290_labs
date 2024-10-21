INCLUDE Irvine32.inc
arr_size = 50
.data
arr DWORD arr_size DUP(0)
str_number BYTE "Fibonacci number ", 0
str_equals BYTE " = ", 0
.code
main PROC

mov eax, 0
mov ebx, 1
mov esi, OFFSET arr
add esi, TYPE arr					; presering the first values as 0
mov ecx, arr_size - 1
l1:	add eax, ebx					; create and store the seq
	xchg eax, ebx
	mov [esi], eax
	add esi, TYPE arr			; inc esi
	loop l1

mov esi, OFFSET arr
mov ecx, arr_size
l2:	mov edx, OFFSET str_number		; print the seq
	call WriteString			; "Fib number"

	mov eax, arr_size
	sub eax, ecx
	call WriteDec				; idx 

	mov edx, OFFSET str_equals
	call WriteString			; "="

	mov eax, [esi]
	add esi, TYPE arr
	call WriteDec				; val
	call Crlf
	
	loop l2
exit
main ENDP
END main
