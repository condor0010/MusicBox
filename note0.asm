; Audio module for Project (PlayerMove.asm)
;INCLUDE Maze.inc
; Defined values
includelib   C:\masm32\lib\winmm.lib
include      Irvine32.inc

; Define the function
PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

.data
file BYTE "c:\Irvine\8bitSurf_Slow.wav", 0
SND_FILENAME DWORD 00020000h
SND_LOOP DWORD 000000008h
SND_ASYNC DWORD 00000001h

.code
temp PROC
    mov eax, SND_ASYNC
    add eax, SND_LOOP
    INVOKE PlaySound, OFFSET file, NULL, eax
    ret
temp endp
; END directive; not main procedure so don't indicate starting point
END