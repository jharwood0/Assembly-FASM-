format ELF executable 3
entry start

segment readable executable

start:
;display welcome message
mov     eax,4             ; System call 'write'
mov     ebx,1             ; 'stdout'
mov     ecx,message           ; Address of message
mov     edx,message_length      ; Length  of message
int     0x80              ; All system calls are done via this interrupt

mov     eax,1             ; System call 'exit'
xor     ebx,ebx           ; Exitcode: 0 ('xor ebx,ebx' saves time; 'mov ebx, 0' would be slower)
int     0x80

;================== data =====================
segment readable writeable
;=============================================

message db 'Hello World!',0xA ; 0xA is ascii for line free
message_length = $-message
