Include Irvine32.inc

.data
	val1 BYTE 0000000b
	is BYTE "is", 0
	isNot BYTE "is not", 0
.code
main PROC
	TEST val1, 10000001b
	jz l2		; not
	jp l1		; is
	jmp l2		; not

l1:
	mov edx, OFFSET is
	call WriteString
	exit
l2:
	mov edx, OFFSET isNot
	call WriteString
	exit
main ENDP
END main
