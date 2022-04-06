; -- Screaming Into The Void --
; --   by Faloc & Orcinolo    --
; do ya get the ^ joke
; data goes at the top, despite waht we read in the nasm docs, mostly just used to it
section .data
    scream db 'aaaa' ; should replace with actual grevince
    len equ $ - scream
    filename db '/dev/null' ; the void into witch we scream
    lenfilename equ $ - filename ; length of string "/dev/null"
    fd dq 0
section .text
global _start

_start:
  ; start msg, sent to stdout
  mov rax, 1 ; syscall 1 "write"
  mov rdi, 2 ; 2 for standard error, still prints out but an error message seemed fitting
  mov rsi, grievance
  mov rdx, 150 ; just a hard coded value to help get you through the day
  syscall ; actualy runs ^
  mov rdi, filename ; put filename in rdi register
  mov rsi, 0102o ; these do something
  mov rdx, 0666o ; these do something
  mov rax, 2 ; syscall for open, you have to open the file to write to it
  syscall ; actualy runs ^
breath: ; Inhale
  mov [fd], rax
  mov rdx, len ; buffer length
  mov rsi, scream ; buffer content
  mov rdi, [fd]; file descriptor
  mov rax, 1   ; spesify sys_write
  syscall      ; have kernal call sys_write
jmp breath ; Exhale
; we could exit safely, but the program runs in an infinate loop so theres realy no point
grievance db 'This program is less a game, and more a utility to invoke catharsis. And to paraphrase Darth Vader, I find your lack of newline characters disturbing.'
