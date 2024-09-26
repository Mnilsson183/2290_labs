INCLUDE Irvine32.inc
.MODEL SMALL
.STACK 100h

.data
output_arr_spacing BYTE ", ", 0
matrix      DWORD 0, 1, 0, 0
            DWORD 0, 0, 0, 0
            DWORD 0, 0, 0, 0
            DWORD 0, 0, 0, 0

destMatrix  DWORD 0, 0, 0, 0
            DWORD 0, 0, 0, 0
            DWORD 0, 0, 0, 0
            DWORD 0, 0, 0, 0
rowCount BYTE 4
colCount BYTE 4

.code
main PROC

mov ebx, OFFSET matrix                  ; ebx holds matrix
xor ecx, ecx                            ; ecx holds index
PrintMat:
    mov ax, @data
    mov ds, ax                          ; init ds indirecly through ax

    mov bx, 0                           ; row index
    L1:
        cmp bx, colCount
        jge
        L2:




exit
main ENDP
END MAIN