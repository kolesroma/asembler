;I.ЗАГОЛОВОК ПРОГРАМИ
TITLE  MyIcon.exe
IDEAL			; Директива - тип Асемблера tasm 
MODEL small		; Директива - тип моделі пам’яті 
STACK 1024	; Директива - розмір стеку 
				
				;II.ПОЧАТОК СЕГМЕНТУ ДАНИХ 
DATASEG
	topRow equ 08  ; задаємо константи координат відповідних елементів
	botROw equ 13
	leftCol equ 20
	currRow db 00		; задаємо змінну для зберігання поточного рядку меню
	menu db 0c9h, 25 DUP(0cdh),0bbh			; задаємо саме меню
	db 0bah, 'What day is today        ', 0bah
	db 0bah, 'Count                    ', 0bah
	db 0bah, 'Press to pay respect ears', 0bah
	db 0bah, 'Abandon                  ', 0bah
	db 0c8h, 25 DUP(0cdh),0bch
	help db  'To select item use Arrow up/down'			; створюємо текст-підказку
	db 'end then press enter.'
	db 10,13,'Press Esc to exit.'
	msg1 db "Thu, May 20 ",10,13,'$' ;day
	buffStart db 254

	exCode db 0 ; вихідний код
CODESEG

Start:
	mov ax,@data	; @data ідентифікатор, що створюються директивою model
	mov ds, ax	; Завантаження початку сегменту даних в регістр ds
	mov es, ax	; иніціалізація регістру ES
	call clear		; викликаємо процедуру заповнення заднього фону
	call printMenu  ; 	створюємо меню
	inerface:
	
	call waiting	; переходимо в режим очікування дій користувача
	call clear		; очищуємо екран
	call printMenu		; відновлюємо меню
	
	cmp currRow,topRow+1		; перевіряємо вибір користувача
	je printDay				; переходимо до показу даних групи
	
	cmp currRow,topRow+2
	je count					; переходимо до обчислення виразу
	
	cmp currRow,topRow+3
	je sound					; переходимо до створення звуку
	
	cmp currRow,topRow+4
	je exit						; переходимо до точки виходу
	
	jmp inerface				; надаємо користувачу знову можливість вибору
	
	printDay:
	mov currRow,0				; обнуляємо вибраний рядок
	call show					; показуємо дані групи
	jmp inerface				; повертаємо керування користувачу
	
	count:
	mov currRow,0			
	call execute				; виконуємо обрахунок
	jmp inerface
	
	sound:
	mov currRow,0
	call beep					; створюємо звук
	jmp inerface
	
	exit:
	mov ah,4ch					; завершуємо програму
	mov al,[exCode]
	int 21h
