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
	.globl ___bank_SpritePlayer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_GG_STATE	=	0x0000
_GG_EXT_7BIT	=	0x0001
_GG_EXT_CTL	=	0x0002
_GG_SIO_SEND	=	0x0003
_GG_SIO_RECV	=	0x0004
_GG_SIO_CTL	=	0x0005
_GG_SOUND_PAN	=	0x0006
_MEMORY_CTL	=	0x003e
_JOY_CTL	=	0x003f
_VCOUNTER	=	0x007e
_PSG	=	0x007f
_HCOUNTER	=	0x007f
_VDP_DATA	=	0x00be
_VDP_CMD	=	0x00bf
_VDP_STATUS	=	0x00bf
_JOY_PORT1	=	0x00dc
_JOY_PORT2	=	0x00dd
_FMADDRESS	=	0x00f0
_FMDATA	=	0x00f1
_AUDIOCTRL	=	0x00f2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_RAM_CONTROL	=	0xfffc
_GLASSES_3D	=	0xfff8
_MAP_FRAME0	=	0xfffd
_MAP_FRAME1	=	0xfffe
_MAP_FRAME2	=	0xffff
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
;SpritePlayer.c:27: void START(void) {
;	---------------------------------
; Function Start_SpritePlayer
; ---------------------------------
_Start_SpritePlayer::
;SpritePlayer.c:28: player_form = FORM_OFFENSIVE;
	ld	hl, (_THIS)
	ld	bc, #0x0024
	add	hl, bc
	ld	(hl), #0x00
;SpritePlayer.c:29: }
	ret
