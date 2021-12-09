BITS 64

%define SYS_execve 59

_start:
    mov rax, SYS_execve
    lea rdi, [rel _exec_path]
    lea rsi, [rel _argument]
    push 0
    push rsi
    push rdi
    mov rsi, rsp
    push 0
    mov rdx, rsp
    syscall
    ret

_exec_path:
    db "/bin/uname", 0
_argument:
    db "-a", 0
