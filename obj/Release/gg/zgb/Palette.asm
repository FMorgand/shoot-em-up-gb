;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Palette
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
	.globl _set_palette
	.globl _last_bg_pal_loaded
	.globl _default_palette
	.globl b_SetDefaultColorPalettes
	.globl _SetDefaultColorPalettes
	.globl _SetPalette
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
_last_bg_pal_loaded::
	.ds 1
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:27: INT8 SetPalette(PALETTE_TYPE t, UINT8 first_palette, UINT8 nb_palettes, const palette_color_t *rgb_data, UINT8 bank) NONBANKED {
;	---------------------------------
; Function SetPalette
; ---------------------------------
_SetPalette::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	ld	-1 (ix), a
	ld	b, l
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:32: if (!nb_palettes)
	ld	a, 4 (ix)
	or	a, a
	jr	NZ, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:33: return 0;
	xor	a, a
	jp	00111$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:34: if ((first_palette + nb_palettes) > MAX_PALETTES)
	ld	-6 (ix), b
	ld	-5 (ix), #0x00
	ld	e, 4 (ix)
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	ld	a, #0x01
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:35: return 0; // Adding more palettes than supported
	xor	a, a
	jp	00111$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:37: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-4 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:38: SWITCH_ROM(bank);
	ld	a, 7 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:39: WAIT_WRITABLE_CRAM;
00105$:
	in	a, (_VCOUNTER)
	sub	a, #0xd8
	jr	C, 00105$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:40: if (t == BG_PALETTE) {
	bit	0, -1 (ix)
	jr	NZ, 00109$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:41: set_bkg_palette(first_palette, nb_palettes, rgb_data);
	push	de
	ld	l, 5 (ix)
	ld	h, 6 (ix)
	push	hl
	ld	a, 4 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_palette
	pop	de
	jr	00110$
00109$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:43: set_sprite_palette(first_palette, nb_palettes, rgb_data);
	push	de
	ld	l, 5 (ix)
	ld	h, 6 (ix)
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_palette
	pop	de
00110$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:45: memcpy(((t == BG_PALETTE) ? ZGB_Fading_BPal : ZGB_Fading_SPal) + (first_palette * N_PALETTE_COLORS), rgb_data, nb_palettes * PALETTE_SIZE);
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	c, 5 (ix)
	ld	b, 6 (ix)
	bit	0, -1 (ix)
	jr	NZ, 00113$
	ld	hl, #_ZGB_Fading_BPal+0
	ld	-3 (ix), l
	ld	-2 (ix), h
	jr	00114$
00113$:
	ld	hl, #_ZGB_Fading_SPal+0
	ld	-3 (ix), l
	ld	-2 (ix), h
00114$:
	pop	hl
	push	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, -3 (ix)
	ld	l, a
	ld	a, h
	adc	a, -2 (ix)
	push	de
	ld	e, c
	ld	d, b
	ld	h, a
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:46: SWITCH_ROM(__save);
	ld	a, -4 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:48: return nb_palettes;
	ld	a, 4 (ix)
00111$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:50: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	pop	bc
	jp	(hl)
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:14: void SetDefaultColorPalettes(void) BANKED {
;	---------------------------------
; Function SetDefaultColorPalettes
; ---------------------------------
	b_SetDefaultColorPalettes	= 1
_SetDefaultColorPalettes::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:18: set_bkg_palette(0, MAX_PALETTES, default_palette);
	ld	hl, #_default_palette
	push	hl
	ld	hl, #0x100
	push	hl
	call	_set_palette
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:19: memcpy(ZGB_Fading_BPal, default_palette, MAX_PALETTES * PALETTE_SIZE);
	ld	hl, #0x0020
	push	hl
	ld	de, #_default_palette
	ld	hl, #_ZGB_Fading_BPal
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:20: set_sprite_palette(0, MAX_PALETTES, default_palette);
	ld	hl, #_default_palette
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_palette
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:21: memcpy(ZGB_Fading_SPal, default_palette, MAX_PALETTES * PALETTE_SIZE);
	ld	hl, #0x0020
	push	hl
	ld	de, #_default_palette
	ld	hl, #_ZGB_Fading_SPal
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Palette.c:25: }
	ret
_default_palette:
	.dw #0x0fff
	.dw #0x0aaa
	.dw #0x0555
	.dw #0x0000
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.area _CODE_1
	.area _INITIALIZER
__xinit__last_bg_pal_loaded:
	.db #0x00	; 0
	.area _CABS (ABS)
