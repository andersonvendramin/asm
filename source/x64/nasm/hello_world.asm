section .data
    STACK_SIZE equ 32
    SYS_WRITE equ 1
    SYS_EXIT equ 60

    message db "Hello, world!", 10
    message_length equ $ - message

section .text
    global main

write_console:
    ; parameters: string, string_length
    ; variables: string, string_length
    ; return: None

    ; pre-amble
    push rbp
    mov rbp, rsp
    sub rsp, STACK_SIZE

    ; variables
    mov [rsp], rdi
    mov [rsp + 8], rsi

    ; write to console string_length bytes of string
    mov rdi, 1
    mov rsi, [rsp]
    mov rdx, [rsp + 8]
    mov rax, SYS_WRITE
    syscall

    ; post-amble
    add rsp, STACK_SIZE
    pop rbp
    ret

main:
    ; writes message to the standard output
    mov rdi, message
    mov rsi, message_length
    call write_console

    ; exits the program 
    xor rdi, rdi
    mov rax, SYS_EXIT
    syscall
    ret