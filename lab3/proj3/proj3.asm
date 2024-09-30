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

; read and print ax
mov edx, OFFSET input_msg_eax
call WriteString
call ReadDec                    ; read in ax value
mov eaxstore, ax                ; backup the value of ax

mov dl, 60                      ; set cursor
mov dh, 0
call gotoxy

mov edx, OFFSET output_msg_hex
call WriteString                ; write out the ax as a 2 byte hex value
mov ebx, 2
call WriteHexb

call Crlf
; -----------------------

; read and print bx
mov edx, OFFSET input_msg_ebx
call WriteString
call ReadDec                    ; bx is currently in ax

mov dl, 60                      ; set cursor
mov dh, 1
call gotoxy

mov edx, OFFSET output_msg_hex
call WriteString
mov ebx, 2                      ; print as 2 byte hex value
call WriteHexb
mov bx, ax

call Crlf
; ------------------------

; read and print cx
mov edx, OFFSET input_msg_ecx
call WriteString
call ReadDec                    ; read cx
mov cx, ax

mov dl, 60                      ; set cursor
mov dh, 2
call gotoxy

mov edx, OFFSET output_msg_hex
call WriteString
mov dx, bx
mov bx, 2
call WriteHexb
mov bx, dx
call Crlf
; -------------------------

mov ax, eaxstore

; write ax + bx
add ax, bx
mov edx, OFFSET output_msg_eax_ebx
mov ebx, 2                          ; write lower half
call WriteString
call WriteDec

mov dl, 60                          ; set cursor
mov dh, 3
call gotoxy

mov edx, OFFSET output_msg_hex
call WriteString
call WriteHexB                      ; bx is already 2 from previous
call Crlf
; -------------------------


; write sum
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
; --------------------------

call waitMsg

exit
main ENDP
END main