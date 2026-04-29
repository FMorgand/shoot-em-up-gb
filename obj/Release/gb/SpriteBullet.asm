;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteBullet
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SpriteBullet
	.globl _Update_SpriteBullet
	.globl _Start_SpriteBullet
	.globl ___bank_SpriteBullet
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_255
;SpriteBullet.c:8: void START(void) {
;	---------------------------------
; Function Start_SpriteBullet
; ---------------------------------
_Start_SpriteBullet::
;SpriteBullet.c:9: }
	ret
___bank_SpriteBullet	=	0x00ff
;SpriteBullet.c:11: void UPDATE(void) {
;	---------------------------------
; Function Update_SpriteBullet
; ---------------------------------
_Update_SpriteBullet::
	dec	sp
	dec	sp
;SpriteBullet.c:13: if (THIS->y > BULLET_MIN_Y + BULLET_SPEED) {
	ld	a, (#_THIS)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_THIS + 1)
	ldhl	sp,	#1
	ld	(hl), a
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x0c
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00102$
;SpriteBullet.c:14: THIS->y -= BULLET_SPEED;
	ld	de, #0xfffc
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jr	00104$
00102$:
;SpriteBullet.c:16: THIS->marked_for_removal = 1;
	pop	de
	push	de
	ld	hl, #0x001e
	add	hl, de
	ld	(hl), #0x01
00104$:
;SpriteBullet.c:18: }
	inc	sp
	inc	sp
	ret
;SpriteBullet.c:20: void DESTROY(void) {
;	---------------------------------
; Function Destroy_SpriteBullet
; ---------------------------------
_Destroy_SpriteBullet::
;SpriteBullet.c:21: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
