;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Fade
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FadeDMG
	.globl _SyncVBlank
	.globl _display_off
	.globl b_FadeIn
	.globl _FadeIn
	.globl b_FadeOut
	.globl _FadeOut
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_FadeDMG_colors_10000_276:
	.ds 12
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
	.area _CODE_1
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:14: void FadeDMG(UINT8 fadeout) {
;	---------------------------------
; Function FadeDMG
; ---------------------------------
_FadeDMG::
	add	sp, #-10
	ldhl	sp,	#7
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:17: UINT8* c = colors;
	ld	(hl+), a
	ld	(hl), #<(_FadeDMG_colors_10000_276)
	inc	hl
	ld	(hl), #>(_FadeDMG_colors_10000_276)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:21: for(i = 0; i != 3; ++i) {
	ldhl	sp,	#6
	ld	(hl), #0x00
00112$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:22: p = (UINT8)*(pals[i]);
	ldhl	sp,	#6
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	ld	de, #_pals
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ldhl	sp,	#2
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:23: for(j = 0; j != 8; j += 2, ++c) {
	ld	(hl+), a
	ld	(hl), #0x00
00110$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:24: *c = (DespRight(p, j)) & 0x3;
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	ld	(hl+), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Math.h:27: return a >> b;
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	inc	a
	jr	00219$
00218$:
	ldhl	sp,	#5
	sra	(hl)
	dec	hl
	rr	(hl)
00219$:
	dec	a
	jr	NZ, 00218$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:24: *c = (DespRight(p, j)) & 0x3;
	ldhl	sp,	#4
	ld	a, (hl)
	and	a, #0x03
	ldhl	sp,	#8
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:23: for(j = 0; j != 8; j += 2, ++c) {
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
	ldhl	sp,	#8
	inc	(hl)
	jr	NZ, 00220$
	inc	hl
	inc	(hl)
00220$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x08
	jr	NZ, 00110$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:21: for(i = 0; i != 3; ++i) {
	ldhl	sp,	#6
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00112$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:28: for(i = 0; i != 4; ++i) {
	ldhl	sp,	#8
	ld	(hl), #0x00
00116$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:29: p = fadeout ? 3 - i : i;
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	Z, 00120$
	inc	hl
	ld	a, #0x03
	sub	a, (hl)
	jr	00121$
00120$:
	ldhl	sp,	#8
	ld	a, (hl)
00121$:
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:30: for(j = 0; j != 3; ++j) {
	ldhl	sp,	#9
	ld	(hl), #0x00
00114$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:31: c = &colors[j << 2];
	ldhl	sp,	#9
	ld	a, (hl)
	add	a, a
	add	a, a
	ld	e, a
	ld	d, #0x00
	ld	hl, #_FadeDMG_colors_10000_276
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:32: *pals[j] = DMG_PALETTE(FadeInOp(c[0], p), FadeInOp(c[1], p), FadeInOp(c[2], p), FadeInOp(c[3], p));
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_pals
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#6
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:9: return (c < i) ? 0: (c - i);
	ld	(hl), a
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NC, 00122$
	ld	d, #0x00
	jr	00123$
00122$:
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ld	d, (hl)
00123$:
	ld	a, d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:32: *pals[j] = DMG_PALETTE(FadeInOp(c[0], p), FadeInOp(c[1], p), FadeInOp(c[2], p), FadeInOp(c[3], p));
	and	a, #0x03
	rrca
	rrca
	and	a, #0xc0
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#6
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:9: return (c < i) ? 0: (c - i);
	ld	(hl), a
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NC, 00124$
	xor	a, a
	jr	00125$
00124$:
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
00125$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:32: *pals[j] = DMG_PALETTE(FadeInOp(c[0], p), FadeInOp(c[1], p), FadeInOp(c[2], p), FadeInOp(c[3], p));
	swap a
	and	a, #0x30
	ld	b, a
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, b
	ld	c, a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	b, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:9: return (c < i) ? 0: (c - i);
	ld	a, b
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NC, 00126$
	xor	a, a
	jr	00127$
00126$:
	ld	a, b
	ldhl	sp,	#0
	sub	a, (hl)
00127$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:32: *pals[j] = DMG_PALETTE(FadeInOp(c[0], p), FadeInOp(c[1], p), FadeInOp(c[2], p), FadeInOp(c[3], p));
	and	a, #0x03
	add	a, a
	add	a, a
	or	a, c
	ld	c, a
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:9: return (c < i) ? 0: (c - i);
	ld	(hl), a
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NC, 00128$
	ld	d, #0x00
	jr	00129$
00128$:
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	d, a
00129$:
	ld	a, d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:32: *pals[j] = DMG_PALETTE(FadeInOp(c[0], p), FadeInOp(c[1], p), FadeInOp(c[2], p), FadeInOp(c[3], p));
	and	a, #0x03
	or	a, c
	ldhl	sp,	#3
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:30: for(j = 0; j != 3; ++j) {
	ldhl	sp,	#9
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jp	NZ, 00114$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:34: SyncVBlank();
	call	_SyncVBlank
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:35: SyncVBlank();
	call	_SyncVBlank
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:28: for(i = 0; i != 4; ++i) {
	ldhl	sp,	#8
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jp	NZ, 00116$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:37: }
	add	sp, #10
	ret
_pals:
	.dw _BGP_REG
	.dw _OBP0_REG
	.dw _OBP1_REG
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:66: void FadeIn(void) BANKED {
;	---------------------------------
; Function FadeIn
; ---------------------------------
	b_FadeIn	= 1
_FadeIn::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:72: FadeDMG(0);
	xor	a, a
	call	_FadeDMG
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:76: DISPLAY_OFF;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:77: }
	jp	_display_off
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:79: void FadeOut(void) BANKED {
;	---------------------------------
; Function FadeOut
; ---------------------------------
	b_FadeOut	= 1
_FadeOut::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:85: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:86: FadeDMG(1);
	ld	a, #0x01
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/Fade.c:90: }
	jp	_FadeDMG
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
