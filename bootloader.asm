
bits 16
org 0x7C00

start:
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    cld
    mov si, message

    print_loop:
    lodsb
    test al, al
    jz done
    mov ah, 0x0E
    int 0x10
    
    jmp print_loop
    
done:
    jmp $
    

message db 'HELLO', 0


times 510-($-$$) db 0
dw 0xAA55
