; pause.asm (x86_64) - the cutest possible(?) implementation of pause
;
; i decided to go golfing. this assembly contains a minimal elf header in
; addition to the pause implementation. this is done to save a few kilobytes.
; this is about as small as an elf can possibly get, short of overlapping
; things, assembling to 127 bytes.
;
; assemble using:
;   nasm -f bin -o pause pause.asm
[bits 64]

file_load_va: equ 4096 * 40

db 0x7f, 'E', 'L', 'F'
db 2
db 1
db 1
db 0
dq 0
dw 2
dw 0x3e
dd 1

dq entry_point + file_load_va
dq program_headers_start
; the section header is omitted to save a few bytes
dq 0
dd 0
dw 64
dw 0x38
dw 1
dw 0x40
dw 0
dw 0

program_headers_start:
dd 1
dd 5
dq 0
dq file_load_va
dq file_load_va
dq file_end
dq file_end
dq 0x200000

entry_point:
    mov eax, 34 ; pause
    syscall

file_end:
