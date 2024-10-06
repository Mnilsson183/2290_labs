INCLUDE Irvine32.inc
.data
msgs BYTE "Enter index: ", 0, "Value: ", 0, 0, 0
.code
main PROC
mov edx, OFFSET msgs
call WriteString
call ReadDec
mov ecx, eax
mov eax, 1
mov ebx, 1
l1: add eax, ebx
    xchg eax, ebx
    loop l1
add edx, 14
call WriteString
call WriteDec
exit
main ENDP
END main