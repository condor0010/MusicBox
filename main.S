; -- Screaming Into The Void --
; --   by Falo & Orcinolo    --
; data goes at the top, despite waht we read in the nasm docs, mostly just used to it
section .data
    scream db 'aaaa' ; should replace with actual grevince
    len equ $ - scream
    filename db 'god' ; the void into witch we scream
    lenfilename equ $ - filename ; length of string "/dev/null"
    fd dq 0
section .text
global _start

_start:
    mov rdi, filename ; put filename in rdi register
    mov rsi, 0102o ; these do something
    mov rdx, 0666o ; these do something
    mov rax, 2 ; syscall for open, you have to open the file to write to it
    syscall
breath: ; Inhale
    mov [fd], rax
    mov rdx, len ; buffer length
    mov rsi, scream ; buffer content
    mov rdi, [fd]; file descriptor
    mov rax, 1   ; spesify sys_write
    syscall      ; have kernal call sys_write
jmp breath ; Exhale
; we could exit safely, but the program runs in an infinate loop so theres realy no point