___bank_SpritePlayer	=	0x00ff
;SpritePlayer.c:31: void UPDATE(void) {
;	---------------------------------
; Function Update_SpritePlayer
; ---------------------------------
_Update_SpritePlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
;SpritePlayer.c:32: INT8 dx = 0;
	ld	c, #0x00
;SpritePlayer.c:33: INT8 dy = 0;
	ld	-5 (ix), #0x00
;SpritePlayer.c:37: if (KEY_TICKED(J_B)) {
	ld	hl, #(_joypads + 1)
	ld	b, (hl)
	ld	a, (#(_old_joypads + 1) + 0)
	xor	a, b
	and	a, b
	bit	4, a
	jr	Z, 00102$
;SpritePlayer.c:38: player_form = (player_form == FORM_OFFENSIVE) ? FORM_DEFENSIVE : FORM_OFFENSIVE;
	ld	hl, (_THIS)
	ld	de, #0x0024
	add	hl, de
	ld	a, (hl)
	or	a, a
	ld	a, #0x01
	jr	Z, 00130$
	xor	a, a
00130$:
	ld	(hl), a
00102$:
	ld	hl, (_THIS)
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	de, #36
	add	hl, de
	ld	a, (hl)
;SpritePlayer.c:45: speed = (player_form == FORM_OFFENSIVE) ? SPEED_SLOW : SPEED_FAST;
	or	a, a
	ld	e, #0x01
	jr	Z, 00132$
	ld	e, #0x03
00132$:
;SpritePlayer.c:48: if (KEY_PRESSED(J_LEFT))  dx = -1;
	ld	hl, #(_joypads + 1)
	ld	b, (hl)
	bit	2, b
	jr	Z, 00104$
	ld	c, #0xff
00104$:
;SpritePlayer.c:49: if (KEY_PRESSED(J_RIGHT)) dx = 1;
	bit	3, b
	jr	Z, 00106$
	ld	c, #0x01
00106$:
;SpritePlayer.c:50: if (KEY_PRESSED(J_UP))    dy = -1;
	bit	0, b
	jr	Z, 00108$
	ld	-5 (ix), #0xff
00108$:
;SpritePlayer.c:51: if (KEY_PRESSED(J_DOWN))  dy = 1;
	bit	1, b
	jr	Z, 00110$
	ld	-5 (ix), #0x01
00110$:
;SpritePlayer.c:54: UINT8 spd_diag = (player_form == FORM_OFFENSIVE) ? SPEED_SLOW_DIAG : SPEED_FAST_DIAG;
	or	a, a
	ld	a, #0x01
	jr	Z, 00134$
	ld	a, #0x02
00134$:
	ld	-2 (ix), a
;SpritePlayer.c:58: dx = (dx > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
	xor	a, a
	sub	a, c
	jp	PO, 00288$
	xor	a, #0x80
00288$:
	rlca
	and	a,#0x01
	ld	b, a
;SpritePlayer.c:59: dy = (dy > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
	xor	a, a
	sub	a, -5 (ix)
	jp	PO, 00289$
	xor	a, #0x80
00289$:
	rlca
	and	a,#0x01
	ld	-1 (ix), a
;SpritePlayer.c:56: if (dx != 0 && dy != 0) {
	ld	a, c
	or	a, a
	jr	Z, 00116$
	ld	a, -5 (ix)
	or	a, a
	jr	Z, 00116$
;SpritePlayer.c:58: dx = (dx > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
	ld	e, -2 (ix)
	xor	a, a
	sub	a, e
	ld	d, a
	ld	a, b
	or	a, a
	jr	Z, 00135$
	ld	c, e
	jr	00136$
00135$:
	ld	c, d
00136$:
;SpritePlayer.c:59: dy = (dy > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00138$
	ld	e, d
00138$:
	ld	-5 (ix), e
	jr	00117$
00116$:
;SpritePlayer.c:62: if (dx != 0) dx = (dx > 0) ? (INT8)speed : -(INT8)speed;
	xor	a, a
	sub	a, e
	ld	l, a
	ld	a, c
	or	a, a
	jr	Z, 00112$
	ld	a, b
	or	a, a
	jr	Z, 00139$
	ld	c, e
	jr	00140$
00139$:
	ld	c, l
00140$:
00112$:
;SpritePlayer.c:63: if (dy != 0) dy = (dy > 0) ? (INT8)speed : -(INT8)speed;
	ld	a, -5 (ix)
	or	a, a
	jr	Z, 00117$
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00142$
	ld	e, l
00142$:
	ld	-5 (ix), e
00117$:
;SpritePlayer.c:67: INT16 new_x = (INT16)THIS->x + (INT16)dx;
	ld	hl, (_THIS)
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	add	hl, bc
	ld	c, l
	ld	b, h
;SpritePlayer.c:68: INT16 new_y = (INT16)THIS->y + (INT16)dy;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, -5 (ix)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, de
	ex	de, hl
;SpritePlayer.c:70: if (new_x < PLAYER_MIN_X) new_x = PLAYER_MIN_X;
	ld	a, c
	sub	a, #0x08
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00120$
	ld	bc, #0x0008
00120$:
;SpritePlayer.c:71: if (new_x > PLAYER_MAX_X) new_x = PLAYER_MAX_X;
	ld	a, #0x90
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00122$
	ld	bc, #0x0090
00122$:
;SpritePlayer.c:72: if (new_y < PLAYER_MIN_Y) new_y = PLAYER_MIN_Y;
	ld	a, e
	sub	a, #0x10
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00124$
	ld	de, #0x0010
00124$:
;SpritePlayer.c:73: if (new_y > PLAYER_MAX_Y) new_y = PLAYER_MAX_Y;
	ld	a, #0x80
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00126$
	ld	de, #0x0080
00126$:
;SpritePlayer.c:75: THIS->x = (UINT16)new_x;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;SpritePlayer.c:76: THIS->y = (UINT16)new_y;
	ld	hl, (_THIS)
	inc	hl
	inc	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;SpritePlayer.c:77: }
	ld	sp, ix
	pop	ix
	ret
;SpritePlayer.c:79: void DESTROY(void) {
;	---------------------------------
; Function Destroy_SpritePlayer
; ---------------------------------
_Destroy_SpritePlayer::
;SpritePlayer.c:80: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
