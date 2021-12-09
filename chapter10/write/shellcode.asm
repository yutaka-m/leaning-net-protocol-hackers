BITS 64

%define SYS_write 1
%define STDOUT 1

_start:
    mov rax, SYS_write
    mov rdi, STDOUT
    lea rsi, [rel _greeting]
    mov rdx, _greeting_end - _greeting
    syscall
    ret

_greeting:
    db "HELLO WORLD", 10
_greeting_end:

