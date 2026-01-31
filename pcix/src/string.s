	.text
	.globl  _strcpy
_strcpy:
~~m=.
|        sub     ax,ax           | tell csv that I don't have any locals
|        call    csv             | check stack crash, save bp, si & di
	push bp
	mov bp,sp
	push di
	push si
~dst=4
~src=6
~cnt=8
	mov     si,*~src(bp)    | load si with source pointer
	mov     di,*~dst(bp)    | load di with destination pointer
	mov     bx, di          | save address to return
L25:                            | start of loop
	movb    al, (si)        | fetch source char in al
	movb    (di), al        | place in destination
	inc     si              | increment source pointer
	inc     di              | increment destination pointer
	andb    al, al          | set the flags
	jnz     L25             | Loop until zf=1
	mov     ax, bx          | return destination pointer
	jmp     cret            | and return to caller.

	.globl  _strncpy
_strncpy:
|        sub     ax,ax           | tell csv I don't have any local variables
|        call    csv             | save si, di, bp, check for collision
	push bp
	mov bp,sp
	push di
	push si
	mov     si,*~src(bp)    | load source operand
	mov     di,*~dst(bp)    | load destination operand
	mov     cx,*~cnt(bp)    | load count
	mov     bx,di           | save address of source for return
	cmp     cx,0            | see if cx set
	je      L27             | loop out if so.
L26:    movb    al,(si)         | fetch ahcecter to move
	movb    (di),al         | store it.
	inc     di              | increment destination
	and     al, al          | set flags
	jz      L28             | if char is null, skip
	inc     si              |  increment of source (this will null pad)
L28:    loop    L26             | loop until count is 0
L27:    mov     ax, bx          | get address of dest in ax
	jmp     cret            | and return it to caller.

	.globl  _strchr

_strchr:
	mov     bx, sp          | usr bx as adr register
	mov     ax, *4(bx)      | fetch charecter in al
	mov     bx, *2(bx)      | fetch address in bx
	j       L31             | skip to start of while loop

L29:
	cmpb    al, ah          | see if charecters match
	je      L30             | jmp out if true
	inc     bx              | move to next charecter in string

L31:
	movb    ah,(bx)         | fetch charecter in ah
	andb    ah, ah          | set flags on that char
	jnz     L29             | if not end of string, loop up
	sub     ax, ax          | else at end of string,
	ret                     | return with NULL in ax

L30:    mov     ax, bx          | if found char, exit with
	ret                     | address in ax

	.data
