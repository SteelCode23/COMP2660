.386
.model flat, stdcall
.stack 4096
include Irvine32.inc        ; Include the Irvine32 library header
ExitProcess PROTO, dwExitCode:DWORD

.data
	array DWORD 4 DUP(0)
.code
main PROC

	mov eax, 10
	mov esi, 0
	call proc_1
	add esi,4
	add eax, 10
	mov array[esi], eax; array[4] = 40
	


	mov ecx, 4
	mov esi, 0
	L1:
	
		mov eax, array[esi]
	
		call CrLF
		call WriteDec
		call CrLF
		ADD ESI, 4
	loop L1

	INVOKE ExitProcess, 0
main ENDP

proc_1 PROC
	call proc_2
	add esi, 4
	add eax, 10
	mov array[esi], eax ; array[3] = 30
	ret
proc_1 ENDP
proc_2 PROC
	call proc_3
	add esi, 4
	add eax, 10
	mov array[esi], eax; array[1] = 20
	ret
proc_2 ENDP
proc_3 PROC
	mov array[esi], eax ;array[0] = 10
	ret
proc_3 ENDP
END main