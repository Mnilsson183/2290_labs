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
mov ecx, 1
l1:
	add eax, ebx                    ; create and store seq
	xchg eax, ebx
	mov [arr + (ecx * TYPE arr)], eax
	inc ecx
	cmp ecx, arr_size
	jne l1

xor ecx, ecx
l2:
	mov edx, OFFSET str_number        ; print seq
	    call WriteString            ; "Fib num"

	mov eax, ecx
	call WriteDec                ; idx

	mov edx, OFFSET str_equals
	call WriteString            ; "="

	mov eax, [arr + (ecx * TYPE arr)]
	call WriteDec                ; val
	call Crlf

	inc ecx
	cmp ecx, arr_size
	jne l2
exit
main ENDP
END main

