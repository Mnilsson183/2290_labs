INCLUDE Irvine32.inc
arr_size = 40
.data
arr DWORD arr_size DUP(0)
str_number BYTE "Fibonacci number ", 0
str_equals BYTE " = ", 0
.code
main PROC

mov eax, 0
mov ebx, 1
mov ecx, 1
l1:	add eax, ebx
	xchg eax, ebx
	mov [arr + (ecx * 4)], eax
	inc ecx
	cmp ecx, arr_size
	jne l1

xor ecx, ecx
l2:	mov edx, OFFSET str_number
	call WriteString

	mov eax, ecx
	call WriteDec

	mov edx, OFFSET str_equals
	call WriteString

	mov eax, [arr + (ecx * 4)]
	call WriteDec
	call Crlf
	
	inc ecx
	cmp ecx, arr_size
	jne l2
exit
main ENDP
END main
