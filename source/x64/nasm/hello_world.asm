section .data
    STACK_SIZE equ 32
    
    STD_OUTPUT equ 1
    
    SYS_WRITE equ 1
    SYS_EXIT equ 60

    message db "Hello, world!", 10
    message_length equ $ - message

section .text
    global main

main:

    mov rdi, STD_OUTPUT
    mov rsi, message
    mov rdx, message_length
    mov rax, SYS_WRITE
    syscall

    ; exit
    xor rdi, rdi
    mov rax, SYS_EXIT
    syscall

    ret