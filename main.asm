.386 ; 386 Processor Instruction Set
.model flat,stdcall ; Flat memory model and stdcall method
option casemap:none ; Case Sensitive

include \masm32\include\windows.inc 
include \masm32\include\kernel32.inc 
includelib \masm32\lib\kernel32.lib  

.data
output db "Welcome to F&O's Magical Music Box", 0ah, 0h

.code 
start: 

invoke GetStdHandle, STD_OUTPUT_HANDLE

invoke WriteConsole, eax, addr output, sizeof output, ebx, NULL

invoke ExitProcess, 0

end start 
