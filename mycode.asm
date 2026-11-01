;4 + 4 = 8, 5 + 3 = 8, 0 + 1 = 1 
.model small ; 1 CS + 1 DS
.stack 100h ; 256 bytes
.data
.code

main proc ;procedure
    mov ax, @data
    mov ds, ax ;DS activate
    
    ;ax, bx, cx, dx   
    mov ax, 4  ; ax = 4 
    mov dx, 3  ; dx = 3 
    add dx, ax ; dx = 4 + 3 = 7 
    ;ascii convert 
    add dx, '0'
    ;add dx, 48
    ;add dx, 30h
    mov ah, 2h ; character print
    int 21h ; interrupt 
    
   
    
    exit:
    mov ah, 4ch
    int 21h
    
    main endp ;end of procedure
end main ; whole program