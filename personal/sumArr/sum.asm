INCLUDE Irvine32.inc
.data
arr DWORD 0, 0, 0, 0
input_msg BYTE "Enter value: ", 0
output_arr_spacing BYTE ", ", 0
output_arr_sum BYTE "SUM:", 0
.code
main PROC
    call Clrscr             ; clear
    mov edi, OFFSET arr     ; move arr into memory
    xor ecx, ecx            ; zero ecx the index

Populate:
    mov edx, OFFSET input_msg
    call WriteString        ; print enter value msg
    call ReadDec            ; read into eax
    mov [edi + ecx * 4], eax; mov into the arr the read value
    inc ecx                 ; inc the index
    cmp ecx, LENGTHOF arr
    jne Populate            ; if the index is != go back to the populate instructive

    xor ecx, ecx            ; zero ecx the index
Print:
    mov eax, [edi + ecx * 4]; get arr element
    call WriteDec
    mov edx, OFFSET output_arr_spacing
    call WriteString
    inc ecx
    cmp ecx, LENGTHOF arr
    jne Print

    xor ecx, ecx
    xor eax, eax            ; clear eax inorder to be summed to
Sum:
    add eax, [edi + ecx * 4]; add to eax
    inc ecx
    cmp ecx, LENGTHOF arr
    jne Sum

call Crlf
mov edx, OFFSET output_arr_sum
call WriteString
call WriteDec

call Crlf                   ; newline and waitMsg
call waitMsg
exit
main ENDP
END main