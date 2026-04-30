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
	.globl _SpriteManagerRemoveSprite
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
;SpriteBullet.c:7: void START(void* data) {
;	---------------------------------
; Function Start_SpriteBullet
; ---------------------------------
_Start_SpriteBullet::
;SpriteBullet.c:8: }
	ret
___bank_SpriteBullet	=	0x00ff
;SpriteBullet.c:10: void UPDATE(void) {
;	---------------------------------
; Function Update_SpriteBullet
; ---------------------------------
_Update_SpriteBullet::
;SpriteBullet.c:12: if (THIS->y > BULLET_MIN_Y + BULLET_SPEED) {
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	b, (hl)
	ld	c, a
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
;SpriteBullet.c:13: THIS->y -= BULLET_SPEED;
	ld	de, #0xfffc
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	ret
00102$:
;SpriteBullet.c:15: SpriteManagerRemoveSprite(THIS);
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
;SpriteBullet.c:17: }
	jp	_SpriteManagerRemoveSprite
;SpriteBullet.c:19: void DESTROY(void) {
;	---------------------------------
; Function Destroy_SpriteBullet
; ---------------------------------
_Destroy_SpriteBullet::
;SpriteBullet.c:20: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
