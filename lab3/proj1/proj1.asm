INCLUDE Irvine32.inc
.data
input_msgX BYTE "Enter value for X: ", 0
input_msgY BYTE "Enter value for y: ", 0
output_msg_math_drill BYTE "Math Drill - Enter two values and get the following results: ", 0
output_msg_add BYTE "+ Addition", 0
output_msg_sub BYTE "- Subtraction", 0

output_msg_x BYTE    "X     =   ", 0
output_msg_y BYTE    "Y     =   ", 0
output_msg_plus BYTE "X + Y =   ", 0
output_msg_minu BYTE "X - Y =   ", 0
output_msg_hex BYTE "        Hex value  = ", 0

xval DWORD 0
yval DWORD 0

.code
main PROC
call Clrscr
mov edx, OFFSET output_msg_math_drill
call WriteString
call Crlf
mov edx, OFFSET output_msg_add
call WriteString
call Crlf
mov edx, OFFSET output_msg_sub
call WriteString
call Crlf

mov edx, OFFSET input_msgX
call WriteString
call ReadDec
mov xval, eax

mov edx, OFFSET input_msgY
call WriteString
call ReadDec
mov yval, eax
call Crlf

mov eax, xval
mov edx, OFFSET output_msg_x
call WriteString
call WriteDec
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf

mov eax, yval
mov edx, OFFSET output_msg_y
call WriteString
call WriteDec
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf
call Crlf

add eax, xval
mov edx, OFFSET output_msg_plus
call WriteString
call WriteDec
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf

mov eax, xval
sub eax, yval
mov edx, OFFSET output_msg_minu
call WriteString
call WriteDec
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf

call waitMsg

exit
main ENDP
END main