; 3
INCLUDE Irvine32.inc
.data
emoji BYTE 02h, 0
space BYTE " ", 0
xval BYTE 0
.code
main PROC
call Clrscr

mov eax, 100
mov ecx, 80
l1:
	mov edx, OFFSET emoji
	call WriteString
	call delay

	mov dl, xval
	mov dh, 0
	call gotoxy

	mov edx, OFFSET space
	call WriteString

	inc xval

	loop l1
exit
main ENDP
END main
