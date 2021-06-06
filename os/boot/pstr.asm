pstr:	mov ah,0x0e
	pusha 
label:
	mov al,[bx]
	cmp al,0
	je end
	int 0x10
	add bx,1
	jmp label
end:	popa
	ret

	
