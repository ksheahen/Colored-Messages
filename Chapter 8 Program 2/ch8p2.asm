; Chapter 8 Program 2
; Date: 4/28/2024

INCLUDE Irvine32.inc

.data
forecolor DWORD 2	;green
backcolor DWORD 15	;white
prompt1 BYTE "Go Dallas Stars",0 

.code
main PROC
	
	push forecolor	;push forecolor value to stack
	push backcolor	;push backcolor value to stack
	call SetColor	;call setcolor procedure

	exit

main ENDP

SetColor PROC 

	push ebp	;push ebp to the stack
	mov ebp,esp	;move esp to ebp
	mov eax, 0	;clear eax
	mov al,[ebp + 12]	;move second value to al
	mov ah,[ebp + 8]	;move first value to ah
	shl al,4			;shift al left by 4
	shr eax,4			;shift eax right by 4 (EAX=000000F2)

	mov edx,OFFSET prompt1	;set prompt1 to edx
	call SetTextColor		;call SetTextColor (green text, white back)
	call WriteString		;write text to console
	
	mov esp,ebp	;mov ebp to esp	
	pop ebp		;pop ebp off the stack

	ret

SetColor ENDP
END main