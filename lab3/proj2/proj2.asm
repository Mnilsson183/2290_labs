INCLUDE Irvine32.inc
.data
input_msg_eax BYTE              "EAX            = ", 0
input_msg_ebx BYTE              "EBX            = ", 0
input_msg_ecx BYTE              "ECX            = ", 0
output_msg_eax_ebx     BYTE     "EAX + EBX      = ", 0
output_msg_eax_ebx_ecx BYTE     "EAX + EBX + ECX= ", 0
output_msg_hex BYTE "      Hex value  = ", 0

eaxstore DWORD 0

.code
main PROC

call Clrscr
mov edx, OFFSET input_msg_eax

call WriteString
call ReadDec
mov eaxstore, eax
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
mov ebx, eax
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
mov ecx, eax
mov dl, 60
mov dh, 2
call gotoxy
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf

mov eax, eaxstore

add eax, ebx
mov edx, OFFSET output_msg_eax_ebx
call WriteString
call WriteDec
mov dl, 60
mov dh, 3
call gotoxy
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf


add eax, ecx
mov edx, OFFSET output_msg_eax_ebx_ecx
call WriteString
call WriteDec
mov dl, 60
mov dh, 4
call gotoxy
mov edx, OFFSET output_msg_hex
call WriteString
call WriteHex
call Crlf

call waitMsg

exit
main ENDP
END main