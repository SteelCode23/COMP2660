; Encryption Program (Encrypt.asm)
INCLUDE Irvine32.inc

BUFMAX = 128 ; maximum buffer size
.data
count = 10
array DWORD 10, -20,4, 5 ,-35, 44, -60, 2, 0, 23
positive_sum_text BYTE "The sum of positive numbers is ", 0
negative_count_text BYTE "The count of negative numbers is ", 0
positive_sum DWORD 0 
negative_count DWORD 0
;1) Sum only the positive values
;2) Count the number of negative values
;3) Display the sum and the count after the loop finishes.

.code
main PROC

mov ecx, count
lea esi, array
XOR EDX, EDX ;Clear registers
XOR EAX, EAX ;Clear registers

L1:
mov ebx, [esi]
CMP ebx, 0

JL count_negative

add_positive: ;1) Sum only the positive values
ADD EAX, ebx
jmp next

count_negative: ;2) Count the number of negative values
inc edx  ;counter
next:

ADD esi, 4

loop L1

;Store Results
MOV [positive_sum], eax
mov [negative_count], edx
call print_results
main ENDP

print_results PROC ;3) Display the sum and the count after the loop finishes.
		MOV eax	, [positive_sum]
		MOV EDX, OFFSET positive_sum_text   
		call CrLF
		CALL WriteString 
		call WriteDec
		call CrLF
		mov eax, [negative_count] ;
		MOV EDX, OFFSET negative_count_text
		call CrLF
		CALL WriteString 
		call WriteDec
		call CrLF
print_results ENDP
END main