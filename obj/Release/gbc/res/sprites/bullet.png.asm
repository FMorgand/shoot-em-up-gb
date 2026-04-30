;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module bullet_png
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _bullet
	.globl _bullet_metasprites
	.globl _bullet_metasprite0
	.globl _bullet_tiles
	.globl _bullet_palettes
	.globl b___func_bullet
	.globl ___func_bullet
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
;../obj/Release/gbc/res/sprites/bullet.png.c:12: BANKREF(bullet)
;	---------------------------------
; Function __func_bullet
; ---------------------------------
	b___func_bullet	= 255
___func_bullet::
	.local b___func_bullet 
	___bank_bullet = b___func_bullet 
	.globl ___bank_bullet 
	.area _CODE_255
_bullet_palettes:
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
_bullet_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0xf5	; 245
	.db #0x8b	; 139
	.db #0xcb	; 203
	.db #0xb5	; 181
	.db #0xd7	; 215
	.db #0xa9	; 169
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_bullet_metasprite0:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_bullet_metasprites:
	.dw _bullet_metasprite0
_bullet:
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x02	; 2
	.dw _bullet_tiles
	.db #0x01	; 1
	.dw _bullet_palettes
	.db #0x01	; 1
	.dw _bullet_metasprites
	.area _INITIALIZER
	.area _CABS (ABS)
