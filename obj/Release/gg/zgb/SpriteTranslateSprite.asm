;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteTranslateSprite
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TranslateSprite
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
_tile_coll:
	.ds 2
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:8: UINT8 TranslateSprite(Sprite* sprite, INT8 x, INT8 y) {
;	---------------------------------
; Function TranslateSprite
; ---------------------------------
_TranslateSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-14
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:9: UINT8 ret = 0;
	ld	-11 (ix), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:17: pivot_x = sprite->x + (UINT8)(sprite->coll_w - 1u);
	ld	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
	ld	a, -2 (ix)
	add	a, #0x04
	ld	-8 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:15: if (x) {
	ld	a, 4 (ix)
	or	a, a
	jp	Z, 00128$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:16: if (x > 0) {
	xor	a, a
	sub	a, 4 (ix)
	jp	PO, 00344$
	xor	a, #0x80
00344$:
	rlca
	and	a,#0x01
	ld	-6 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:17: pivot_x = sprite->x + (UINT8)(sprite->coll_w - 1u);
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:16: if (x > 0) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:17: pivot_x = sprite->x + (UINT8)(sprite->coll_w - 1u);
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	l, (hl)
	dec	l
	ld	h, #0x00
	add	hl, de
	jr	00103$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:19: pivot_x = sprite->x;
	ex	de, hl
00103$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:23: tmp = PX_TO_TILE(pivot_x);
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:24: pivot_x += x;
	ld	a, 4 (ix)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	add	hl, de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:25: start_tile_x = PX_TO_TILE(pivot_x);
	ld	b, l
	ld	e, h
	sra	e
	rr	b
	sra	e
	rr	b
	sra	e
	rr	b
	ld	-3 (ix), b
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:26: if(tmp == start_tile_x) {
	ld	a, c
	sub	a, -3 (ix)
	jp	Z, 00128$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:31: if((UINT16)pivot_x >= scroll_w) { //This checks pivot_x < 0 || pivot_x >= scroll_W
	ex	de, hl
	ld	hl, #_scroll_w
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jp	NC, 00128$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:36: if(sprite->y >= scroll_h) { //This checks sprite->y < 0 || sprite->y >= scroll_h
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:40: start_tile_y = scroll_tiles_h - 1;
	ld	a, (_scroll_tiles_h)
	ld	e, a
	dec	e
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:36: if(sprite->y >= scroll_h) { //This checks sprite->y < 0 || sprite->y >= scroll_h
	ld	hl, #_scroll_h
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00112$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:37: if((INT16)sprite->y < 0) 
	ld	l, b
	bit	7, l
	jr	Z, 00109$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:38: start_tile_y = 0;
	ld	d, #0x00
	jr	00113$
00109$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:40: start_tile_y = scroll_tiles_h - 1;
	ld	d, e
	jr	00113$
00112$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:42: start_tile_y = PX_TO_TILE(sprite->y);
	ld	l, c
	ld	d, b
	srl	d
	rr	l
	srl	d
	rr	l
	srl	d
	rr	l
	ld	d, l
00113$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:46: pivot_y = sprite->y + sprite->coll_h - 1;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	dec	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:47: if((UINT16)pivot_y >= scroll_h) { //This checks pivot_y < 0 || pivot_y >= scroll_h
	ld	-5 (ix), c
	ld	-4 (ix), b
	ld	hl, #_scroll_h
	ld	a, -5 (ix)
	sub	a, (hl)
	ld	a, -4 (ix)
	inc	hl
	sbc	a, (hl)
	jr	C, 00118$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:48: if(pivot_y < 0) 
	bit	7, b
	jr	Z, 00119$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:49: end_tile_y = 0;
	ld	e, #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:51: end_tile_y = scroll_tiles_h - 1;
	jr	00119$
00118$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:53: end_tile_y = PX_TO_TILE(pivot_y);
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	e, c
00119$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:56: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-5 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:57: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:58: tile_coll = scroll_map + (scroll_tiles_w * start_tile_y + start_tile_x);
	ld	l, d
	ld	h, #0x00
	ex	de, hl
	push	hl
	ld	hl, (_scroll_tiles_w)
	call	__mulint
	ex	de, hl
	pop	de
	ld	a, -3 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	c, -4 (ix)
	ld	b, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	ld	iy, #_scroll_map
	add	a, 0 (iy)
	ld	(_tile_coll+0), a
	ld	a, b
	adc	a, 1 (iy)
	ld	(_tile_coll+1), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:59: end_tile_y ++;
	inc	e
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:60: scroll_coll_group = sprite->coll_group;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #34
	add	hl, bc
	ld	c, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:61: for(tmp = start_tile_y; tmp != end_tile_y; tmp ++, tile_coll += scroll_tiles_w) {
00160$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:17: pivot_x = sprite->x + (UINT8)(sprite->coll_w - 1u);
	ld	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
	ld	a, -2 (ix)
	add	a, #0x04
	ld	-8 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:61: for(tmp = start_tile_y; tmp != end_tile_y; tmp ++, tile_coll += scroll_tiles_w) {
	ld	a, e
	sub	a, d
	jp	Z, 00125$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:62: if(scroll_collisions[*tile_coll] & scroll_coll_group) {
	ld	hl, (_tile_coll)
	ld	a, (hl)
	add	a, #<(_scroll_collisions)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_scroll_collisions)
	ld	h, a
	ld	a, (hl)
	and	a, c
	jr	Z, 00161$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:63: if(x > 0) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00121$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:64: sprite->x = TILE_TO_PX(start_tile_x) - sprite->coll_w;
	ld	b, #0x03
00347$:
	sla	-4 (ix)
	rl	-3 (ix)
	djnz	00347$
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	ld	-14 (ix), a
	ld	-13 (ix), #0x00
	ld	a, -4 (ix)
	sub	a, -14 (ix)
	ld	-12 (ix), a
	ld	a, -3 (ix)
	sbc	a, -13 (ix)
	ld	-11 (ix), a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, -12 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -11 (ix)
	ld	(hl), a
	jr	00122$
00121$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:66: sprite->x = TILE_TO_PX(start_tile_x + 1);
	ld	l, -4 (ix)
	ld	h, #0x00
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00122$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:69: ret = *tile_coll;
	ld	hl, (_tile_coll)
	ld	a, (hl)
	ld	-11 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:70: SWITCH_ROM(__save);
	ld	a, -5 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:71: goto done_x;
	jr	00129$
00161$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:61: for(tmp = start_tile_y; tmp != end_tile_y; tmp ++, tile_coll += scroll_tiles_w) {
	inc	d
	ld	hl, #_scroll_tiles_w
	push	de
	ld	iy, #_tile_coll
	push	iy
	pop	de
	ld	a, (de)
	add	a, (hl)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, (de)
	adc	a, (hl)
	ld	(de), a
	pop	de
	jp	00160$
00125$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:74: SWITCH_ROM(__save);
	ld	a, -5 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:77: inc_x:
00128$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:78: sprite->x += x;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, 4 (ix)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, bc
	ex	de, hl
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:79: done_x:
00129$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:36: if(sprite->y >= scroll_h) { //This checks sprite->y < 0 || sprite->y >= scroll_h
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	inc	bc
	inc	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:81: if (y) {
	ld	a, 5 (ix)
	or	a, a
	jp	Z, 00157$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:82: if (y > 0) {
	xor	a, a
	sub	a, 5 (ix)
	jp	PO, 00348$
	xor	a, #0x80
00348$:
	rlca
	and	a,#0x01
	ld	-5 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:83: pivot_y = sprite->y + (UINT8)(sprite->coll_h - 1u);
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:82: if (y > 0) {
	ld	a, -5 (ix)
	or	a, a
	jr	Z, 00131$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:83: pivot_y = sprite->y + (UINT8)(sprite->coll_h - 1u);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
	dec	l
	ld	h, #0x00
	add	hl, de
	jr	00132$
00131$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:85: pivot_y = sprite->y;
	ex	de, hl
00132$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:89: tmp = PX_TO_TILE(pivot_y);
	ld	e, l
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	-4 (ix), e
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:90: pivot_y += y;
	ld	a, 5 (ix)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	add	hl, de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:91: start_tile_y = PX_TO_TILE(pivot_y);
	ld	e, l
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:92: if(tmp == start_tile_y) {
	ld	-3 (ix), e
	ld	a, e
	sub	a, -4 (ix)
	jp	Z, 00157$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:97: if((UINT16)pivot_y >= scroll_h) {
	ex	de, hl
	ld	hl, #_scroll_h
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jp	NC, 00157$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:102: if(sprite->x >= scroll_w){
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	e, (hl)
	inc	hl
	ld	b, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:106: start_tile_x = scroll_tiles_w - 1;
	ld	a, (_scroll_tiles_w)
	dec	a
	ld	-4 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:102: if(sprite->x >= scroll_w){
	ld	hl, #_scroll_w
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00141$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:103: if((INT16)sprite->x < 0) 
	ld	d, b
	bit	7, d
	jr	Z, 00138$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:104: start_tile_x = 0;
	ld	c, #0x00
	jr	00142$
00138$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:106: start_tile_x = scroll_tiles_w - 1;
	ld	c, -4 (ix)
	jr	00142$
00141$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:108: start_tile_x = PX_TO_TILE(sprite->x);
	ld	l, e
	ld	c, b
	srl	c
	rr	l
	srl	c
	rr	l
	srl	c
	rr	l
	ld	c, l
00142$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:112: pivot_x = sprite->x + sprite->coll_w - 1;
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	l, (hl)
	ld	h, #0x00
	ld	d, b
	add	hl, de
	ex	de,hl
	dec	de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:113: if((UINT16)pivot_x >= scroll_w) {
	ld	-7 (ix), e
	ld	-6 (ix), d
	ld	hl, #_scroll_w
	ld	a, -7 (ix)
	sub	a, (hl)
	ld	a, -6 (ix)
	inc	hl
	sbc	a, (hl)
	jr	C, 00147$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:114: if(pivot_x < 0) 
	bit	7, d
	jr	Z, 00144$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:115: end_tile_x = 0;
	ld	b, #0x00
	jr	00148$
00144$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:117: end_tile_x = scroll_tiles_w - 1;
	ld	b, -4 (ix)
	jr	00148$
00147$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:119: end_tile_x = PX_TO_TILE(pivot_x);
	ld	b, e
	sra	d
	rr	b
	sra	d
	rr	b
	sra	d
	rr	b
00148$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:122: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-6 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:123: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:124: tile_coll = scroll_map + (scroll_tiles_w * start_tile_y + start_tile_x);
	ld	e, -3 (ix)
	ld	d, #0x00
	push	bc
	ld	hl, (_scroll_tiles_w)
	call	__mulint
	pop	bc
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	iy, #_scroll_map
	add	a, 0 (iy)
	ld	(_tile_coll+0), a
	ld	a, d
	adc	a, 1 (iy)
	ld	(_tile_coll+1), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:125: end_tile_x ++;
	ld	a, b
	inc	a
	ld	-4 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:126: scroll_coll_group = y < 0 ? sprite->coll_group : sprite->coll_group_down;
	bit	7, 5 (ix)
	jr	Z, 00167$
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #34
	add	hl, de
	ld	e, (hl)
	jr	00168$
00167$:
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #35
	add	hl, de
	ld	e, (hl)
00168$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:127: for(tmp = start_tile_x; tmp != end_tile_x; tmp ++, tile_coll += 1) {
	ld	d, c
00163$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:36: if(sprite->y >= scroll_h) { //This checks sprite->y < 0 || sprite->y >= scroll_h
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	inc	bc
	inc	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:127: for(tmp = start_tile_x; tmp != end_tile_x; tmp ++, tile_coll += 1) {
	ld	a, -4 (ix)
	sub	a, d
	jr	Z, 00154$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:128: if(scroll_collisions[*tile_coll] & scroll_coll_group) {
	ld	hl, (_tile_coll)
	ld	a, (hl)
	add	a, #<(_scroll_collisions)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_scroll_collisions)
	ld	h, a
	ld	a, (hl)
	and	a, e
	jr	Z, 00164$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:130: sprite->y = TILE_TO_PX(start_tile_y) - sprite->coll_h;
	ld	e, -3 (ix)
	ld	d, #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:129: if(y > 0) {
	ld	a, -5 (ix)
	or	a, a
	jr	Z, 00150$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:130: sprite->y = TILE_TO_PX(start_tile_y) - sprite->coll_h;
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jr	00151$
00150$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:132: sprite->y = TILE_TO_PX(start_tile_y + 1);
	inc	de
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
00151$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:135: ret = *tile_coll;
	ld	hl, (_tile_coll)
	ld	a, (hl)
	ld	-11 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:136: SWITCH_ROM(__save);
	ld	a, -6 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:137: goto done_y;
	jr	00158$
00164$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:127: for(tmp = start_tile_x; tmp != end_tile_x; tmp ++, tile_coll += 1) {
	inc	d
	ld	hl, (_tile_coll)
	inc	hl
	ld	(_tile_coll), hl
	jr	00163$
00154$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:140: SWITCH_ROM(__save);
	ld	a, -6 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:143: inc_y:
00157$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:144: sprite->y += y;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, 5 (ix)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, de
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:145: done_y:
00158$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:147: return ret;
	ld	a, -11 (ix)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteTranslateSprite.c:148: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