;-------------Процедури----------------
	proc clear
	push ax 	; запамятовуємо усі регістри, з якими будемо працювати
	push cx
	push bx
	push dx
	mov ax, 0600h			; задаємо функцію, що очистить наш екран
	mov bh,30h				; задаємо колір фону
	mov cx,00				; задаємо координа верхнього лівого кута фону
	mov dx, 184Fh			; задаємо координа правого нижнього кута фону
	int 10h					; викликаємо функцію очистки
	mov ax,1300h			; задаємо функцію виведення рядка на екран
	mov bx,71h				; колір рядка
	lea bp,[help]			; вводимо адресу рядка
	mov cx, 72				; довжина рядка
	mov dh,botROw+8			; лінія, на якій буде знаходитися
	mov dl, 0				; колонка, де знаходиться перший символ рядка
	int 10h					; викликаємо функцію виводу
	pop dx					; повертаємо значення
	pop bx
	pop cx
	pop ax
	ret
	endp
	
	proc printMenu
	push ax				
	push cx
	push bx
	push dx
	mov ax,1300h			; задаємо функцію виводу рядка
	mov bx,71h				; зажаємо колір рядка
	lea bp,[menu]			; адреса рядка
	mov cx, 27				; його довжина
	mov dh,topRow			; координати початку
	mov dl, leftCol
	Q: 
	int 10h					; виклик функції
	add bp,27				; перехід до наступного рядка
	inc dh					; зміщення на рядок на екрані
	cmp dh,botROw+1			; поки не дійде до останнього - 
	jne Q					; повторююємо виклик
	pop dx
	pop bx
	pop cx
	pop ax
	ret
	endp
	
	proc waiting
	mov currRow,topRow			; задаємо початкови рядок
	w: mov ah, 08h				; задаємо функцію очікування клавіші
	int 21h						; викликаємо її
	cmp al,0					; визначаємо це клавіша відповідає стандартному кодуванню ASCII
	jne skip					; якщо, то переходимо до пункту перевірки таких клавіш
	int 21h						; якщо клавіша відповідає розшареному коду ASCII, визначаємо його
	cmp al,50h					; якщо клавіша - стрілка вниз, переходимо до нижнього рядка
	je up
	cmp al,48h					; якщо стрілка вгору - до попереднього рядка
	je down
	skip:						; якщо ж клавіша з стандартного кодування
	cmp al,1Bh					; якщо це ESC - виходимо з програми
	jne skip2
	mov ah, 4ch
	mov al,[exCode]
	int 21h
	skip2:
	cmp al, 0Dh					; якщо це Enter -  повертаємось в точку виклику даної процедури
	jne w
	ret
	
	up:
	mov bh,currRow   			; записуємо в регістр поточний рядок
	inc bh						; збільшуємо його номер
	cmp bh,botROw				; перевіряємо, чи не виходить він за межі
	jnl zero
	mov currRow,bh				; задаємо нове значення поточного рядка
	jmp last					; переходимо до його вибору
	
	down:
	mov bh,currRow				
	dec bh						; так само вибираємо рядок, але зменшуємо його номер
	cmp bh,topRow				; перевіряємо чи не виходить він за межі
	jng max
	mov currRow,bh				; задаємо нове значення
	jmp last
	
	max:
	mov currRow,botROw-1		; при досягненні верхньої межі, задаємо найнижчий рядок
	jmp last
	
	zero:
	mov currRow,topRow+1		; при досягненні нижньої - задаємо верхній рядок
	last:
	push dx						
	push bx
	push ax
	push cx
	mov ax,1300h				; задаємо функцію, яка перемальовує меню, всі параметри аналогічні попереднім
	lea bp,[menu]				
	mov dh, topRow
	mov cx, 27
	mov dl, leftCol
	Q1:
	mov bx,71h					; задаємо колір за замовчуванням
	cmp dh,currRow				; коли доходимо до вибраного рядка, інвертуємо кольори
	jne stateColor
	mov bx,17h
	stateColor:
	int 10h						
	add bp,27
	inc dh
	cmp dh,botROw+1
	jne Q1
	pop cx
	pop ax
	pop bx
	pop dx
	jmp w
	endp
	
	proc show
	push ax
	push cx
	push bx
	push dx
	mov ax,1300h			; задаємо функцію виводу рядка
	mov bx,71h				; задаємо колір
	lea bp,[msg1]			; задаємо зміщення
	mov cx, 30				; встановлюємо довжину
	mov dh,topRow-4			; координати початку
	mov dl, 10
	int 10h					; вивід даних
	pop dx
	pop bx
	pop cx
	pop ax
	ret
	endp
	
	PROC execute

		mov ax, -7 ; запис а1 до ах

		mov bx, 3 ; записл а2 до bx
		add ax, bx ; додавання а1 і а2
		
		mov bx, 2 ; запис а3 до bx
		imul bx ; ділення на а3

		mov bl, 4 ; запис а4 до bl
		idiv bl ; ділення на а4
		
		mov bl, 3 ; запис а5 до bl
		add al, bl ; додавання а5

		add al, '0' ; переведення у строку 
		mov [ES:0201h], ' ' ; запис виводу до ES
		mov [ES:0202h], ' ' ; запис виводу до ES
		mov [ES:0203h], al ; запис виводу до ES
		mov [ES:0204h], ' ' ; запис виводу до ES
		mov [ES:0205h], ' ' ; запис виводу до ES
		push ax
		push cx
		push bx
		push dx
		mov ax,1300h			; функція виводу
		mov bx,71h				; колір повідомлення
		lea bp,[ES:0201h]		; адреса рядка
		mov cx, 5				; довжина рядка на екрані
		mov dh,topRow-4			; координати початку
		mov dl, 10				
		int 10h					; вивід результату
		pop dx
		pop bx
		pop cx
		pop ax
		ret
	endp
	
	PROC beep
		in al, 61h ; отримати стан динаміка
		push ax ; зберігаємо його
		or al, 3
		out 61h, al
		or al, 10110110b ; встановлюємо біти для каналу 
		out 43h, al ; ввімкнути динамік
		mov ax, 2662 ; частота звуку
		out 42h, al ; ввімкнути таймер, який видає імпульси до динаміку
		mov al, ah  ; ah -> al
		out 42h, al ; відправка старшого байту
		
		mov cx,0030h ;старше слово паузи
		mov dx,0000h ; молодше слово паузи
		mov ah,86h ; функция 86h
		int 15h ; пауза


		pop ax ; отримуємо дефолтний стан
		and AL, 11111100B ; скидаємо два молодших біти
		out 61h, AL ; вимкнення динаміку
		ret
	endp beep
end Start
	
	
			
