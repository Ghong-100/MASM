;TITLE �����׽�Ʈ (setting.asm)
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
;	call DumpRegs	; �������� ����
;	
;	add eax, 40000h ;	EAX = 50000h
;	call DumpRegs	; �������� ����
;	
;	sub eax, 20000h ;	EAX = 30000h
;	call DumpRegs	; �������� ����
;	
;exit		; ���α׷� ����
;
;main ENDP	; ���ν��� ����
;END main	; ����õ� ���α׷��� ������

;TITLE Add and Subtract
;
;.386		; �䱸 �ּ� CPU���
;.model flat, stdcall ; ���׸����̼� �� ����, ���ν��� �Ű� ���� ����.  stdcall�� ms-window �Լ� ȣ��
;.stack 4096		; ���û�����
;ExitProcess PROTO, dwExitCode:DWORD
;DumpRegs PROTO
;.code
;main PROC
;
;	mov eax, 10000h	;	EAX = 10000h
;	call DumpRegs	; �������� ����
;	
;	add eax, 40000h ;	EAX = 50000h
;	call DumpRegs	; �������� ����
;	
;	sub eax, 20000h ;	EAX = 30000h
;	call DumpRegs	; �������� ����
;
;	INVOKE ExitProcess, 0		; ���α׷� ����
;
;main ENDP	; ���ν��� ����
;END main	; ����õ� ���α׷��� ������


;TITLE Add and Subtract	; �ۼ� ���, ������, ����, ���� ��¥
;
;INCLUDE Irvine32.inc
;
;.data
;	; ������ ���� ���� �����Ұ���
;	val1	BYTE	10h
;	val2	DWORD	40000h
;	val3	DWORD	20000h
;	finalval DWORD 	?
;.code
;main PROC
;	; ���� ���α׷�
;	mov ah, 0
;	mov al, val1
;
;	call DumpRegs
;	exit
;main ENDP
;
;	; �߰����� ���ν����� ����
;
;END main
;
;;	eax : extended ax(+16bit)
;;	ax : al + ah

;TITLE Add and Subtract	; �ۼ� ���, ������, ����, ���� ��¥
;
;INCLUDE Irvine32.inc
;
;.data
;	var1	WORD	1234h
;	var2	WORD	?
;	var3	SWORD	-2h
;.code
;main PROC
;	; ���� ���α׷�
;	mov eax, 0
;	mov ebx, 0
;	mov ax, var1
;	mov var2, ax
;	;mov ebx, var2		; �̰� ������. ũ�Ⱑ �޶� ebx�� 4�� var2�� word(2) ��.
;	mov bx, var2
;	
;	; �׷��� �ʿ��Ѱ� 'Ȯ��'��
;	; ��ȣ�� ������ ����Ȯ��, ��ȣ�� ������ ��ȣȮ��
;	mov eax, 0
;	mov ax, var1
;	; �̰� ����Ȯ���Ӥ� 0�ھ��ְ� �־��ִ°�
;
;	mov ebx, 0FFFFFFFFh
;	mov bx, var3
;
;	call DumpRegs
;	exit
;main ENDP
;
;	; �߰����� ���ν����� ����
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
;TITLE Offset	; ��ǻ� �ּҰ� �޾ƿ��°���
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

;TITLE 	�����ʹپƾƾӤ�
;
;INCLUDE Irvine32.inc
;
;.data
;	myDb	DWORD	12345678h
;.code
;
;main	PROC
;	mov eax, 0
;	mov ax, WORD PTR [myDb+1]	; ���ڷ� �־��� �ְ� ����Ű���ִ� ������ WORD��ŭ�� �о�Ͷ�
;	call DumpRegs
;main ENDP
;
;END main



;TITLE Ÿ��	; ���� ������ ũ�⸦ ����Ʈ ������ ��ȯ
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




;TITLE LENGTHOF	; ���̺�� ���� �ٿ� �ִ� ����� ���ǵǴ� �迭�� ���Ե� ������ ������ ��ȯ��
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