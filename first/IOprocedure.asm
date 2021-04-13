;----------------------------------------------

;TITLE Offset
;
;INCLUDE Irvine32.inc
;
;.data
;
;.code
;
;main	PROC
;
;	call DumpRegs
;main ENDP
;
;END main

;----------------------------------------------

TITLE Offset

INCLUDE Irvine32.inc

.data
	buffer		BYTE 21 DUP(0)
	byteCount	DWORD ?
.code

main	PROC
;	ReadString : 문자열읽어오는 기능
;	버퍼의 오프셋을 EDX에 넣고	
;   버퍼의 사이즈를 ECX에 넣고 ㄱ(Null문자때문에 +1 알지?)
;	르니까 ecx에 넣은 숫자만큼의 문자를 읽어서 edx에 넣어주겠다는 말이지
;	입력한 문자의 수는 eax에 기록됨

	mov edx, OFFSET buffer
	mov ecx, SIZEOF buffer
	call ReadString

	mov byteCount, eax	; 입력한 문자의 수는 eax에 기록됨

	call DumpRegs
	
;	DumpMem은 메모리 덤프뜨는거임.
;	esi에 출력할 애의 주소를 넣고
;	ecx에 출력할 갯수를 넣어주고
;	ebx에 몇 바이트 단위로 출력할건지
	mov esi, OFFSET buffer
	mov ecx, LENGTHOF buffer
	mov ebx, TYPE buffer
	
	call DumpMem
;	SetTextColor : 글자색, 배경색 지정가능
;	컬러표는 교안 참고 ㄱ
;	AX레지에 넣어주면 됨. 뒤에 2바이트는 글자색, 앞 2바이트는 배경색
	call DumpRegs
	mov		eax, 0
	mov		ax,	1h
	call SetTextColor
	call DumpRegs
	
	mov		eax, 0
	mov		ax,	2h
	call SetTextColor
	call DumpRegs
	
main ENDP

END main