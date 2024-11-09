; Encryption Program (Encrypt.asm)
INCLUDE Irvine32.inc

BUFMAX = 128 ; maximum buffer size
KeyLength = 7 ;Define length of encryption key
.data
sPrompt BYTE "Enter the plain text:",0
KEYString BYTE "ABXmv#7", 0; key
sEncrypt BYTE "Cipher text: ",0
sDecrypt BYTE "Decrypted: ",0
buffer BYTE BUFMAX+1 DUP(0)
bufSize DWORD ?
.code
main PROC
 call InputTheString ; input the plain text
 call TranslateBuffer ; encrypt the buffer
 mov edx,OFFSET sEncrypt ; display encrypted

 call DisplayMessage
 call TranslateBuffer ; decrypt the buffer
 mov edx,OFFSET sDecrypt ; display decrypted

 call DisplayMessage
 exit
main ENDP
;-----------------------------------------------------
InputTheString PROC
;
; Prompts user for a plaintext string. Saves the string
; and its length.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
 pushad ; save 32-bit registers
 mov edx,OFFSET sPrompt ; display a prompt
 call WriteString
 mov ecx,BUFMAX ; maximum character count
 mov edx,OFFSET buffer ; point to the buffer
 call ReadString ; input the string
 mov bufSize,eax ; save the length
 call Crlf
 popad
 ret
InputTheString ENDP
;-----------------------------------------------------
DisplayMessage PROC
;
; Displays the encrypted or decrypted message.
; Receives: EDX points to the message
; Returns: nothing
;-----------------------------------------------------
 pushad
 call WriteString

 mov edx,OFFSET buffer ; display the buffer
 call WriteString
 call Crlf
 call Crlf
 popad
 ret
DisplayMessage ENDP
;-----------------------------------------------------
TranslateBuffer PROC
;
; Translates the string by exclusive-ORing each
; byte with the encryption key byte.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
 pushad
 mov ecx,bufSize ; loop counter
 mov esi,0 ; index 0 in buffer
 mov edx, 0; Encryption key length
 ;Add a loop to loop through the key
 ;Loops through the input string
L1:
 
 MOV BL, KEYString[EDX]
 xor buffer[esi],BL
 inc esi ; point to next byte
 
 CMP EDX, KeyLength ;Check if encryption key counter has reached limit.
 JGE L3 ;If so, reset it to 0
 JMP L4 ;If not, skip.
 L3:
	MOV EDX, 0 ;Reset encryption key counter.
	JMP L5 ;If resetting counter, dont increment EDX
 L4:
	INC EDX
 L5:
 loop L1
 popad
 ret
TranslateBuffer ENDP
END main