;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module player_png
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _player
	.globl _player_metasprites
	.globl _player_metasprite0
	.globl _player_tiles
	.globl _player_palettes
	.globl b___func_player
	.globl ___func_player
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
	.area _CODE_255
;../obj/Release/gbc/res/sprites/player.png.c:12: BANKREF(player)
;	---------------------------------
; Function __func_player
; ---------------------------------
	b___func_player	= 255
___func_player::
	.local b___func_player 
	___bank_player = b___func_player 
	.globl ___bank_player 
	.area _CODE_255
_player_palettes:
	.dw #0x17bc
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
_player_tiles:
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xce	; 206
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xce	; 206
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
_player_metasprite0:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_player_metasprites:
	.dw _player_metasprite0
_player:
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x02	; 2
	.dw _player_tiles
	.db #0x01	; 1
	.dw _player_palettes
	.db #0x01	; 1
	.dw _player_metasprites
	.area _INITIALIZER
	.area _CABS (ABS)
