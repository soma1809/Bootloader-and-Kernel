	[bits 32]
	VIDEO_MEM equ 0xb8000
	WONB equ 0x0f
prt32:	pusha
	mov edx,VIDEO_MEM
	mov ah,WONB
prtlp:	mov al,[ebx]
	cmp al,0
	je endpm
	mov [edx],ax
	add ebx,1
	add edx,2
	jmp prtlp
endpm:	popa
	ret
	
