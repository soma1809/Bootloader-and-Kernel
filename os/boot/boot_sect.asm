	[org 0x7c00]
	KERNEL_OFFSET equ 0x1000
	mov [BOOT_DRIVE],dl
	mov bp,0x9000
	mov sp,bp
	mov bx,MSG_REAL_MODE
	call pstr
	call load_kernel
	call switch_to_pm
	jmp $
	%include "pstr.asm"
	%include "gdt.asm"
	%include "diskload.asm"
	%include "vid.asm"
	%include "switch_to_pm.asm"
	[bits 16]
load_kernel:
	mov bx,MSG_LOAD_KERNEL
	call pstr
	mov bx,KERNEL_OFFSET
	mov dh,15
	mov dl,[BOOT_DRIVE]
	call diskload
	ret
	[bits 32]
BEGIN_PM:
	mov ebx,MSG_PROT_MODE
	call prt32
	call KERNEL_OFFSET
	jmp $
BOOT_DRIVE:	db 0
MSG_REAL_MODE:	db "Started in 16-bit real mode ",0
MSG_PROT_MODE:	db "Started in 32-bit protected mode",0
MSG_LOAD_KERNEL: db "Loading kernel into memory",0
	times 510-($-$$) db 0
	dw 0xaa55
