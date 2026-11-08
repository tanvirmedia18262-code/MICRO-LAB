;Enter Higher case: R 
; This is your lower case: r
.model small
.data 

higher db 13, 10, " Enter Higher case: $"
lower db 13, 10, " This is your lower case: $"



.code

main proc 
    mov ax, @data 
    mov ds, ax
    
    ;higher string print 
    
    lea dx, higher 
    mov ah, 9h 
    int 21h 
    
    ;higher user print 
    mov ah, 1h ; user input 
    int 21h    ; interrupt
    ;al 
    mov Cl, al 
    mov ah, 2 ; input ascii print
    
    ; lower msg print 
    lea dx,lower 
    mov ah, 9h 
    int 21h  
    
    ;lower case convert 
    add Cl, 32 ; bl = r
    mov dl, C l ; dl = r 
    mov ah, 2; char output; output ascii print  
    int 21h ; interrupt 
    jmp exit 
    
    
    exit :
    mov ah, 4ch
    int 21h  
    
    main endp
end main 