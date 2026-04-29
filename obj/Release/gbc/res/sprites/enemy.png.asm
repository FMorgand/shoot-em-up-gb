;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module enemy_png
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _enemy
	.globl _enemy_metasprites
	.globl _enemy_metasprite0
	.globl _enemy_tiles
	.globl _enemy_palettes
	.globl b___func_enemy
	.globl ___func_enemy
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
;../obj/Release/gbc/res/sprites/enemy.png.c:12: BANKREF(enemy)
;	---------------------------------
; Function __func_enemy
; ---------------------------------
	b___func_enemy	= 255
___func_enemy::
	.local b___func_enemy 
	___bank_enemy = b___func_enemy 
	.globl ___bank_enemy 
	.area _CODE_255
_enemy_palettes:
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
_enemy_tiles:
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x2e	; 46
	.db #0x3f	; 63
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x26	; 38
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x14	; 20
	.db #0xfc	; 252
	.db #0x44	; 68	'D'
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xc4	; 196
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
_enemy_metasprite0:
	.db #0xf8	; -8
	.db #0xf8	; -8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_enemy_metasprites:
	.dw _enemy_metasprite0
_enemy:
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x04	; 4
	.dw _enemy_tiles
	.db #0x01	; 1
	.dw _enemy_palettes
	.db #0x01	; 1
	.dw _enemy_metasprites
	.area _INITIALIZER
	.area _CABS (ABS)
