.386
.model flat, stdcall
.stack 4096
include Irvine32.inc         ; Include the Irvine32 library header
ExitProcess PROTO, dwExitCode:DWORD

.data
evenvar BYTE "Even", 0
oddvar BYTE "Odd", 0
B0 BYTE ?
.code
main PROC
    MOV EAX, 00110110b       
    MOV B0, AL               

    ; XOR operations 
    SHR EAX, 1               
    XOR B0, AL               
    SHR EAX, 1
    XOR B0, AL               
    SHR EAX, 1
    XOR B0, AL
    SHR EAX, 1
    XOR B0, AL
    SHR EAX, 1
    XOR B0, AL
    SHR EAX, 1
    XOR B0, AL
    SHR EAX, 1
    XOR B0, AL               

    AND B0, 1                

    CMP B0, 1                ; Check if B0 has an odd parity
    JE lOdd
    JMP lEven

lEven:
    MOV EDX, OFFSET evenvar  
    JMP lEnd

lOdd:
    MOV EDX, OFFSET oddvar   

lEnd:
    CALL Crlf
    CALL WriteString         ; Print "Even" or "Odd" based on parity
    CALL Crlf

    INVOKE ExitProcess, 0
main ENDP
END main
