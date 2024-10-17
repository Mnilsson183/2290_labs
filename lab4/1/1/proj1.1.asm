; 1
INCLUDE Irvine32.inc
.data
emoji BYTE 02h, 0
.code
main PROC
mov ecx, 80
mov eax, 500
    mov edx, OFFSET emoji
l1:
    call Delay
    call WriteString
    loop l1
exit
main ENDP
END main
