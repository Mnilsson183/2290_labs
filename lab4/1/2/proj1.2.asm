; 2
INCLUDE Irvine32.inc
.data
emoji BYTE 02h, 0
xval BYTE 0
.code
main PROC
call Clrscr

mov eax, 1000
mov ecx, 80
call Clrscr
l1:
	call Clrscr
	mov dl, xval
	mov dh, 0
	call gotoxy

	mov edx, OFFSET emoji
	call WriteString

	inc xval
	call Delay

	loop l1

exit
main ENDP
END main
