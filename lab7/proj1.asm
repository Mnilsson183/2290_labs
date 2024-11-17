INCLUDE Irvine32.inc

.data
	emoji BYTE 02h, 0
	last DWORD 1
	game_over BYTE "The game is over.", 0
	clear_screen BYTE "                                                                                ", 0
	; I am using this hack to clear the screen because the irvine clrscr call is extremly slow on my vm

	a_key WORD 0041h
	l_key WORD 004Ch
	space_key WORD 0020h

	loop_delay = 500

.code
main proc
	; ecx stores the x coord
	; ebx stores the velocity
	xor ecx, ecx
	mov ebx, 1
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
	mov ebx, 1
	mov last, 1
	jmp move

velocity_left:
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
	jz over			; x = 0
	cmp ecx, 79
	jz over			; x = 79
	call render

	jmp l1

over:
	mov dl, 0
	mov dh, 0
	call gotoxy
	mov edx, OFFSET clear_screen
	call WriteString

	mov dl, 0
	mov dh, 0
	call gotoxy
	mov edx, OFFSET game_over
	call WriteString

	exit
main ENDP

; =====================================================
; GOAL: print the emoji in the x value suplied in ecx
; Params:
;	ecx : the x val of the emoji
; Pre-conditions: ecx is ge 0
; =====================================================
render PROC
	push edx
	; ecx x coord
	mov dl, 0
	mov dh, 0
	call gotoxy
	mov edx, OFFSET clear_screen
	call WriteString

	mov dl, cl
	mov dh, 0
	call gotoxy
	mov edx, OFFSET emoji
	call WriteString
	pop edx
	ret

render ENDP

end main
