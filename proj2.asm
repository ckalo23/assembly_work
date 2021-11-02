.model small ;small supports one data segment and one code segment
.stack 100h	 ;used to push and pop registers/store return address when subroutine called
.data ;creates near data segment for frequently used data
  intro db 10,13,'Welcome to the Roman Numeral converter program.',10,13,10,13,'$'
  prompt db 10,13,'Enter number to convert to roman numeral: ','$'
  reply db 10,13,'The roman numeral representation is: ','$'
  endl db 10,13,'$'
  num_input dw ?
  color db 4fh
  quotient dw ?
  rem dw ?

.code ;start of assembly code segment
	extrn indec: proc
	include myMacros.asm

main proc
  mov ax,@data ;mov address of data segment to ax register
  mov ds,ax ;set ds to ax
  scrClear
  scrColor color

  prtStr intro
  call getInput

  prtStr reply
  call convertRoman
  prtStr endl

  mov ah,4ch
  int 21h
main endp

getInput proc
  push ax
	prtStr prompt
	call indec
	mov num_input,ax
  pop ax
	ret
getInput endp

convertRoman proc
  mov ax,num_input
  xor dx,dx
  mov rem,0

  mov bx,1000
  cmp ax,bx
  jl l1
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g:
  mov dl,77
  mov ah,2
  int 21h
loop g
  mov ax,rem
  xor dx,dx
  mov rem,0

l1:

  mov bx,900
  cmp ax,bx
  jl l2
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g1:
  mov dl,67
  mov ah,2
  int 21h

  mov dl,77
  mov ah,2
  int 21h
loop g1
  mov ax,rem
  xor dx,dx
  mov rem,0
  jmp l5

l2:

  mov bx,500
  cmp ax,bx
  jl l3
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g2:
  mov dl,68
  mov ah,2
  int 21h
loop g2
  mov ax,rem
  xor dx,dx
	mov rem,0
  jmp l3

l3:

  mov bx,400
  cmp ax,bx
  jl l4
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g3:
  mov dl,67
  mov ah,2
  int 21h

  mov dl,68
  mov ah,2
  int 21h
loop g3
  mov ax,rem
  xor dx,dx
	mov rem,0
  jmp l5

l4:

  mov bx,100
  cmp ax,bx
  jl l5
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g4:
  mov dl,67
  mov ah,2
  int 21h
loop g4
  mov ax,rem
  xor dx,dx
  mov rem,0

l5:

  mov bx,90
  cmp ax,bx
  jl l6
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g5:
  mov dl,88
  mov ah,2
  int 21h

  mov dl,67
  mov ah,2
  int 21h
loop g5
  mov ax,rem
  xor dx,dx
	mov rem,0
  jmp l9

l6:

  mov bx,50
  cmp ax,bx
  jl l7
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g6:
  mov dl,76
  mov ah,2
  int 21h
loop g6
  mov ax,rem
  xor dx,dx
	mov rem,0
  jmp l8

l7:

  mov bx,40
  cmp ax,bx
  jl l8
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g7:
  mov dl,88
  mov ah,2
  int 21h

  mov dl,76
  mov ah,2
  int 21h
loop g7
  mov ax,rem
  xor dx,dx
	mov rem,0
  jmp l9

l8:

  mov bx,10
  cmp ax,bx
  jl l9
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g8:
  mov dl,88
  mov ah,2
  int 21h
loop g8
  mov ax,rem
  xor dx,dx
  mov rem,0

l9:

  mov bx,9
  cmp ax,bx
  jl l10
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g9:
  mov dl,73
  mov ah,2
  int 21h

  mov dl,88
  mov ah,2
  int 21h
loop g9
  mov ax,rem
  xor dx,dx
	mov rem,0
  jmp end

l10:

  mov bx,5
  cmp ax,bx
  jl l11
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g10:
  mov dl,86
  mov ah,2
  int 21h
loop g10
  mov ax,rem
  xor dx,dx
	mov rem,0
  jmp l12

l11:

  mov bx,4
  cmp ax,bx
  jl l12
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g11:
  mov dl,73
  mov ah,2
  int 21h
loop g11
  mov dl,86
  mov ah,2
  int 21h

  mov ax,rem
  xor dx,dx
	mov rem,0
  jmp end

l12:

  mov bx,1
  cmp ax,bx
  jl end
  div bx
  mov quotient,ax
  mov rem,dx
  xor ax,ax
  xor dx,dx
  mov cx,quotient
g12:
  mov dl,73
  mov ah,2
  int 21h
loop g12
  mov ax,rem
  xor dx,dx
  mov rem,0

end:
  ret
convertRoman endp

end main ; end of asssembly code segment
