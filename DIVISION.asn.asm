.model small
.stack 100h
.data 

dividend db "Enter Dividend: $"
divisor db 13,10, "Enter Divisor: $"
quotient db db 13,10, " Your Quotient: $"
remainder db 13, 10, " Your Remainder: $"
error db 13,10, "underfine! $"




.code

main proc
    mov ax, @data
    mov ds, ax  
    
    ;str print, load effective address 
    lea dx, dividend ;str load 
    mov ah,9h ;str print
    int 21h ;interrupt  
    
    
    ;dividend user input
    mov ah, 1 ;user input
    int 21h ; interrupt
    ;al = by default user input taker 
    ;ascii 
    sub al, 30h ; decimal convert 
    mov bl, al ; bl = dividend 
    
    
    ;str print, load effective address 
    lea dx, divisor ;str load 
    mov ah,9h ;str print
    int 21h ;interrupt
    
    ;divisor user input
    mov ah, 1 ;user input
    int 21h ; interrupt
    ;al = by default user input taker 
    ;ascii 
    sub al, 48 ; decimal convert 
    mov bh , al ; bl = divisor
    
    
    ;corner case
    cmp bh, 0
    je undefine ;jump if equal  
    
    
    ;quotient msg print
    lea dx, quotient ;str load
    mov ah, 9h ; str print
    int 21h ;interrupt
    
   
    
    ;else 
    mov al, bl ;quotient store
    div bh  ;divisor
    mov dl, al ; al = quotient
    add dl, '0' ;ascii convert
    mov ah, 2h   ; char  print 
    int 21h; interrupt   
    
    
    undefine:segment
    lea dx, error ;str load 
    mov ah,9h ;str print
    int 21h ;interrupt
    
       
    
    ;case insensitive, indentation not mind 
    ;ascii , pattern = mind 
    
    
    exit:
    mov ah, 4ch ;ah = 4c
    int 21h
    
    main endp
end main 