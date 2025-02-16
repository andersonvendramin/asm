section .data
    SYSTEM_EXIT equ 60

    message db "Hello, world!", 10
    message_length equ $ - message

section .text
    global main

main:
    mov rdi, 42
    mov rax, SYSTEM_EXIT
    syscall

    ret
