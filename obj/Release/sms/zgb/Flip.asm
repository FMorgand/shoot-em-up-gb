;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Flip
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_native_data_flipx
	.globl _set_sprite_native_data
	.globl _set_sprite_data_flip
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
_flipped_data:
	.ds 64
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
	.area _CODE
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:11: static const UINT8 * copy_row(const UINT8* src, UINT8* dest) NAKED PRESERVES_REGS(a, iyh, iyl) {
;	---------------------------------
; Function copy_row
; ---------------------------------
_copy_row:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:22: __endasm;
	ldi
	ldi
	ldi
	ldi
	ex	de, hl
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:23: }
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:25: static const UINT8 * copy_row_flip(const UINT8* src, UINT8* dest) NAKED NAKED PRESERVES_REGS(iyh, iyl) {
;	---------------------------------
; Function copy_row_flip
; ---------------------------------
_copy_row_flip:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:47: __endasm;
	ld	b, #>_flip_recode_table
	.rept	2
	ld	c, (hl)
	ld	a, (bc)
	ld	(de), a
	inc	hl
	inc	de
	.endm
	.rept	2
	ld	c, (hl)
	ld	a, (bc)
	ld	(de), a
	inc	hl
	inc	de
	.endm
	ex	de, hl
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:48: }
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:57: static const UINT8 * set_flipped_tile(UINT8 tile_idx, const UINT8* data, UINT8 flip) {
;	---------------------------------
; Function set_flipped_tile
; ---------------------------------
_set_flipped_tile:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	c, a
	inc	sp
	inc	sp
	push	de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:59: UINT8* dest = (flip & FLIP_Y) ? (flipped_data + (NUM_BYTES_PER_TILE - DEFAULT_COLOR_DEPTH)) : flipped_data;
	ld	b, 4 (ix)
	ld	a, b
	and	a, #0x01
	ld	-1 (ix), a
	or	a, a
	jr	Z, 00114$
	ld	de, #_flipped_data+60
	jr	00115$
00114$:
	ld	de, #_flipped_data+0
00115$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:60: INT16  delta = (flip & FLIP_Y) ? -DEFAULT_COLOR_DEPTH : DEFAULT_COLOR_DEPTH;
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00116$
	ld	hl, #0xfffc
	jr	00117$
00116$:
	ld	hl, #0x0004
00117$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:61: if (flip & FLIP_X) {
	bit	1, b
	jr	Z, 00124$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:62: for (UINT8 i = DEFAULT_SPRITES_SIZE; i != 0; i--, dest += delta) src = copy_row_flip(src, dest);
	ld	b, #0x10
00107$:
	ld	a, b
	or	a, a
	jr	Z, 00105$
	push	hl
	push	bc
	push	de
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	call	_copy_row_flip
	ld	-3 (ix), e
	ld	-2 (ix), d
	pop	de
	pop	bc
	pop	hl
	dec	b
	ld	a, l
	add	a, e
	ld	e, a
	ld	a, h
	adc	a, d
	ld	d, a
	jr	00107$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:64: for (UINT8 i = DEFAULT_SPRITES_SIZE; i != 0; i--, dest += delta) src = copy_row(src, dest);
00124$:
	ld	b, #0x10
00110$:
	ld	a, b
	or	a, a
	jr	Z, 00105$
	push	hl
	push	bc
	push	de
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	call	_copy_row
	ld	-3 (ix), e
	ld	-2 (ix), d
	pop	de
	pop	bc
	pop	hl
	dec	b
	ld	a, l
	add	a, e
	ld	e, a
	ld	a, h
	adc	a, d
	ld	d, a
	jr	00110$
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:67: set_sprite_native_data(tile_idx, N_TILES_PER_SPRITE, flipped_data);
	ld	hl, #_flipped_data
	push	hl
	ld	de, #0x0002
	ld	a, c
	call	_set_sprite_native_data
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:71: return src;
	pop	de
	push	de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:72: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:76: void set_sprite_data_flip(UINT8 first_tile, UINT8 nb_tiles, const UINT8 *data, UINT8 flip) {
;	---------------------------------
; Function set_sprite_data_flip
; ---------------------------------
_set_sprite_data_flip::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	c, a
	ld	-1 (ix), l
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:78: if (flip == FLIP_X) {
	ld	a, 6 (ix)
	sub	a, #0x02
	jr	NZ, 00106$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:79: set_sprite_native_data_flipx(first_tile, nb_tiles, data);
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	a, c
	call	_set_sprite_native_data_flipx
	jr	00111$
00106$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:82: if (flip & (FLIP_X | FLIP_Y)) {
	ld	a, 6 (ix)
	and	a, #0x03
	jr	Z, 00103$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:83: const UINT8* src = data;
	ld	a, 4 (ix)
	ld	-3 (ix), a
	ld	a, 5 (ix)
	ld	-2 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:85: for (UINT8 i = (first_tile & 0xfe); i != first_tile + (nb_tiles & 0xfe); i += 2) {		
	ld	a, c
	and	a, #0xfe
	ld	b, a
00109$:
	ld	e, c
	ld	d, #0x00
	ld	l, -1 (ix)
	res	0, l
	ld	h, #0x00
	add	hl, de
	ld	e, b
	ld	d, #0x00
	cp	a, a
	sbc	hl, de
	jr	Z, 00111$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:86: src = set_flipped_tile(i, src, flip);
	push	bc
	ld	a, 6 (ix)
	push	af
	inc	sp
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	a, b
	call	_set_flipped_tile
	ld	-3 (ix), e
	ld	-2 (ix), d
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:85: for (UINT8 i = (first_tile & 0xfe); i != first_tile + (nb_tiles & 0xfe); i += 2) {		
	inc	b
	inc	b
	jr	00109$
00103$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:95: set_sprite_native_data(first_tile, nb_tiles, data);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	e, -1 (ix)
	ld	d, #0x00
	push	hl
	ld	a, c
	call	_set_sprite_native_data
00111$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Flip.c:100: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
