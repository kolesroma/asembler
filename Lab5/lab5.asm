TITLE lab5
;------------------------------------------------------------------------------
;ЛР N5 
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
    ;roma
    mov bx, '2'
    mov [DS:[55h]], bx
    mov bx, '7'
    mov [DS:[56h]], bx
    mov bx, '1'
    mov [DS:[57h]], bx
    mov bx, '1'
    mov [DS:[58h]], bx
    mov bx, '2'
    mov [DS:[59h]], bx
    mov bx, '0'
    mov [DS:[5Ah]], bx
    mov bx, '0'
    mov [DS:[5Bh]], bx
    mov bx, '2'
    mov [DS:[5Ch]], bx

    ;dasha
    mov bx, '3'
    mov [DS:[65h]], bx
    mov bx, '1'
    mov [DS:[66h]], bx
    mov bx, '0'
    mov [DS:[67h]], bx
    mov bx, '1'
    mov [DS:[68h]], bx
    mov bx, '2'
    mov [DS:[69h]], bx
    mov bx, '0'
    mov [DS:[6Ah]], bx
    mov bx, '0'
    mov [DS:[6Bh]], bx
    mov bx, '3'
    mov [DS:[6Ch]], bx

    ;ser gay
    mov [DS:[75h]], bx
    mov bx, '7'
    mov [DS:[76h]], bx
    mov bx, '1'
    mov [DS:[77h]], bx
    mov bx, '1'
    mov [DS:[78h]], bx
    mov bx, '2'
    mov [DS:[79h]], bx
    mov bx, '0'
    mov [DS:[7Ah]], bx
    mov bx, '0'
    mov [DS:[7Bh]], bx
    mov bx, '2'
    mov [DS:[7Ch]], bx

;roma
    mov bx, '2'
    mov [DS:[85h]], bx
    mov bx, '7'
    mov [DS:[86h]], bx
    mov bx, '1'
    mov [DS:[87h]], bx
    mov bx, '1'
    mov [DS:[88h]], bx
    mov bx, '2'
    mov [DS:[89h]], bx
    mov bx, '0'
    mov [DS:[8Ah]], bx
    mov bx, '0'
    mov [DS:[8Bh]], bx
    mov bx, '2'
    mov [DS:[8Ch]], bx

    ;dasha
    mov bx, '3'
    mov [DS:[95h]], bx
    mov bx, '1'
    mov [DS:[96h]], bx
    mov bx, '0'
    mov [DS:[97h]], bx
    mov bx, '1'
    mov [DS:[98h]], bx
    mov bx, '2'
    mov [DS:[99h]], bx
    mov bx, '0'
    mov [DS:[9Ah]], bx
    mov bx, '0'
    mov [DS:[9Bh]], bx
    mov bx, '3'
    mov [DS:[9Ch]], bx

    ;ser gay
    mov [DS:[0A5h]], bx
    mov bx, '7'
    mov [DS:[0A6h]], bx
    mov bx, '1'
    mov [DS:[0A7h]], bx
    mov bx, '1'
    mov [DS:[0A8h]], bx
    mov bx, '2'
    mov [DS:[0A9h]], bx
    mov bx, '0'
    mov [DS:[0AAh]], bx
    mov bx, '0'
    mov [DS:[0ABh]], bx
    mov bx, '2'
    mov [DS:[0ACh]], bx

    ;dasha
    mov bx, '3'
    mov [DS:[0B5h]], bx
    mov bx, '1'
    mov [DS:[0B6h]], bx
    mov bx, '0'
    mov [DS:[0B7h]], bx
    mov bx, '1'
    mov [DS:[0B8h]], bx
    mov bx, '2'
    mov [DS:[0B9h]], bx
    mov bx, '0'
    mov [DS:[0BAh]], bx
    mov bx, '0'
    mov [DS:[0BBh]], bx
    mov bx, '3'
    mov [DS:[0BCh]], bx

    ;ser gay
    mov [DS:[0C5h]], bx
    mov bx, '7'
    mov [DS:[0C6h]], bx
    mov bx, '1'
    mov [DS:[0C7h]], bx
    mov bx, '1'
    mov [DS:[0C8h]], bx
    mov bx, '2'
    mov [DS:[0C9h]], bx
    mov bx, '0'
    mov [DS:[0CAh]], bx
    mov bx, '0'
    mov [DS:[0CBh]], bx
    mov bx, '2'
    mov [DS:[0CCh]], bx

    
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


    PROC sort
        nextscan:            
            mov bx,cx
            mov si,0 
        nextcomp:
            mov al,[array2Db+si]
            mov dl,[array2Db+si+1]
            cmp al,dl
            jnc noswap 
            mov [array2Db+si], dl
            mov [array2Db+si+1], al
        noswap: 
            inc si
            dec bx
            jnz nextcomp
            loop nextscan
        ret
    ENDP


   
;http://www.dailyfreecode.com/Code/assembly-language-sort-given-series-1795.aspx

end Start
