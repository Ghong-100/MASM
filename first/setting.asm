;TITLE 세팅테스트 (setting.asm)
;INCLUDE Irvine32.inc
;.data
;
;.code
;
;main	PROC
;		exit
;		
;		
;main	ENDP
;END		main
;;--------------------------------------------
;
;TITLE Add and Subtract
;
;INCLUDE Irvine32.inc
;
;.code
;main PROC
;
;	mov eax, 10000h	;	EAX = 10000h
;	call DumpRegs	; 레지스터 찍자
;	
;	add eax, 40000h ;	EAX = 50000h
;	call DumpRegs	; 레지스터 찍자
;	
;	sub eax, 20000h ;	EAX = 30000h
;	call DumpRegs	; 레지스터 찍자
;	
;exit		; 프로그램 종료
;
;main ENDP	; 프로시저 종료
;END main	; 어셈플된 프로그램의 마지막

;TITLE Add and Subtract
;
;.386		; 요구 최소 CPU사양
;.model flat, stdcall ; 세그멘테이션 모델 정의, 프로시저 매개 변수 전달.  stdcall은 ms-window 함수 호출
;.stack 4096		; 스택사이즈
;ExitProcess PROTO, dwExitCode:DWORD
;DumpRegs PROTO
;.code
;main PROC
;
;	mov eax, 10000h	;	EAX = 10000h
;	call DumpRegs	; 레지스터 찍자
;	
;	add eax, 40000h ;	EAX = 50000h
;	call DumpRegs	; 레지스터 찍자
;	
;	sub eax, 20000h ;	EAX = 30000h
;	call DumpRegs	; 레지스터 찍자
;
;	INVOKE ExitProcess, 0		; 프로그램 종료
;
;main ENDP	; 프로시저 종료
;END main	; 어셈플된 프로그램의 마지막


;TITLE Add and Subtract	; 작성 양식, 만든사람, 버전, 수정 날짜
;
;INCLUDE Irvine32.inc
;
;.data
;	; 변수는 이제 여따 선언할고임
;	val1	BYTE	10h
;	val2	DWORD	40000h
;	val3	DWORD	20000h
;	finalval DWORD 	?
;.code
;main PROC
;	; 실행 프로그램
;	mov ah, 0
;	mov al, val1
;
;	call DumpRegs
;	exit
;main ENDP
;
;	; 추가적인 프로시저는 여기
;
;END main
;
;;	eax : extended ax(+16bit)
;;	ax : al + ah

;TITLE Add and Subtract	; 작성 양식, 만든사람, 버전, 수정 날짜
;
;INCLUDE Irvine32.inc
;
;.data
;	var1	WORD	1234h
;	var2	WORD	?
;	var3	SWORD	-2h
;.code
;main PROC
;	; 실행 프로그램
;	mov eax, 0
;	mov ebx, 0
;	mov ax, var1
;	mov var2, ax
;	;mov ebx, var2		; 이건 에러임. 크기가 달라 ebx는 4고 var2는 word(2) 임.
;	mov bx, var2
;	
;	; 그래서 필요한게 '확장'임
;	; 부호가 없으면 제로확장, 부호가 있으면 부호확장
;	mov eax, 0
;	mov ax, var1
;	; 이게 제로확장임ㅋ 0박아주고 넣어주는거
;
;	mov ebx, 0FFFFFFFFh
;	mov bx, var3
;
;	call DumpRegs
;	exit
;main ENDP
;
;	; 추가적인 프로시저는 여기
;
;END main


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


;
;TITLE Offset	; 사실상 주소값 받아오는거임
;
;INCLUDE Irvine32.inc
;
;.data
;	bVal	BYTE 	?
;	wVal	WORD	?
;	dVal	DWORD	?
;	dVal2	DWORD	?
;.code
;
;main	PROC
;
;	mov		esi, OFFSET bVal
;	call DumpRegs
;
;	mov		esi, OFFSET wVal
;	call DumpRegs
;
;	mov		esi, OFFSET dVal
;	call DumpRegs
;main ENDP
;END main
;

;TITLE 	포인터다아아앙ㅇ
;
;INCLUDE Irvine32.inc
;
;.data
;	myDb	DWORD	12345678h
;.code
;
;main	PROC
;	mov eax, 0
;	mov ax, WORD PTR [myDb+1]	; 인자로 넣어준 애가 가르키고있는 곳에서 WORD만큼을 읽어와라
;	call DumpRegs
;main ENDP
;
;END main



;TITLE 타입	; 단일 원소의 크기를 바이트 단위로 반환
;
;INCLUDE Irvine32.inc
;
;.data
;	val1	BYTE	?
;	val2	WORD	?
;	val3	DWORD	?
;	val4	QWORD	?
;.code
;
;main	PROC
;	mov eax, 0
;	mov eax, TYPE val1
;	call DumpRegs
;
;		mov eax, 0
;	mov eax, TYPE val2
;	call DumpRegs
;
;		mov eax, 0
;	mov eax, TYPE val3
;	call DumpRegs
;
;		mov eax, 0
;	mov eax, TYPE val4
;	call DumpRegs
;main ENDP
;END main




;TITLE LENGTHOF	; 레이블과 같은 줄에 있는 값들로 정의되는 배열에 포함된 원소의 개수를 반환함
;
;INCLUDE Irvine32.inc
;
;.data
;	b1		BYTE		1,2,3
;	ar1		WORD		30 DUP(?), 0, 0
;	ar2		WORD		5 DUP(3 DUP(?))
;	ar3		DWORD		1,2,3,4
;	digstr	BYTE		"123456789"
;.code
;
;main	PROC
;	mov		eax,	0
;	mov		eax,	LENGTHOF b1
;	call DumpRegs
;
;	mov		eax,	0
;	mov		eax,	LENGTHOF ar1
;	call DumpRegs
;
;	mov		eax,	0
;	mov		eax,	LENGTHOF ar2
;	call DumpRegs
;
;	mov		eax,	0
;	mov		eax,	LENGTHOF ar3
;	call DumpRegs
;
;	mov		eax,	0
;	mov		eax,	LENGTHOF digstr
;	call DumpRegs
;main ENDP
;
;END main
;


TITLE PTR

INCLUDE Irvine32.inc

	PBYTE	TYPEDEF	PTR	BYTE
	PWORD	TYPEDEF	PTR	WORD
	PDWORD	TYPEDEF	PTR	DWORD

.data
	arrayB BYTE 10h, 20h, 30h
	arrayW WORD 1, 2, 3
	arrayD DWORD 4, 5, 6
	ptr1 PBYTE arrayB
	ptr2 PWORD arrayW
	ptr3 PDWORD arrayD
.code

main	PROC

	mov eax, 0
	mov esi, ptr1
	mov al, [esi]
	call DumpRegs
	
	mov esi, ptr2
	mov ax, [esi]
	call DumpRegs
	
	mov esi, ptr3
	mov ax, [esi]
	call DumpRegs
	
	mov ax, [esi+16]
	call DumpRegs

main ENDP

END main