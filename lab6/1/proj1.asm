INCLUDE Irvine32.inc
.data
sorted BYTE 2,5,9,11,23,41,57,68,71,82,85
space BYTE " ", 0
msg_curr_arr BYTE "The array is as follows", 0
idx_select BYTE "What location do you wish to change: ", 0
msg_arr BYTE "array", 0
msg_location BYTE "Location ", 0
msg_equal BYTE " = ", 0

.code
main PROC
mov edx, OFFSET msg_curr_arr
call WriteString
call Crlf

mov esi, OFFSET sorted
mov edi, LENGTHOF sorted
mov ebx, TYPE sorted

call print

mov edx, OFFSET idx_select
call writeString
call readDec

call shift

call print

exit
main ENDP


; ---------------------------------------------------------------
; GOAL: shift the array of OFFSET esi from the index eax given the length of the array edi given element size BYTE
; Params:
; eax = insert index
; esi = arr to be shifted at position eax
; edi = The length of the array in esi
; Post-conditions: The passed array will be altered nothing else is altered
; Pre-conditions: eax is in bounds
; ---------------------------------------------------------------
shift PROC

push ecx
push ebx
push esi

cmp eax, edi				; check if trying to shift outside the bounds
jge finished

mov ecx, eax
mov bl, [esi + ecx * 1]			; find save and zero out the element at the index
mov BYTE ptr [esi + ecx * 1], 0

inc ecx

cmp ecx, edi				; check if this is the last element
jae finished
l1:					; bl is the value to be shifted forward
	mov bh, BYTE ptr [esi + ecx * 1]
	mov BYTE ptr [esi + ecx * 1], bl
	xchg bl, bh
	inc ecx
	cmp ecx, edi
	jne l1
finished:
pop esi
pop ebx
pop ecx

ret
shift ENDP


; ---------------------------------------------------------------
; GOAL: Print the array with offset edi length of esi with element size BYTE
; Params:
; esi = The offset of the array to be printed
; edi = The length of the array in esi
; Post-conditions: None
; Pre-conditions: None
; ---------------------------------------------------------------
print PROC
push eax
push edx
push ecx
pushfd;
xor ecx, ecx
print_loop:
	mov edx, OFFSET msg_location
	call WriteString

	mov eax, ecx
	call WriteDec

	mov edx, OFFSET msg_equal
	call WriteString

	movzx eax, BYTE ptr [esi + ecx * 1]
	call WriteDec

	call Crlf

	inc ecx
	cmp ecx, edi
	jne print_loop

call Crlf

popfd
pop ecx
pop edx
pop eax

ret
print ENDP

END main
