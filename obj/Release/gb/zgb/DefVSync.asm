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
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
	ld	a, (#_vbl_count)
	or	a, a
	jr	NZ, 00102$
	call	_vsync
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefVSync.c:8: UINT8 delta_time = (vbl_count < 2u) ? 0u : 1u;
	ld	a, (#_vbl_count)
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
