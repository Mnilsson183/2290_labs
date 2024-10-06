INCLUDE Irvine32.inc
.code
main PROC
; eax val next
; ebx val last
; ecx counter
call Clrscr
call print_Please_enter_index

call ReadDec
mov ecx, eax

mov eax, 1
mov ebx, 1

l1:
    add eax, ebx
    xchg eax, ebx

    dec ecx
    cmp ecx, 0
    jnz l1

mov dl, 7
mov dh, 1
call gotoxy
call WriteDec
mov dl, 0
mov dh, 1
call gotoxy
call print_Value

exit
main ENDP
print_Please_enter_index PROC
mov al, 'P'
call WriteChar 
mov al, 'l'
call WriteChar 
mov al, 'e'
call WriteChar 
mov al, 'a'
call WriteChar 
mov al, 's'
call WriteChar 
mov al, 'e'
call WriteChar 
mov al, ' '
call WriteChar 
mov al, 'e'
call WriteChar 
mov al, 'n'
call WriteChar 
mov al, 't'
call WriteChar 
mov al, 'e'
call WriteChar 
mov al, 'r'
call WriteChar 
mov al, ' '
call WriteChar 
mov al, 'i'
call WriteChar 
mov al, 'n'
call WriteChar 
mov al, 'd'
call WriteChar 
mov al, 'e'
call WriteChar 
mov al, 'x'
call WriteChar
mov al, ':'
call WriteChar
mov al, ' '
call WriteChar
ret
print_Please_enter_index ENDP

print_Value PROC
mov al, 'V'
call WriteChar 
mov al, 'a'
call WriteChar 
mov al, 'l'
call WriteChar 
mov al, 'u'
call WriteChar 
mov al, 'e'
call WriteChar 
mov al, ':'
call WriteChar 
mov al, ' '
call WriteChar 
ret
print_Value ENDP
END main