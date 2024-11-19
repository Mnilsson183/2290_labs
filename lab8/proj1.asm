INCLUDE Irvine32.inc

.data
	emoji BYTE 02h, 0
	last DWORD 1
	game_over BYTE "The game is over.", 0
	clear_screen BYTE "                                                                                ", 0
	bar BYTE "|", 0
	space BYTE " ", 0
	x_min DWORD 0
	x_max DWORD 79
	bounces DWORD 0
	msg_bounces BYTE "Bounces: ", 0

	a_key WORD 0041h
	l_key WORD 004Ch
	space_key WORD 0020h

	loop_delay = 200

.code
main proc
	; ecx stores the x coord
	; ebx stores the velocity
	mov ebx, 1
	mov ecx, 39
	mov eax, loop_delay	; delay

l1:
	push ebx		; read key overwrites ebx with a set of flags
	call ReadKey
	pop ebx
	jz move

	cmp dx, a_key		; if key == a verlocity = right
	je velocity_right

	cmp dx, l_key		; if key == l velocity = left
	je velocity_left

	cmp dx, space_key	; if key == space velocity = 0
	je velocity_stop

	jmp move

velocity_right:
	cmp ebx, 1
	je l1
	cmp ebx, 0
	je l1

	dec cl
	mov dl, cl
	mov dh, 1
	call gotoxy
	inc cl

	mov edx, OFFSET bar
	call writeString
	inc bounces

	mov x_min, ecx

	mov ebx, 1
	mov last, 1

	jmp move

velocity_left:
	cmp ebx, -1
	je l1
	cmp ebx, 0
	je l1

	mov edx, OFFSET bar
	call writeString
	inc bounces

	mov x_max, ecx

	mov ebx, -1
	mov last, -1

	jmp move

velocity_stop:
	cmp ebx, 0
	jne assign_zero

	mov ebx, last		; if the curr velcoity == 0
	jmp move

assign_zero:			; if the curr velocity != 0
	mov ebx, 0
	jmp move


move:
	mov eax, loop_delay	; ensure has not been overwritten
	call Delay
	add ecx, ebx
	cmp ecx, x_min
	jb over
	cmp ecx, x_max
	ja over
	call renderball

	jmp l1

over:
	call Crlf
	mov edx, OFFSET game_over
	call WriteString
	exit
main ENDP

; =====================================================
; GOAL: print the emoji in the x value suplied in ecx
; Params:
;	ecx : the curr x val of the emoji
;	ebx : the velocity
; Pre-conditions: ecx is ge 0
; =====================================================
renderball PROC
	push edx
	push eax

	mov dl,0
	mov dh, 0
	call gotoxy

	mov edx, OFFSET msg_bounces
	call WriteString
	mov eax, bounces
	call WriteDec

	mov edx, ecx
	sub edx, ebx			; edx is the old coord
	; ecx x coord
	mov dh, 1
	call gotoxy
	mov edx, OFFSET space		; clear the last pos
	call WriteString

	mov dl, cl
	mov dh, 1
	call gotoxy
	mov edx, OFFSET emoji
	call WriteString

	pop eax
	pop edx
	ret

renderball ENDP

end main
