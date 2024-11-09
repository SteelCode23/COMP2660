.386
.model flat, stdcall
.stack 4096
include Irvine32.inc        ; Include the Irvine32 library header
ExitProcess PROTO, dwExitCode:DWORD

.data
	val1 DWORD 100
	X DWORD ?
.code
main PROC
		mov ecx, 99
		mov edx, 98
		mov eax, val1
		cmp eax, ecx ;first expression
		ja L1
		jmp next
	L1: cmp ecx, edx ;second expression
		ja L2
		jmp next
	L2: mov X, 1
		jmp endstatement
	next:
		mov X, 2
	endstatement:
		
	INVOKE ExitProcess, 0
main ENDP


END main