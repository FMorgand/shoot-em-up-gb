;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module DefVSync
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SyncVBlank
	.globl _vsync
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVSync.c:5: UINT8 SyncVBlank(void) NONBANKED {
;	---------------------------------
; Function SyncVBlank
; ---------------------------------
_SyncVBlank::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVSync.c:6: if (!vbl_count) vsync();   // wait VBlank if not slowdown
	ld	a, (_vbl_count+0)
	or	a, a
	jr	NZ, 00102$
	call	_vsync
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVSync.c:8: UINT8 delta_time = (vbl_count < 2u) ? 0u : 1u;
	ld	a, (_vbl_count+0)
	sub	a, #0x02
	jr	NC, 00105$
	xor	a, a
	jr	00106$
00105$:
	ld	a, #0x01
00106$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVSync.c:9: vbl_count = 0;
	ld	hl, #_vbl_count
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVSync.c:11: return delta_time;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVSync.c:12: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
