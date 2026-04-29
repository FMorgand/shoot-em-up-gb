;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module ScrollFindTile
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ScrollFindTile
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
	.area _CODE
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:3: UINT8 ScrollFindTile(UINT8 map_bank, const struct MapInfo* map, UINT8 tile, UINT16 start_x, UINT16 start_y, UINT16 w, UINT16 h, UINT16* x, UINT16* y) {
;	---------------------------------
; Function ScrollFindTile
; ---------------------------------
_ScrollFindTile::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-27
	add	hl, sp
	ld	sp, hl
	ld	-6 (ix), e
	ld	-5 (ix), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:4: UINT8 __save = CURRENT_BANK;
	push	af
	ld	a, (_MAP_FRAME1+0)
	ld	-27 (ix), a
	pop	af
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:5: SWITCH_ROM(map_bank);
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:6: for (UINT16 xt = start_x; xt != start_x + w; ++ xt) {
	ld	a, -6 (ix)
	ld	-26 (ix), a
	ld	a, -5 (ix)
	ld	-25 (ix), a
	ld	a, 5 (ix)
	add	a, 9 (ix)
	ld	-24 (ix), a
	ld	a, 6 (ix)
	adc	a, 10 (ix)
	ld	-23 (ix), a
	ld	a, 5 (ix)
	ld	-4 (ix), a
	ld	a, 6 (ix)
	ld	-3 (ix), a
00109$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:9: *x = xt;
	ld	a, 13 (ix)
	ld	-22 (ix), a
	ld	a, 14 (ix)
	ld	-21 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:10: *y = yt;
	ld	a, 15 (ix)
	ld	-20 (ix), a
	ld	a, 16 (ix)
	ld	-19 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:6: for (UINT16 xt = start_x; xt != start_x + w; ++ xt) {
	ld	a, -24 (ix)
	sub	a, -4 (ix)
	jr	NZ, 00148$
	ld	a, -23 (ix)
	sub	a, -3 (ix)
	jp	Z, 00104$
00148$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:7: for (UINT16 yt = start_y; yt != start_y + h; ++ yt) {
	ld	a, 7 (ix)
	ld	-18 (ix), a
	ld	a, 8 (ix)
	ld	-17 (ix), a
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-16 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-15 (ix), a
	ld	a, -18 (ix)
	add	a, 11 (ix)
	ld	-14 (ix), a
	ld	a, -17 (ix)
	adc	a, 12 (ix)
	ld	-13 (ix), a
	ld	a, -18 (ix)
	ld	-2 (ix), a
	ld	a, -17 (ix)
	ld	-1 (ix), a
00106$:
	ld	a, -2 (ix)
	sub	a, -14 (ix)
	jr	NZ, 00149$
	ld	a, -1 (ix)
	sub	a, -13 (ix)
	jp	Z, 00110$
00149$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:8: if (map->data[map->width * yt + xt] == tile) {
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	call	__mulint
	ld	a, e
	add	a, -4 (ix)
	ld	-10 (ix), a
	ld	a, d
	adc	a, -3 (ix)
	ld	-9 (ix), a
	ld	a, -12 (ix)
	add	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -11 (ix)
	adc	a, -9 (ix)
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	ld	a, 4 (ix)
	sub	a, -7 (ix)
	jr	NZ, 00107$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:9: *x = xt;
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	a, 5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:10: *y = yt;
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	ld	a, -18 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -17 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:11: SWITCH_ROM(__save);
	ld	a, -27 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:12: return 1;
	ld	a, #0x01
	jr	00111$
00107$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:7: for (UINT16 yt = start_y; yt != start_y + h; ++ yt) {
	inc	-2 (ix)
	jr	NZ, 00152$
	inc	-1 (ix)
00152$:
	ld	a, -2 (ix)
	ld	-18 (ix), a
	ld	a, -1 (ix)
	ld	-17 (ix), a
	jp	00106$
00110$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:6: for (UINT16 xt = start_x; xt != start_x + w; ++ xt) {
	inc	-4 (ix)
	jr	NZ, 00153$
	inc	-3 (ix)
00153$:
	ld	a, -4 (ix)
	ld	5 (ix), a
	ld	a, -3 (ix)
	ld	6 (ix), a
	jp	00109$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:16: SWITCH_ROM(__save);
	ld	a, -27 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:18: *x = *y = 0;
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:19: return 0;
	xor	a, a
00111$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollFindTile.c:20: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	inc	sp
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
