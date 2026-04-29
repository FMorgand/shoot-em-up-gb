;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module ZGBMain
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GetTileReplacement
	.globl _next_state
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
_next_state::
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;ZGBMain.c:6: UINT8 GetTileReplacement(UINT8* tile_ptr, UINT8* tile) {
;	---------------------------------
; Function GetTileReplacement
; ---------------------------------
_GetTileReplacement::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, l
	ld	b, h
;ZGBMain.c:7: if(current_state == StateGame) {
	ld	a, (_current_state+0)
	or	a, a
	jr	NZ, 00104$
;ZGBMain.c:8: if(U_LESS_THAN(255 - (UINT16)*tile_ptr, N_SPRITE_TYPES)) {
	ld	a, (bc)
	ld	-1 (ix), a
	ld	l, a
	ld	h, #0x00
	ld	a, #0xfe
	sub	a, l
	sbc	a, a
	sub	a, h
	bit	7,a
	jr	Z, 00102$
;ZGBMain.c:9: *tile = 0;
	xor	a, a
	ld	(de), a
;ZGBMain.c:10: return 255 - (UINT16)*tile_ptr;
	ld	a, (bc)
	ld	c, a
	ld	a, #0xff
	sub	a, c
	jr	00105$
00102$:
;ZGBMain.c:13: *tile = *tile_ptr;
	ld	a, -1 (ix)
	ld	(de), a
00104$:
;ZGBMain.c:16: return 255u;
	ld	a, #0xff
00105$:
;ZGBMain.c:17: }
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__next_state:
	.db #0x00	; 0
	.area _CABS (ABS)
