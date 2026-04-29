;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module DefScrollLimits
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ClampScrollLimits
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefScrollLimits.c:4: void ClampScrollLimits(void) {
;	---------------------------------
; Function ClampScrollLimits
; ---------------------------------
_ClampScrollLimits::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefScrollLimits.c:5: if (clamp_enabled) {
	ld	a, (_clamp_enabled+0)
	or	a, a
	ret	Z
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefScrollLimits.c:6: if (scroll_w < SCREEN_WIDTH) scroll_x = 0u;
	ld	de, #0x00a0
	ld	hl, (_scroll_w)
	cp	a, a
	sbc	hl, de
	jr	NC, 00104$
	ld	hl, #0x0000
	ld	(_scroll_x), hl
	jr	00105$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefScrollLimits.c:7: else if (scroll_x < 0) scroll_x = 0u;
	ld	a, (_scroll_x+1)
	bit	7, a
	jr	Z, 00105$
	ld	hl, #0x0000
	ld	(_scroll_x), hl
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefScrollLimits.c:9: if (scroll_x > (scroll_w - SCREEN_WIDTH)) scroll_x = (scroll_w - SCREEN_WIDTH);
	ld	a, (_scroll_w+0)
	add	a, #0x60
	ld	c, a
	ld	a, (_scroll_w+1)
	adc	a, #0xff
	ld	b, a
	ld	hl, (_scroll_x)
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC, 00107$
	ld	(_scroll_x), bc
00107$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefScrollLimits.c:11: if (scroll_h < (SCREEN_HEIGHT - scroll_h_border)) scroll_y = 0u;
	ld	hl, #_scroll_h_border
	ld	a, #0x90
	sub	a, (hl)
	inc	hl
	ld	c, a
	sbc	a, a
	sub	a, (hl)
	ld	b, a
	ld	hl, (_scroll_h)
	xor	a, a
	sbc	hl, bc
	jr	NC, 00111$
	ld	hl, #0x0000
	ld	(_scroll_y), hl
	jr	00112$
00111$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefScrollLimits.c:12: else if (scroll_y < 0) scroll_y = 0u;
	ld	a, (_scroll_y+1)
	bit	7, a
	jr	Z, 00112$
	ld	hl, #0x0000
	ld	(_scroll_y), hl
00112$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefScrollLimits.c:14: if (scroll_y > (scroll_h - SCREEN_HEIGHT + scroll_h_border)) scroll_y = (scroll_h - SCREEN_HEIGHT + scroll_h_border);
	ld	a, (_scroll_h+0)
	add	a, #0x70
	ld	c, a
	ld	a, (_scroll_h+1)
	adc	a, #0xff
	ld	b, a
	ld	hl, (_scroll_h_border)
	add	hl, bc
	ld	bc, (_scroll_y)
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	ret	NC
	ld	(_scroll_y), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefScrollLimits.c:16: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
