;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SGB
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _LoadSGBBorder
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/duck/SGB.c:3: void LoadSGBBorder(UINT8 map_bank, struct MapInfo* map) {
;	---------------------------------
; Function LoadSGBBorder
; ---------------------------------
_LoadSGBBorder::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/duck/SGB.c:4: map_bank; map;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/duck/SGB.c:5: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
