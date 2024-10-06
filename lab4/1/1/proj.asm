INCLUDE Irvine32.inc
.data
emoji BYTE "", 0
.code
main PROC
mov ecx, 79
mov edx, OFFSET emoji
l:  mov dl, 79 - ecx
    mov dh, 0
    call gotoxy
    call WriteString
    loop l
main ENDP
END main