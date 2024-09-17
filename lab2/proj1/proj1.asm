INCLUDE Irvine32.inc
.data
input_msgX BYTE "Enter Value for X: ", 0
input_msgY Byte "Enter Vaue for Y: ", 0
output_msgVarX BYTE "X=", 0
output_msgVarY BYTE "Y=", 0
output_msgHexX BYTE "Hex X=", 0
output_msgHexY BYTE "Hex Y=", 0
output_msgBinX BYTE "Binary X=", 0
output_msgBinY BYTE "Binary Y=", 0
xval DWORD 1
yval DWORD 2
.code
main PROC
call Clrscr

mov edx, OFFSET input_msgX
call WriteString
call ReadDec
mov xval, eax

mov edx, OFFSET input_msgY
call WriteString
call ReadDec
mov yval, eax
call Crlf

mov edx, OFFSET output_msgVarX
call WriteString
mov eax, xval
call WriteDec
call Crlf

mov edx, OFFSET output_msgVarY
call WriteString
mov eax, yval
call WriteDec
call Crlf
call Crlf

mov edx, OFFSET output_msgHexX
call WriteString
mov eax, xval
call WriteHex
call Crlf

mov edx, OFFSET output_msgHexY
call WriteString
mov eax, yval
call WriteHex
call Crlf
call Crlf

mov edx, OFFSET output_msgBinX
call WriteString
mov eax, xval
call writeBin
call Crlf

mov edx, OFFSET output_msgBinY
call WriteString
mov eax, yval
call writeBin
call Crlf
call Crlf
call waitMsg

exit
main ENDP
END main