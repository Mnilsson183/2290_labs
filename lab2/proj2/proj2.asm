INCLUDE Irvine32.inc
.data
input_msg BYTE "Enter a value for EAX: ", 0
output_eax BYTE "EAX=", 0
output_ax BYTE "AX=", 0
output_al BYTE "AL=", 0
.code
main PROC
call Clrscr
mov edx, OFFSET input_msg
call WriteString
call readDec
call Crlf

mov edx, OFFSET output_eax
call WriteString
mov ebx, 4
call WriteHexB
call Crlf

mov edx, OFFSET output_ax
call WriteString
mov ebx, 2
call WriteHexB
call Crlf

mov edx, OFFSET output_al
call WriteString
mov ebx, 1
call WriteHexB
call Crlf
call Crlf

call WaitMsg

exit
main ENDP
END main