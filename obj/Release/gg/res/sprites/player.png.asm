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
	.area _CODE_255
;../obj/Release/gg/res/sprites/player.png.c:12: BANKREF(player)
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
	.dw #0x02ee
	.dw #0x04b3
	.dw #0x0372
	.dw #0x0230
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
_player_tiles:
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2e	; 46
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
_player_metasprite0:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
_player_metasprites:
	.dw _player_metasprite0
_player:
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x04	; 4
	.dw _player_tiles
	.db #0x01	; 1
	.dw _player_palettes
	.db #0x01	; 1
	.dw _player_metasprites
	.area _INITIALIZER
	.area _CABS (ABS)
