TITLE ЛР_7
;------------------------------------------------------------------------------
; Дисципліна: Архітектура комп'ютера
; НТУУ "КПІ"
; Факультет: ФІОТ
; Курс: 1
; Група: ІТ-01
;------------------------------------------------------------------------------
; Автор: Трусов, Колесник, Бойко
;----------------------------I.ЗАГОЛОВОК ПРОГРАМИ------------------------------
ideal
model small 
stack 512
;-----------------------II.ПОЧАТОК СЕГМЕНТУ ДАНИХ------------------------------
dataseg
    ; Масив в якому буде знайдено найменше число
    array   dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,9999h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,8888h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,2222h,1111h,0009h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h
            dw 1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h,1111h

    len dw 100h
    string db 254
    str_len db 0
    db 254 dup ('*')

    ; Системні повідомлення виводу 
    system_message_1 db "input command and press enter: " ,'$'
    system_message_2 db "program end" ,'$'
    ; Повідомлення для формування головного меню 
    message_0 db "lab7 it-01 team6", 13, 10, '$'
    message_1 db "g - for count", 13, 10, '$'
    message_2 db "h - for beep", 13, 10, '$'
    message_3 db "c - for min value", 13, 10, '$' 
    message_3_3 db "k - for exit", 13, 10, '$' 
    message_4 db "end", 13, 10, '$'
    message_5 db "press any key", 13, 10, '$'

    message db ?

    ; Налаштування для роботи зі звуком
    number_cycles equ 2000
    frequency equ 600
    port_b equ 61h
    command_reg equ 43h 
    channel_2 equ 42h
    symbol db ?
;-----------------------III. ПОЧАТОК СЕГМЕНТУ КОДУ------------------------------
codeseg

    start:
        mov ax, @data ; ax <- @data
        mov ds, ax ; ds <- ax
        mov es, ax ; es <- ax

    main_cycle: ; Основний цикл програми
        call display_menu ; Вивід головного меню на екран
   
        mov ah, 0ah ; ah <- 0ah 
        mov dx, offset string ; Надсилання в dx початок буфера
        int 21h 

        xor ax, ax
        mov bx, offset string ; Надсилання в bx початок буфера
        mov ax, [bx+1] ; Занесення в ax знаку введеного з клавіатури
        shr ax, 8 ; Зсув в регістрі ах
        ; Порівняння отриманого знаку та виконання відповідної операції
        cmp ax, 67h; g ascii = 67h
        je count
        cmp ax, 68h; h ascii = 68h
        je beep
        cmp ax, 63h; c ascii = 63h
        je find_min
        cmp ax, 6bh; k ascii = 6bh
        je exit
        jmp main_cycle

    ; Розрахунок виразу
    count:
        mov dx, offset message_5
        call display_string
        call math
        jmp main_cycle
    ; Подача звукового сигналу
    beep:
        mov dx, offset message_5 
        call display_string
        call sound
        jmp main_cycle
    ; Пошуку мінімального значення в масиві
    find_min:
        mov dx, offset message_5 
        call display_string
        call sort 
        jmp main_cycle
    ; Вихід з програми
    exit:
        mov dx, offset message_4 
        call display_string
        mov ah,04ch
        int 21h
    ;-----ДОПОМІЖНІ ПРОЦЕДУРИ-----
    ;Процедура виводу головного меню
    proc display_menu
        mov ah, 0
        mov al, 3
        int 10h
        mov dx, offset message_0
        call display_string
        mov dx, offset message_1
        call display_string
        mov dx, offset message_2
        call display_string
        mov dx, offset message_3
        call display_string
        mov dx, offset message_3_3
        call display_string
        mov dx, offset system_message_1
        call display_string
        ret
    endp display_menu
    ;Процедура виводу рядку з dx
    proc display_string
        mov ah,9
        int 21h
        xor dx, dx
        ret
    endp display_string 
    ;Процедура для відтворення звукового сигналу
    proc sound
        lab7:
        int 16h             ; зберігає отримане значення з клавіатури в змінній 
        mov [symbol], al
        cmp [symbol], 'e'   ; перевірка на відповідність і встановлення прапору ознаки 0
        jz exit             ; перехід на exit: у випадку відповідності 
                            ;встановлення частоти 440 гц
                            ;дозвіл каналу 2 встановлення порту в мікросхеми 8255
        in al,port_b        ;читання
        or al,3             ;встановлення двох молодших бітів
        out port_b,al       ;пересилка байта в порт b мікросхеми 8255
                            ;встановлення регістрів порту вводу-виводу
        mov al,10110110b    ;біти для каналу 2
        out command_reg,al  ;байт в порт командний регістр
                            ;встановлення лічильника 
        mov ax,2705         ;лічильник = 1190000/440
        out channel_2,al    ;відправка al
        mov al,ah           ;відправка старшого байту в al
        out channel_2,al    ;відправка старшого байту 

        ;пауза
        mov cx, 50
        classic_loop:
            mov bx,cx
            mov ah,86h
            xor cx,cx
            mov dx,20000
            int 15h
            mov cx,bx 
        loop classic_loop

                            ;вимкнення звуку 
        in al,port_b        ;отримуємо байт з порту в
        and al,11111100b    ;скидання двох молодших бітів
        out port_b,al       ;пересилка байтів в зворотному напрямку
        ret
    endp sound

    ;Процедура для розрахунку математичного виразу
    proc math
        mov ax, -7
        mov bx, 3
        add ax, bx
        mov cl, 2h
        imul cl
        mov bl, 4
        idiv bl
        mov bl, 1
        add al, bl

        call output
        ret
    endp math
    ;Процедура для виводу числового значення
    proc output

        mov [es:0105h],' '
        mov [es:0104h],' '
        mov [es:0103h],' '
        mov [es:010h],' '
        mov [es:0101h],' '
        mov di,0100h  

        push cx
        push dx
        push bx
        mov bx,10
        xor cx,cx
        
    flag1:   
        xor dx,dx
        div bx
        push dx
        inc cx
        test ax,ax
        jnz flag1
    flag2:   
        pop ax
        add al,'0'
        stosb
        loop flag2

        pop bx
        pop dx
        pop cx 

        mov [es:0105h],'$'
        mov dx, 100h
        mov ah,09h 
        int 21h

        ;пауза для відображення виведеного повідомлення
        mov cx, 100
        classic_loop2:
            mov bx, cx
            mov  ah,86h
            xor cx, cx
            mov  dx,20000
            int  15h
            mov cx, bx 
        loop classic_loop2

        ret 
    endp output

    ;Процедура для сортування масиву
    proc sort 
        lea si, array
        mov cx, len    
            push    bx
            push    cx
            push    dx
            push    si
            push    di

            mov     bx,     si
            mov     dx,     cx
            dec     dx
            shl     dx,     1               
            dec     cx                      
            mov     si,     0
        fori:
            mov     di,     dx             
        forj:                                 
            mov     ax,     [bx+di]       
            cmp     ax,     [bx+di-2]
            jbe     nextj                
            xchg    ax,     [bx+di]         
            xchg    ax,     [bx+di-2]       
            xchg    ax,     [bx+di]         
        nextj:
            sub     di,     2              
            cmp     di,     si             
            ja      forj
            add     si,     2              
            loop    fori
        mov ax, [ds:01feh]
        call output       

        pop di
        pop si
        pop dx
        pop cx
        pop bx

        ret
    endp sort  

end start