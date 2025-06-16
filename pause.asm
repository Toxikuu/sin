; pause.asm (x86_64)

section .text
global _start

_start:
    mov rax, 34     ; syscall number for pause
    syscall
