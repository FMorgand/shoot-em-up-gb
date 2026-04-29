;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module DefVBlankHandler
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _VBL_isr
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVBlankHandler.c:7: void VBL_isr(void) NONBANKED {
;	---------------------------------
; Function VBL_isr
; ---------------------------------
_VBL_isr::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVBlankHandler.c:8: vbl_count ++;
	ld	hl, #_vbl_count
	inc	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVBlankHandler.c:12: if (_shadow_OAM_OFF == 0) {
	ld	a, (__shadow_OAM_OFF+0)
	or	a, a
	ret	NZ
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVBlankHandler.c:13: __WRITE_VDP_REG_UNSAFE(VDP_RSCX, -(scroll_x_vblank + TILE_TO_PX(scroll_offset_x)));
	ld	hl, (_scroll_x_vblank)
	ld	a, (_scroll_offset_x+0)
	add	a, a
	add	a, a
	add	a, a
	add	a, l
	ld	hl, #_shadow_VDP_RSCX
	neg
	ld	(hl), a
	ld	a, (_shadow_VDP_RSCX+0)
	out	(_VDP_CMD), a
	ld	a, #0x88
	out	(_VDP_CMD), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVBlankHandler.c:14: __WRITE_VDP_REG_UNSAFE(VDP_RSCY, (((UINT16)(scroll_y_vblank + TILE_TO_PX(scroll_offset_y))) % TILE_TO_PX(DEVICE_SCREEN_BUFFER_HEIGHT)));
	ld	a, (_scroll_offset_y)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_scroll_y_vblank)
	add	hl, de
	ld	de, #0x00e0
	call	__moduint
	ld	hl, #_shadow_VDP_RSCY
	ld	(hl), e
	ld	a, (_shadow_VDP_RSCY+0)
	out	(_VDP_CMD), a
	ld	a, #0x89
	out	(_VDP_CMD), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVBlankHandler.c:17: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
