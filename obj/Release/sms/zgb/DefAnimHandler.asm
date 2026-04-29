;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module DefAnimHandler
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GetSpriteAnimation
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
___save:
	.ds 1
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefAnimHandler.c:9: const metasprite_t * GetSpriteAnimation(Sprite * sprite, UINT16 anim_idx) {
;	---------------------------------
; Function GetSpriteAnimation
; ---------------------------------
_GetSpriteAnimation::
	ld	c, l
	ld	b, h
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefAnimHandler.c:10: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(___save+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefAnimHandler.c:11: SWITCH_ROM(sprite->mt_sprite_bank);
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefAnimHandler.c:12: struct metasprite_t * res = sprite->mt_sprite_info->metasprites[anim_idx];
	ld	hl, #7
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #9
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ex	de, hl
	add	hl, hl
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefAnimHandler.c:13: SWITCH_ROM(__save);
	ld	a, (___save+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefAnimHandler.c:14: return res;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/DefAnimHandler.c:15: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
