;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module tiles_png
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tiles
	.globl _tiles_map
	.globl _tiles_tiles_info
	.globl _tiles_tile_pals
	.globl _tiles_tiles
	.globl _tiles_palettes
	.globl b___func_tiles_tiles_info
	.globl ___func_tiles_tiles_info
	.globl b___func_tiles
	.globl ___func_tiles
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
;../obj/Release/gbc/res/tiles.png.c:12: BANKREF(tiles)
;	---------------------------------
; Function __func_tiles
; ---------------------------------
	b___func_tiles	= 255
___func_tiles::
	.local b___func_tiles 
	___bank_tiles = b___func_tiles 
	.globl ___bank_tiles 
;../obj/Release/gbc/res/tiles.png.c:28: BANKREF(tiles_tiles_info)
;	---------------------------------
; Function __func_tiles_tiles_info
; ---------------------------------
	b___func_tiles_tiles_info	= 255
___func_tiles_tiles_info::
	.local b___func_tiles_tiles_info 
	___bank_tiles_tiles_info = b___func_tiles_tiles_info 
	.globl ___bank_tiles_tiles_info 
	.area _CODE_255
_tiles_palettes:
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x0000
_tiles_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x20	; 32
	.db #0xc3	; 195
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xf9	; 249
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x20	; 32
_tiles_tile_pals:
	.db #0x00	; 0
	.db #0x00	; 0
_tiles_tiles_info:
	.db #0x02	; 2
	.dw _tiles_tiles
	.db #0x01	; 1
	.dw _tiles_palettes
	.dw _tiles_tile_pals
_tiles_map:
	.db #0x00	; 0
	.db #0x01	; 1
_tiles:
	.dw _tiles_map
	.dw #0x0001
	.dw #0x0002
	.dw #0x0000
	.byte ___bank_tiles_tiles_info
	.dw _tiles_tiles_info
	.db #0x00	; 0
	.dw #0x0000
	.area _INITIALIZER
	.area _CABS (ABS)
