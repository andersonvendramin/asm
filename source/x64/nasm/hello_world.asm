section .data
    STACK_ALIGN equ 40
    
    STD_OUTPUT equ -11

    message db "Hello, world!", 10, 0
    message_length equ $ - message
    bytes_written dd 0

section .text
    ; entry point and Windows functions
    global main
    extern GetStdHandle
    extern WriteConsoleA
    extern ExitProcess

main:
    ; function pre-amble
    push rbp
    mov rbp, rsp
    sub rsp, STACK_ALIGN

    ; Get the standard output handle
    mov ecx, STD_OUTPUT
    call GetStdHandle
    
    ; write to console message_length bytes of message
    mov rcx, rax
    lea rdx, [rel message]
    mov r8, message_length
    mov r9, [rel bytes_written]
    mov qword [rsp + 32], 0
    call WriteConsoleA

    ; function post-amble
    add rsp, STACK_ALIGN
    pop rbp
    xor rax, rax
    ret