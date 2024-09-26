INCLUDE Irvine32.inc
.data
input_msg_eax BYTE          "AX             = ", 0
input_msg_ebx BYTE          "BX             = ", 0
input_msg_ecx BYTE          "CX             = ", 0
output_msg_eax_ebx     BYTE "AX + BX        = ", 0
output_msg_eax_ebx_ecx BYTE "AX + BX + CX   = ", 0
output_msg_hex BYTE "Hex value  = ", 0

eaxstore WORD 0

.code
main PROC

call Clrscr
mov edx, OFFSET input_msg_eax
call WriteString
call ReadDec
mov eaxstore, ax
mov dl, 60
mov dh, 0
call gotoxy
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf

mov edx, OFFSET input_msg_ebx
call WriteString
call ReadDec
mov bx, ax
mov dl, 60
mov dh, 1
call gotoxy
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf

mov edx, OFFSET input_msg_ecx
call WriteString
call ReadDec
mov cx, ax
mov dl, 60
mov dh, 2
call gotoxy
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf

mov ax, eaxstore

add ax, bx
mov edx, OFFSET output_msg_eax_ebx
mov ebx, 2                          ; write lower half
call WriteString
call WriteDec
mov dl, 60
mov dh, 3
call gotoxy
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHexB
call Crlf


add ax, cx
mov edx, OFFSET output_msg_eax_ebx_ecx
call WriteString
call WriteDec
mov dl, 60
mov dh, 4
call gotoxy
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHexB
call Crlf

call waitMsg

exit
main ENDP
END main