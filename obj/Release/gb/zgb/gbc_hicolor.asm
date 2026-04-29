;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module gbc_hicolor
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hicolor_start
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/gbc_hicolor.c:123: uint8_t hicolor_start(const hicolor_data * p_hicolor, uint8_t hicolor_bank) NONBANKED {
;	---------------------------------
; Function hicolor_start
; ---------------------------------
_hicolor_start::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/gbc_hicolor.c:127: return 0;
	xor	a, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/gb/gbc_hicolor.c:178: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
