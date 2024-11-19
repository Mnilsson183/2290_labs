INCLUDE Irvine32.inc
.data
arr DWORD 1, 3, 5, 1, 3
target DWORD 2
output_found BYTE "FOUND: ", 0
output_space BYTE ", ", 0
output_arr_spacing BYTE ", ", 0
.code
main PROC
    call Clrscr
    mov edi, OFFSET arr         ; edx stores the arr
    xor ecx, ecx
    Print:
        mov eax, [edi + ecx * 4]
        call WriteDec
        mov edx, OFFSET output_arr_spacing
        call WriteString
        inc ecx
        cmp ecx, LENGTHOF arr
        jne Print

    call Crlf
    mov edx, OFFSET arr
    xor esi, esi                ; outer pointer esi

L1:
    mov edi, 1                  ; inner pointer edi
    xor ecx, ecx                ; ecx stores the value of the outer arr pointer
    mov ecx, [edx + esi * 4]

    L2:
        mov eax, [edx + edi * 4]; put into eax the inner value
        add eax, ecx            ; add the outer value to eax
        cmp eax, target         ; if the value is same print
        je Found

        inc edi                 ; else inc and continue
        cmp edi, LENGTHOF arr
        jne L2
    
    inc esi
    cmp esi, LENGTHOF arr - 1
    jne L1

mov eax, -1
call WriteInt
exit
        
Found:
    mov edx, OFFSET output_found
    call WriteString
    mov eax, esi
    call WriteDec
    mov edx, OFFSET output_space
    call WriteString
    mov eax, edi
    call WriteDec
    exit

main ENDP
END MAIN
