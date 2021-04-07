TITLE Vihidni kod 2.1
;------------------------------------------------------------------------------
;ЛР No1.2 Кодування Кіріліца Windows-1251
;------------------------------------------------------------------------------
; TEAM - 6 dahsha roma ser gay. IT-01 FICT
;----------------I.ЗАГОЛОВОК ПРОГРАМИ------------------------
IDEAL
MODEL SMALL
STACK 512
;-----------------------II.МАКРОСИ--------------------------------------
; Складний макрос для ініціалізації
MACRO M_Init
    ; Початок макросу
    mov ax, @data ; ax <- @data
    mov ds, ax
    ; ds <- ax
    mov es, ax
    ; es <- ax
ENDM M_Init
;----------------------------II.МАКРОСИ---------------------------------------- 	 	
; Складний макрос для ініціалізації 
MACRO M_Init	;Початок макросу 
mov	ax, @data	; ax <- @data
mov	ds, ax	    ; ds <- ax
mov	es, ax	    ; es <- ax 
ENDM M_Init

;--------------------III.ПОЧАТОК СЕГМЕНТУ ДАНИХ--------------
DATASEG
;Оголошення двовимірного експериментального масиву 16х16 
array2Db db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    db 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h, 6h
    
    

;-----------------------VI. ПОЧАТОК СЕГМЕНТУ КОДУ-------------------------------
CODESEG

Start:	
M_Init
    mov ah, [array2Db] ; Запис масиву у старші біти регістру ah
    mov bx, 00h
    mov [bx], ah

;Пряма адресація 
    mov bx, 'R'
    mov [DS:[55h]], bx
    mov bx, 'D'
    mov [DS:[66h]], bx
    mov bx, 'S'
    mov [DS:[77h]], bx

    mov bx, 'R'
    mov [DS:[88h]], bx
    mov bx, 'D'
    mov [DS:[99h]], bx
    mov bx, 'S'
    mov [DS:[0AAh]], bx

    mov bx, 'R'
    mov [DS:[0BBh]], bx
    mov bx, 'D'
    mov [DS:[0CCh]], bx
    mov bx, 'S'
    mov [DS:[0DDh]], bx

    mov bx, 'T'
    mov [DS:[0Ah]], bx
    mov bx, 'e'
    mov [DS:[0Bh]], bx
    mov bx, 'a'
    mov [DS:[0Ch]], bx
    mov bx, 'm'
    mov [DS:[0Dh]], bx
    mov bx, '-'
    mov [DS:[0Eh]], bx
    mov bx, '6'
    mov [DS:[0Fh]], bx
end Start
