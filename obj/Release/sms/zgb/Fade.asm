;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Fade
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FadeStepColor
	.globl _UpdateColor
	.globl _SyncVBlank
	.globl _set_palette
	.globl _ZGB_Fading_SPal
	.globl _ZGB_Fading_BPal
	.globl b_FadeIn
	.globl _FadeIn
	.globl b_FadeOut
	.globl _FadeOut
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
_ZGB_Fading_BPal::
	.ds 16
_ZGB_Fading_SPal::
	.ds 16
_FadeStepColor_palette_10000_242:
	.ds 16
_FadeStepColor_palette_s_10000_242:
	.ds 16
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:11: palette_color_t UpdateColor(UINT8 i, palette_color_t col) {
;	---------------------------------
; Function UpdateColor
; ---------------------------------
_UpdateColor::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-17
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:12: INT8 BR = PAL_RED(ZGB_Fading_SPal[0]), BG = PAL_GREEN(ZGB_Fading_SPal[0]), BB = PAL_BLUE(ZGB_Fading_SPal[0]);
	ld	hl, #_ZGB_Fading_SPal+0
	ld	c, (hl)
	ld	a, c
	and	a, #0x03
	ld	-17 (ix), a
	ld	a, c
	rrca
	rrca
	and	a, #0x3
	ld	-16 (ix), a
	ld	a, c
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	-3 (ix), a
	and	a, #0x03
	ld	-15 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:13: INT8 R = PAL_RED(col), G = PAL_GREEN(col), B = PAL_BLUE(col);
	ld	a, -2 (ix)
	ld	-3 (ix), a
	and	a, #0x03
	ld	-14 (ix), a
	ld	a, -2 (ix)
	rrca
	rrca
	and	a, #0x3f
	ld	-3 (ix), a
	and	a, #0x03
	ld	-13 (ix), a
	ld	a, -2 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	-3 (ix), a
	and	a, #0x03
	ld	-12 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:15: R = (R > BR) ? MAX(BR, R - i) : MIN(BR, R + i);
	ld	a, -14 (ix)
	ld	-11 (ix), a
	rlca
	sbc	a, a
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
	ld	-8 (ix), #0x00
	ld	a, -17 (ix)
	ld	-7 (ix), a
	rlca
	sbc	a, a
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
	ld	a, -17 (ix)
	sub	a, -14 (ix)
	jr	NC, 00103$
	ld	a, -11 (ix)
	sub	a, -9 (ix)
	ld	-4 (ix), a
	sbc	a, a
	sub	a, -8 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	sub	a, -7 (ix)
	ld	a, -3 (ix)
	sbc	a, -6 (ix)
	jp	PO, 00184$
	xor	a, #0x80
00184$:
	jp	P, 00105$
	ld	a, -17 (ix)
	jr	00106$
00105$:
	ld	a, -14 (ix)
	sub	a, -5 (ix)
00106$:
	ld	-3 (ix), a
	jr	00104$
00103$:
	ld	a, -11 (ix)
	add	a, -9 (ix)
	ld	c, a
	ld	a, #0x00
	adc	a, -8 (ix)
	ld	b, a
	ld	a, -7 (ix)
	sub	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00107$
	ld	a, -17 (ix)
	jr	00108$
00107$:
	ld	a, -5 (ix)
	add	a, -14 (ix)
00108$:
	ld	-3 (ix), a
00104$:
	ld	a, -3 (ix)
	ld	-14 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:16: G = (G > BG) ? MAX(BG, G - i) : MIN(BG, G + i);
	ld	a, -13 (ix)
	ld	-11 (ix), a
	rlca
	sbc	a, a
	ld	-10 (ix), a
	ld	a, -16 (ix)
	ld	-7 (ix), a
	rlca
	sbc	a, a
	ld	-6 (ix), a
	ld	a, -16 (ix)
	sub	a, -13 (ix)
	jr	NC, 00109$
	ld	a, -11 (ix)
	sub	a, -9 (ix)
	ld	c, a
	sbc	a, a
	sub	a, -8 (ix)
	ld	b, a
	ld	a, c
	sub	a, -7 (ix)
	ld	a, b
	sbc	a, -6 (ix)
	jp	PO, 00185$
	xor	a, #0x80
00185$:
	jp	P, 00111$
	ld	b, -16 (ix)
	jr	00112$
00111$:
	ld	a, -13 (ix)
	sub	a, -5 (ix)
	ld	b, a
00112$:
	ld	-3 (ix), b
	jr	00110$
00109$:
	ld	a, -11 (ix)
	add	a, -9 (ix)
	ld	-4 (ix), a
	ld	a, #0x00
	adc	a, -8 (ix)
	ld	-3 (ix), a
	ld	a, -7 (ix)
	sub	a, -4 (ix)
	ld	a, #0x00
	sbc	a, -3 (ix)
	jr	NC, 00113$
	ld	b, -16 (ix)
	jr	00114$
00113$:
	ld	a, -5 (ix)
	add	a, -13 (ix)
	ld	b, a
00114$:
	ld	-3 (ix), b
00110$:
	ld	a, -3 (ix)
	ld	-10 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:17: B = (B > BB) ? MAX(BB, B - i) : MIN(BB, B + i);
	ld	a, -12 (ix)
	ld	-7 (ix), a
	rlca
	sbc	a, a
	ld	-6 (ix), a
	ld	a, -15 (ix)
	ld	-4 (ix), a
	rlca
	sbc	a, a
	ld	-3 (ix), a
	ld	a, -15 (ix)
	sub	a, -12 (ix)
	jr	NC, 00115$
	ld	a, -7 (ix)
	sub	a, -9 (ix)
	ld	c, a
	sbc	a, a
	sub	a, -8 (ix)
	ld	b, a
	ld	a, c
	sub	a, -4 (ix)
	ld	a, b
	sbc	a, -3 (ix)
	jp	PO, 00186$
	xor	a, #0x80
00186$:
	jp	P, 00117$
	ld	a, -15 (ix)
	ld	-3 (ix), a
	jr	00118$
00117$:
	ld	a, -12 (ix)
	sub	a, -5 (ix)
	ld	-3 (ix), a
00118$:
	ld	c, -3 (ix)
	jr	00116$
00115$:
	ld	a, -7 (ix)
	add	a, -9 (ix)
	ld	c, a
	ld	a, #0x00
	adc	a, -8 (ix)
	ld	b, a
	ld	a, -4 (ix)
	sub	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00119$
	ld	c, -15 (ix)
	jr	00120$
00119$:
	ld	a, -5 (ix)
	add	a, -12 (ix)
	ld	c, a
00120$:
00116$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:19: return RGB(R, G, B);
	ld	a, -10 (ix)
	add	a, a
	add	a, a
	or	a, -14 (ix)
	ld	b, a
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	or	a, b
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:20: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:22: void FadeStepColor(UINT8 i) {
;	---------------------------------
; Function FadeStepColor
; ---------------------------------
_FadeStepColor::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	-4 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:25: palette_color_t* col = ZGB_Fading_BPal;
	ld	bc, #_ZGB_Fading_BPal+0
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:26: palette_color_t* col_s = ZGB_Fading_SPal;
	ld	-3 (ix), #<(_ZGB_Fading_SPal)
	ld	-2 (ix), #>(_ZGB_Fading_SPal)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:28: for(UINT8 c = 0; c < 16; ++c, ++col, ++col_s) {
	ld	-1 (ix), #0x00
00106$:
	ld	a, -1 (ix)
	sub	a, #0x10
	jr	NC, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:29: palette[c] = UpdateColor(i, *col);
	ld	a, #<(_FadeStepColor_palette_10000_242)
	add	a, -1 (ix)
	ld	e, a
	ld	a, #>(_FadeStepColor_palette_10000_242)
	adc	a, #0x00
	ld	d, a
	ld	a, (bc)
	push	bc
	push	de
	ld	l, a
	ld	a, -4 (ix)
	call	_UpdateColor
	pop	de
	pop	bc
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:30: palette_s[c] = UpdateColor(i, *col_s);
	ld	a, #<(_FadeStepColor_palette_s_10000_242)
	add	a, -1 (ix)
	ld	e, a
	ld	a, #>(_FadeStepColor_palette_s_10000_242)
	adc	a, #0x00
	ld	d, a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	l, (hl)
	push	bc
	push	de
	ld	a, -4 (ix)
	call	_UpdateColor
	pop	de
	pop	bc
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:28: for(UINT8 c = 0; c < 16; ++c, ++col, ++col_s) {
	inc	-1 (ix)
	inc	bc
	inc	-3 (ix)
	jr	NZ, 00106$
	inc	-2 (ix)
	jr	00106$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:33: WAIT_WRITABLE_CRAM;	// avoid snow on screen
00102$:
	in	a, (_VCOUNTER)
	sub	a, #0xd8
	jr	C, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:35: set_bkg_palette(0, 1, palette);
	ld	hl, #_FadeStepColor_palette_10000_242
	push	hl
	ld	hl, #0x100
	push	hl
	call	_set_palette
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:36: set_sprite_palette(0, 1, palette_s);
	ld	hl, #_FadeStepColor_palette_s_10000_242
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_palette
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:38: DISPLAY_ON;
	ld	a, (_shadow_VDP_R1+0)
	or	a, #0x40
	ld	(_shadow_VDP_R1+0), a
	di
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	ei
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:39: SyncVBlank();
	call	_SyncVBlank
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:40: SyncVBlank();
	call	_SyncVBlank
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:41: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:43: void FadeIn(void) BANKED {
;	---------------------------------
; Function FadeIn
; ---------------------------------
	b_FadeIn	= 1
_FadeIn::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:44: FadeStepColor(0);	
	xor	a, a
	call	_FadeStepColor
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:45: FadeStepColor(1);	
	ld	a, #0x01
	call	_FadeStepColor
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:46: FadeStepColor(2);	
	ld	a, #0x02
	call	_FadeStepColor
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:47: FadeStepColor(3);	
	ld	a, #0x03
	call	_FadeStepColor
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\sms.h:254: __WRITE_VDP_REG(VDP_R1, __READ_VDP_REG(VDP_R1) &= (~R1_DISP_ON));
	ld	a, (_shadow_VDP_R1+0)
	and	a, #0xbf
	ld	(_shadow_VDP_R1+0), a
	di
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	ei
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:48: DISPLAY_OFF;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:49: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:51: void FadeOut(void) BANKED {
;	---------------------------------
; Function FadeOut
; ---------------------------------
	b_FadeOut	= 1
_FadeOut::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:52: FadeStepColor(3);	
	ld	a, #0x03
	call	_FadeStepColor
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:53: FadeStepColor(2);	
	ld	a, #0x02
	call	_FadeStepColor
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:54: FadeStepColor(1);	
	ld	a, #0x01
	call	_FadeStepColor
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:55: FadeStepColor(0);	
	xor	a, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/Fade.c:56: }
	jp	_FadeStepColor
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
