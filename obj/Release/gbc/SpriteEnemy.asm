;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemy
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SpriteEnemy
	.globl _Update_SpriteEnemy
	.globl _Start_SpriteEnemy
	.globl _SpriteManagerRemoveSprite
	.globl _CheckCollision
	.globl ___bank_SpriteEnemy
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
;SpriteEnemy.c:7: void START(void) {
;	---------------------------------
; Function Start_SpriteEnemy
; ---------------------------------
_Start_SpriteEnemy::
;SpriteEnemy.c:8: enemy_hp = 1;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0024
	add	hl, de
	ld	(hl), #0x01
;SpriteEnemy.c:9: }
	ret
___bank_SpriteEnemy	=	0x00ff
;SpriteEnemy.c:11: void UPDATE(void) {
;	---------------------------------
; Function Update_SpriteEnemy
; ---------------------------------
_Update_SpriteEnemy::
	dec	sp
;SpriteEnemy.c:14: SPRITEMANAGER_ITERATE(i, spr) {
	ld	hl, #_sprite_manager_updatables + 1
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	(hl), #0x00
00108$:
	ld	a, (#_sprite_manager_updatables + 0)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	Z, 00110$
;SpriteEnemy.c:15: if (spr->type == SpriteBullet && CheckCollision(THIS, spr)) {
	ld	hl, #0x001d
	add	hl, bc
	ld	a, (hl)
	dec	a
	jr	NZ, 00109$
	push	bc
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	call	_CheckCollision
	pop	bc
	or	a, a
	jr	Z, 00109$
;SpriteEnemy.c:16: SpriteManagerRemoveSprite(spr);
	ld	e, c
	ld	d, b
	call	_SpriteManagerRemoveSprite
;SpriteEnemy.c:17: if (--enemy_hp == 0) {
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0024
	add	hl, de
	dec	(hl)
	jr	NZ, 00109$
;SpriteEnemy.c:18: SpriteManagerRemoveSprite(THIS);
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	inc	sp
	jp	_SpriteManagerRemoveSprite
;SpriteEnemy.c:19: return;
	jr	00110$
00109$:
;SpriteEnemy.c:14: SPRITEMANAGER_ITERATE(i, spr) {
	ldhl	sp,	#0
	inc	(hl)
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ld	hl, #_sprite_manager_updatables
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	jr	00108$
00110$:
;SpriteEnemy.c:23: }
	inc	sp
	ret
;SpriteEnemy.c:25: void DESTROY(void) {
;	---------------------------------
; Function Destroy_SpriteEnemy
; ---------------------------------
_Destroy_SpriteEnemy::
;SpriteEnemy.c:26: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
