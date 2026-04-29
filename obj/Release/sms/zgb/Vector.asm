;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Vector
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
	.globl _BufferExchange
	.globl _BufferRotate
	.globl _VectorRemovePos
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Vector.c:5: void BufferExchange(UINT8* v, UINT16 xy) NAKED {
;	---------------------------------
; Function BufferExchange
; ---------------------------------
_BufferExchange::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Vector.c:63: __endasm;
	ld	b, d
	ld	c, e
	ex	de, hl
	ld	a, e
	add	c
	ld	l, a
	adc	d
	sub	l
	ld	h, a
	ld	c, (hl)
	push	hl
	ld	a, e
	add	b
	ld	l, a
	adc	d
	sub	l
	ld	h, a
	ld	a, (hl)
	ld	(hl), c
	pop	hl
	ld	(hl), a
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Vector.c:64: }
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Vector.c:66: void BufferRotate(UINT8* v, UINT8 len) NAKED {
;	---------------------------------
; Function BufferRotate
; ---------------------------------
_BufferRotate::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Vector.c:116: __endasm;
	pop	bc
	dec	sp
	pop	af
	push	bc
	sub	#1
	ret	c
	ret	z
	ld	c, a
	ld	b, #0
	ld	d, h
	ld	e, l
	ld	a, (de)
	inc	hl
	ldir
	ld	(de), a
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Vector.c:117: }
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Vector.c:119: void VectorRemovePos(UINT8* v, UINT8 pos) {
;	---------------------------------
; Function VectorRemovePos
; ---------------------------------
_VectorRemovePos::
	push	ix
	ld	ix,#0
	add	ix,sp
	ex	de, hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Vector.c:120: memcpy(&v[pos + 1], &v[pos + 2], (UINT8)((UINT8)(v[0]--) - pos));
	ld	a, (de)
	ld	c, a
	dec	a
	ld	(de), a
	ld	a, c
	sub	a, 4 (ix)
	ld	c, a
	ld	b, #0x00
	ld	l, 4 (ix)
	ld	h, #0x00
	push	hl
	inc	hl
	pop	iy
	inc	iy
	inc	iy
	add	iy, de
	add	hl, de
	push	bc
	push	iy
	pop	de
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Vector.c:121: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
