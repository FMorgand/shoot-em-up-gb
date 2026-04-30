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
;SpriteEnemy.c:27: void START(void* data) {
;	---------------------------------
; Function Start_SpriteEnemy
; ---------------------------------
_Start_SpriteEnemy::
;SpriteEnemy.c:28: enemy_move  = (UINT8)(UINT16)data;  // comportement passé via SpriteManagerAddEx
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	bc, #0x0025
	add	hl, bc
	ld	(hl), e
;SpriteEnemy.c:29: enemy_timer = 0;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0026
	add	hl, de
	ld	(hl), #0x00
;SpriteEnemy.c:30: enemy_phase = 0;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0027
	add	hl, de
	ld	(hl), #0x00
;SpriteEnemy.c:28: enemy_move  = (UINT8)(UINT16)data;  // comportement passé via SpriteManagerAddEx
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
;SpriteEnemy.c:33: switch (enemy_move) {
	ld	hl, #0x0025
	add	hl, de
	ld	c, (hl)
;SpriteEnemy.c:34: case MOVE_SINE:  enemy_hp = ENEMY_SINE_HP;  break;
	ld	hl, #0x0024
	add	hl, de
;SpriteEnemy.c:33: switch (enemy_move) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00102$
;SpriteEnemy.c:34: case MOVE_SINE:  enemy_hp = ENEMY_SINE_HP;  break;
	ld	(hl), #0x01
	ret
;SpriteEnemy.c:35: default:         enemy_hp = ENEMY_BASIC_HP; break;
00102$:
	ld	(hl), #0x01
;SpriteEnemy.c:36: }
;SpriteEnemy.c:37: }
	ret
___bank_SpriteEnemy	=	0x00ff
_sine_dx:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0x00	;  0
;SpriteEnemy.c:39: static void UpdateMovement(void) {
;	---------------------------------
; Function UpdateMovement
; ---------------------------------
_UpdateMovement:
;SpriteEnemy.c:40: switch (enemy_move) {
	ld	a, (_THIS)
	ld	c, a
	ld	hl, #_THIS + 1
	ld	b, (hl)
	ld	hl, #0x0025
	add	hl, bc
	ld	e, (hl)
	ld	a, #0x04
	sub	a, e
	ret	C
;SpriteEnemy.c:45: if (++enemy_timer >= ENEMY_BASIC_MOVE_EVERY) {
	ld	hl, #0x0026
	add	hl, bc
	ld	c, l
	ld	b, h
;SpriteEnemy.c:40: switch (enemy_move) {
	ld	d, #0x00
	ld	hl, #00136$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	jp	(hl)
00136$:
	.dw	00112$
	.dw	00102$
	.dw	00105$
	.dw	00112$
	.dw	00112$
;SpriteEnemy.c:44: case MOVE_LINE:
00102$:
;SpriteEnemy.c:45: if (++enemy_timer >= ENEMY_BASIC_MOVE_EVERY) {
	ld	a, (bc)
	inc	a
	ld	(bc), a
	sub	a, #0x03
	ret	C
;SpriteEnemy.c:46: enemy_timer = 0;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0026
	add	hl, de
	ld	(hl), #0x00
;SpriteEnemy.c:40: switch (enemy_move) {
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	b, (hl)
;SpriteEnemy.c:47: THIS->y += 1;
	ld	c, a
	inc	bc
	inc	bc
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;SpriteEnemy.c:49: break;
	ret
;SpriteEnemy.c:51: case MOVE_SINE:
00105$:
;SpriteEnemy.c:52: if (++enemy_timer >= ENEMY_SINE_MOVE_EVERY) {
	ld	a, (bc)
	inc	a
	ld	(bc), a
	sub	a, #0x02
	ret	C
;SpriteEnemy.c:53: enemy_timer = 0;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0026
	add	hl, de
	ld	(hl), #0x00
;SpriteEnemy.c:40: switch (enemy_move) {
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	b, (hl)
;SpriteEnemy.c:47: THIS->y += 1;
	ld	c, a
	inc	bc
	inc	bc
;SpriteEnemy.c:54: THIS->y += 1;
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;SpriteEnemy.c:55: THIS->x = (UINT16)((INT16)THIS->x + (INT16)sine_dx[enemy_phase & 31u] * ENEMY_SINE_AMPLITUDE);
	ld	a, (_THIS)
	ld	c, a
	ld	hl, #_THIS + 1
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	add	a, #0x27
	ld	l, a
	jr	NC, 00137$
	inc	h
00137$:
	ld	a, (hl)
	and	a, #0x1f
	add	a, #<(_sine_dx)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_sine_dx)
	ld	h, a
	ld	a, (hl)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, de
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;SpriteEnemy.c:40: switch (enemy_move) {
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
;SpriteEnemy.c:56: enemy_phase += ENEMY_SINE_PERIOD;
	ld	l, a
	ld	de, #0x0027
	add	hl, de
	inc	(hl)
;SpriteEnemy.c:64: }
00112$:
;SpriteEnemy.c:65: }
	ret
;SpriteEnemy.c:67: void UPDATE(void) {
;	---------------------------------
; Function Update_SpriteEnemy
; ---------------------------------
_Update_SpriteEnemy::
	dec	sp
;SpriteEnemy.c:72: if (THIS->y >= (UINT16)scroll_y + DEVICE_SCREEN_PX_HEIGHT) {
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (_scroll_y)
	ld	hl, #_scroll_y + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0090
	add	hl, de
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	C, 00102$
;SpriteEnemy.c:73: SpriteManagerRemoveSprite(THIS);
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	inc	sp
	jp	_SpriteManagerRemoveSprite
;SpriteEnemy.c:74: return;
	jr	00112$
00102$:
;SpriteEnemy.c:80: SPRITEMANAGER_ITERATE(i, spr) {
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
00110$:
	ld	a, (#_sprite_manager_updatables + 0)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	Z, 00112$
;SpriteEnemy.c:81: if (spr->type == SpriteBullet && CheckCollision(THIS, spr)) {
	ld	hl, #0x001d
	add	hl, bc
	ld	a, (hl)
	dec	a
	jr	NZ, 00111$
	push	bc
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	call	_CheckCollision
	pop	bc
	or	a, a
	jr	Z, 00111$
;SpriteEnemy.c:82: SpriteManagerRemoveSprite(spr);
	ld	e, c
	ld	d, b
	call	_SpriteManagerRemoveSprite
;SpriteEnemy.c:83: if (--enemy_hp == 0) {
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0024
	add	hl, de
	dec	(hl)
	jr	NZ, 00111$
;SpriteEnemy.c:84: SpriteManagerRemoveSprite(THIS);
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	inc	sp
	jp	_SpriteManagerRemoveSprite
;SpriteEnemy.c:85: return;
	jr	00112$
00111$:
;SpriteEnemy.c:80: SPRITEMANAGER_ITERATE(i, spr) {
	ldhl	sp,	#0
	inc	(hl)
	ld	c, (hl)
	xor	a, a
	ld	b, a
	inc	bc
	ld	hl, #_sprite_manager_updatables
	add	hl, bc
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	jr	00110$
00112$:
;SpriteEnemy.c:89: }
	inc	sp
	ret
;SpriteEnemy.c:91: void DESTROY(void) {
;	---------------------------------
; Function Destroy_SpriteEnemy
; ---------------------------------
_Destroy_SpriteEnemy::
;SpriteEnemy.c:92: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
