;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpritePlayer
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SpritePlayer
	.globl _Update_SpritePlayer
	.globl _Start_SpritePlayer
	.globl _EMU_printf
	.globl _SpriteManagerAddEx
	.globl _TranslateSprite
	.globl ___bank_SpritePlayer
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
___EMU_PROFILER_INIT:
	.ds 2
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
;SpritePlayer.c:25: void START(void* data) {
;	---------------------------------
; Function Start_SpritePlayer
; ---------------------------------
_Start_SpritePlayer::
;SpritePlayer.c:26: player_form   = FORM_OFFENSIVE;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0024
	add	hl, de
	ld	(hl), #0x00
;SpritePlayer.c:27: fire_cooldown = 0;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0025
	add	hl, de
	ld	(hl), #0x00
;SpritePlayer.c:30: THIS->x -= 8;
	ld	a, (_THIS)
	ld	c, a
	ld	hl, #_THIS + 1
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	add	a, #0xf8
	ld	e, a
	ld	a, h
	adc	a, #0xff
	ld	d, a
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;SpritePlayer.c:32: }
	ret
___bank_SpritePlayer	=	0x00ff
;SpritePlayer.c:34: void UPDATE(void) {
;	---------------------------------
; Function Update_SpritePlayer
; ---------------------------------
_Update_SpritePlayer::
	add	sp, #-10
;SpritePlayer.c:35: INT8 dx = 0;
	ld	c, #0x00
;SpritePlayer.c:36: INT8 dy = 0;
	ldhl	sp,	#9
	ld	(hl), #0x00
;SpritePlayer.c:40: if (KEY_TICKED(J_B)) {
	ld	hl, #(_joypads + 1)
	ld	b, (hl)
	ld	a, (#(_old_joypads + 1) + 0)
	xor	a, b
	and	a, b
	bit	5, a
	jr	Z, 00102$
;SpritePlayer.c:41: player_form = (player_form == FORM_OFFENSIVE) ? FORM_DEFENSIVE : FORM_OFFENSIVE;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0024
	add	hl, de
	ld	a, (hl)
	or	a, a
	ld	a, #0x01
	jr	Z, 00136$
	xor	a, a
00136$:
	ld	(hl), a
00102$:
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
;SpritePlayer.c:47: if (fire_cooldown > 0) {
	ld	l, a
	ld	de, #0x0025
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;SpritePlayer.c:48: fire_cooldown--;
	dec	a
	ld	(hl), a
00104$:
;SpritePlayer.c:50: if (KEY_PRESSED(J_A) && fire_cooldown == 0) {
	ld	a, (#(_joypads + 1) + 0)
	bit	4, a
	jr	Z, 00106$
;SpritePlayer.c:41: player_form = (player_form == FORM_OFFENSIVE) ? FORM_DEFENSIVE : FORM_OFFENSIVE;
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
;SpritePlayer.c:50: if (KEY_PRESSED(J_A) && fire_cooldown == 0) {
	ld	hl, #0x0025
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
;SpritePlayer.c:51: player_form = FORM_OFFENSIVE;
	ld	hl, #0x0024
	add	hl, de
	ld	(hl), #0x00
;SpritePlayer.c:52: SpriteManagerAdd(SpriteBullet, THIS->x + 4, THIS->y);
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_THIS
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/SpriteManager.h:45: return SpriteManagerAddEx(sprite_type, x, y, NULL);
	push	bc
	ld	hl, #0x0000
	push	hl
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	a, #0x01
	call	_SpriteManagerAddEx
	pop	bc
;SpritePlayer.c:53: fire_cooldown = FIRE_COOLDOWN;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0025
	add	hl, de
	ld	(hl), #0x0f
00106$:
;SpritePlayer.c:41: player_form = (player_form == FORM_OFFENSIVE) ? FORM_DEFENSIVE : FORM_OFFENSIVE;
	ld	a, (#_THIS)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (#_THIS + 1)
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0024
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
;SpritePlayer.c:57: speed = (player_form == FORM_OFFENSIVE) ? SPEED_SLOW : SPEED_FAST;
	or	a, a
	jr	NZ, 00137$
	ld	b, #0x01
	jr	00138$
00137$:
	ld	b, #0x03
00138$:
	ldhl	sp,	#4
	ld	(hl), b
;SpritePlayer.c:60: if (KEY_PRESSED(J_LEFT))  dx = -1;
	ld	hl, #(_joypads + 1)
	ld	b, (hl)
	bit	1, b
	jr	Z, 00109$
	ld	c, #0xff
00109$:
;SpritePlayer.c:61: if (KEY_PRESSED(J_RIGHT)) dx = 1;
	bit	0, b
	jr	Z, 00111$
	ld	c, #0x01
00111$:
;SpritePlayer.c:62: if (KEY_PRESSED(J_UP))    dy = -1;
	bit	2, b
	jr	Z, 00113$
	ldhl	sp,	#9
	ld	(hl), #0xff
00113$:
;SpritePlayer.c:63: if (KEY_PRESSED(J_DOWN))  dy = 1;
	bit	3, b
	jr	Z, 00115$
	ldhl	sp,	#9
	ld	(hl), #0x01
00115$:
;SpritePlayer.c:66: UINT8 spd_diag = (player_form == FORM_OFFENSIVE) ? SPEED_SLOW_DIAG : SPEED_FAST_DIAG;
	or	a, a
	jr	NZ, 00139$
	ld	b, #0x01
	jr	00140$
00139$:
	ld	b, #0x02
00140$:
;SpritePlayer.c:70: dx = (dx > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00316$
	bit	7, d
	jr	NZ, 00317$
	cp	a, a
	jr	00317$
00316$:
	bit	7, d
	jr	Z, 00317$
	scf
00317$:
	ld	a, #0x00
	rla
	ldhl	sp,	#5
	ld	(hl), a
;SpritePlayer.c:71: dy = (dy > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
	ldhl	sp,	#9
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00318$
	bit	7, d
	jr	NZ, 00319$
	cp	a, a
	jr	00319$
00318$:
	bit	7, d
	jr	Z, 00319$
	scf
00319$:
	ld	a, #0x00
	rla
	ldhl	sp,	#6
	ld	(hl), a
;SpritePlayer.c:68: if (dx != 0 && dy != 0) {
	ld	a, c
	or	a, a
	jr	Z, 00121$
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00121$
;SpritePlayer.c:70: dx = (dx > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
	xor	a, a
	sub	a, b
	ld	e, a
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00141$
	ld	c, b
	jr	00142$
00141$:
	ld	c, e
00142$:
;SpritePlayer.c:71: dy = (dy > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00144$
	ld	b, e
00144$:
	ldhl	sp,	#9
	ld	(hl), b
	jr	00122$
00121$:
;SpritePlayer.c:74: if (dx != 0) dx = (dx > 0) ? (INT8)speed : -(INT8)speed;
	ldhl	sp,	#4
	ld	b, (hl)
	xor	a, a
	sub	a, b
	ld	e, a
	ld	a, c
	or	a, a
	jr	Z, 00117$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
	ld	c, b
	jr	00146$
00145$:
	ld	c, e
00146$:
00117$:
;SpritePlayer.c:75: if (dy != 0) dy = (dy > 0) ? (INT8)speed : -(INT8)speed;
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00122$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00147$
	ld	e, b
00147$:
	ldhl	sp,	#9
	ld	(hl), e
00122$:
;SpritePlayer.c:79: INT16 new_x = (INT16)THIS->x + (INT16)dx;
	ld	hl, #_THIS
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, c
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, de
	ld	c, l
	ld	b, h
;SpritePlayer.c:80: INT16 new_y = (INT16)THIS->y + (INT16)dy;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;SpritePlayer.c:82: INT16 world_min_y = scroll_y + PLAYER_SCREEN_MIN_Y;
	ld	hl, #_scroll_y
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
;SpritePlayer.c:83: INT16 world_max_y = scroll_y + PLAYER_SCREEN_MAX_Y;
	ld	hl, #_scroll_y
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0080
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;SpritePlayer.c:84: if (new_x < PLAYER_MIN_X)  new_x = PLAYER_MIN_X;
	ld	a, c
	sub	a, #0x08
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00125$
	ld	bc, #0x0008
00125$:
;SpritePlayer.c:85: if (new_x > PLAYER_MAX_X)  new_x = PLAYER_MAX_X;
	ld	a, #0x90
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00127$
	ld	bc, #0x0090
00127$:
;SpritePlayer.c:86: if (new_y < world_min_y)   new_y = world_min_y;
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00320$
	bit	7, d
	jr	NZ, 00321$
	cp	a, a
	jr	00321$
00320$:
	bit	7, d
	jr	Z, 00321$
	scf
00321$:
	jr	NC, 00129$
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
00129$:
;SpritePlayer.c:87: if (new_y > world_max_y)   new_y = world_max_y;
	ldhl	sp,	#8
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00322$
	bit	7, d
	jr	NZ, 00323$
	cp	a, a
	jr	00323$
00322$:
	bit	7, d
	jr	Z, 00323$
	scf
00323$:
	jr	NC, 00131$
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
00131$:
;SpritePlayer.c:89: TranslateSprite(THIS, (INT8)(new_x - (INT16)THIS->x), (INT8)(new_y - (INT16)THIS->y));
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	ld	e, (hl)
	dec	hl
	dec	hl
	sub	a, e
	ld	d, a
	ld	a, c
	ld	c, (hl)
	sub	a, c
	push	de
	inc	sp
	ld	hl, #_THIS
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_TranslateSprite
;SpritePlayer.c:41: player_form = (player_form == FORM_OFFENSIVE) ? FORM_DEFENSIVE : FORM_OFFENSIVE;
	ld	a, (_THIS)
	ld	c, a
	ld	hl, #_THIS + 1
	ld	b, (hl)
;SpritePlayer.c:90: EMU_printf("x=%d y=%d coll_w=%d coll_h=%d\n", THIS->x, THIS->y, THIS->coll_w, THIS->coll_h);
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_THIS
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	inc	hl
	ld	d, #0x00
	push	de
	ld	e, (hl)
	inc	hl
	inc	hl
	ld	d, #0x00
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	push	bc
	ld	de, #___str_0
	push	de
	call	_EMU_printf
;SpritePlayer.c:91: }
	add	sp, #20
	ret
___str_0:
	.ascii "x=%d y=%d coll_w=%d coll_h=%d"
	.db 0x0a
	.db 0x00
;SpritePlayer.c:93: void DESTROY(void) {
;	---------------------------------
; Function Destroy_SpritePlayer
; ---------------------------------
_Destroy_SpritePlayer::
;SpritePlayer.c:94: }
	ret
	.area _CODE_255
	.area _INITIALIZER
__xinit____EMU_PROFILER_INIT:
	.dw _EMU_profiler_message
	.area _CABS (ABS)
