;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SRAM
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memset
	.globl _strcmp
	.globl _strcpy
	.globl b_CheckSRAMIntegrity
	.globl _CheckSRAMIntegrity
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
	.area _CODE_1
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:10: void CheckSRAMIntegrity(UINT8* ptr, UINT16 size) BANKED {
;	---------------------------------
; Function CheckSRAMIntegrity
; ---------------------------------
	b_CheckSRAMIntegrity	= 1
_CheckSRAMIntegrity::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:11: ENABLE_RAM;
	ld	a, (_RAM_CONTROL+0)
	or	a, #0x08
	ld	(_RAM_CONTROL+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:12: SWITCH_RAM(0);
	ld	a, (_RAM_CONTROL+0)
	and	a, #0xfb
	ld	(_RAM_CONTROL+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:13: UINT16 bytes_to_clear = 0;
	ld	bc, #0x0000
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:14: UINT16* bytes_stored = (UINT16*)(ptr + MAGIC_LENGTH);
	ld	l, 7 (ix)
	ld	h, 8 (ix)
	ld	de, #0x0009
	add	hl, de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:15: if(strcmp((char*)ptr, MAGIC) != 0) {
	ld	a, 7 (ix)
	ld	-2 (ix), a
	ld	a, 8 (ix)
	ld	-1 (ix), a
	push	hl
	push	bc
	ld	de, #___str_0
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	call	_strcmp
	pop	bc
	pop	hl
	ld	a, d
	or	a, e
	jr	Z, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:16: strcpy(ptr, MAGIC);
	push	hl
	ld	de, #___str_0
	push	de
	ld	e, 7 (ix)
	ld	d, 8 (ix)
	push	de
	call	_strcpy
	pop	af
	pop	af
	pop	hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:18: bytes_to_clear = size - MAGIC_LENGTH - 2;
	ld	a, 9 (ix)
	add	a, #0xf5
	ld	c, a
	ld	a, 10 (ix)
	adc	a, #0xff
	ld	b, a
	jr	00105$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:20: if(*bytes_stored < size) {
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	sub	a, 9 (ix)
	ld	a, d
	sbc	a, 10 (ix)
	jr	NC, 00105$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:21: bytes_to_clear = size - *bytes_stored;
	ld	a, 9 (ix)
	sub	a, e
	ld	c, a
	ld	a, 10 (ix)
	sbc	a, d
	ld	b, a
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:25: if(*bytes_stored != size) {
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, 9 (ix)
	sub	a, e
	jr	NZ, 00140$
	ld	a, 10 (ix)
	sub	a, d
	jr	Z, 00107$
00140$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:26: *bytes_stored = size;
	ld	a, 9 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 10 (ix)
	ld	(hl), a
00107$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:29: if(bytes_to_clear > 0) {
	ld	a, b
	or	a, c
	jr	Z, 00109$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:30: memset(ptr + size - bytes_to_clear, 0, bytes_to_clear);
	ld	a, 7 (ix)
	add	a, 9 (ix)
	ld	l, a
	ld	a, 8 (ix)
	adc	a, 10 (ix)
	ld	h, a
	cp	a, a
	sbc	hl, bc
	push	bc
	ld	de, #0x0000
	push	de
	push	hl
	call	_memset
00109$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:32: DISABLE_RAM;
	ld	a, (_RAM_CONTROL+0)
	and	a, #0xf7
	ld	(_RAM_CONTROL+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SRAM.c:33: }
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "ZGB-SAVE"
	.db 0x00
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
