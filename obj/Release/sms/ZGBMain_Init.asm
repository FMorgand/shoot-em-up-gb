;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module ZGBMain_Init
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_InitSprites
	.globl _InitSprites
	.globl b_InitStates
	.globl _InitStates
	.globl _StateDestroyDefault
	.globl _memcpy
	.globl _spritePalsOffset
	.globl _spriteIdxsHV
	.globl _spriteIdxsV
	.globl _spriteIdxsH
	.globl _spriteIdxs
	.globl _spriteFlips
	.globl _spriteDatas
	.globl _spriteDestroyFuncs
	.globl _spriteUpdateFuncs
	.globl _spriteStartFuncs
	.globl _spriteDataBanks
	.globl _spriteBanks
	.globl _destroyFuncs
	.globl _updateFuncs
	.globl _startFuncs
	.globl _stateBanks
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
_stateBanks::
	.ds 1
_startFuncs::
	.ds 2
_updateFuncs::
	.ds 2
_destroyFuncs::
	.ds 2
_spriteBanks::
	.ds 1
_spriteDataBanks::
	.ds 1
_spriteStartFuncs::
	.ds 2
_spriteUpdateFuncs::
	.ds 2
_spriteDestroyFuncs::
	.ds 2
_spriteDatas::
	.ds 2
_spriteFlips::
	.ds 1
_spriteIdxs::
	.ds 1
_spriteIdxsH::
	.ds 1
_spriteIdxsV::
	.ds 1
_spriteIdxsHV::
	.ds 1
_spritePalsOffset::
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:16: void StateDestroyDefault(void) NONBANKED {
;	---------------------------------
; Function StateDestroyDefault
; ---------------------------------
_StateDestroyDefault::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:17: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_255
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:39: void InitStates(void) BANKED {
;	---------------------------------
; Function InitStates
; ---------------------------------
	b_InitStates	= 255
_InitStates::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:40: memcpy(stateBanks, __stateBanks, sizeof(stateBanks));
	ld	hl, #0x0001
	push	hl
	ld	de, #___stateBanks
	ld	hl, #_stateBanks
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:41: memcpy(startFuncs, __startFuncs, sizeof(startFuncs));
	ld	hl, #0x0002
	push	hl
	ld	de, #___startFuncs
	ld	hl, #_startFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:42: memcpy(updateFuncs, __updateFuncs, sizeof(updateFuncs));
	ld	hl, #0x0002
	push	hl
	ld	de, #___updateFuncs
	ld	hl, #_updateFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:43: memcpy(destroyFuncs, __destroyFuncs, sizeof(destroyFuncs));
	ld	hl, #0x0002
	push	hl
	ld	de, #___destroyFuncs
	ld	hl, #_destroyFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:44: }
	ret
___stateBanks:
	.byte ___bank_StateGame
___startFuncs:
	.dw _Start_StateGame
___updateFuncs:
	.dw _Update_StateGame
___destroyFuncs:
	.dw _StateDestroyDefault
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:118: void InitSprites(void) BANKED {
;	---------------------------------
; Function InitSprites
; ---------------------------------
	b_InitSprites	= 255
_InitSprites::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:119: memcpy(spriteBanks,        __spriteBanks,        sizeof(spriteBanks)       );
	ld	hl, #0x0001
	push	hl
	ld	de, #___spriteBanks
	ld	hl, #_spriteBanks
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:120: memcpy(spriteDataBanks,    __spriteDataBanks,    sizeof(spriteDataBanks)   );
	ld	hl, #0x0001
	push	hl
	ld	de, #___spriteDataBanks
	ld	hl, #_spriteDataBanks
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:121: memcpy(spriteStartFuncs,   __spriteStartFuncs,   sizeof(spriteStartFuncs)  );
	ld	hl, #0x0002
	push	hl
	ld	de, #___spriteStartFuncs
	ld	hl, #_spriteStartFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:122: memcpy(spriteUpdateFuncs,  __spriteUpdateFuncs,  sizeof(spriteUpdateFuncs) );
	ld	hl, #0x0002
	push	hl
	ld	de, #___spriteUpdateFuncs
	ld	hl, #_spriteUpdateFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:123: memcpy(spriteDestroyFuncs, __spriteDestroyFuncs, sizeof(spriteDestroyFuncs));
	ld	hl, #0x0002
	push	hl
	ld	de, #___spriteDestroyFuncs
	ld	hl, #_spriteDestroyFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:124: memcpy(spriteDatas,        __spriteDatas,        sizeof(spriteDatas)       );
	ld	hl, #0x0002
	push	hl
	ld	de, #___spriteDatas
	ld	hl, #_spriteDatas
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:125: memcpy(spriteFlips,        __spriteFlips,        sizeof(spriteFlips)       );
	ld	hl, #0x0001
	push	hl
	ld	de, #___spriteFlips
	ld	hl, #_spriteFlips
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:126: }
	ret
___spriteBanks:
	.byte ___bank_SpritePlayer
	.db #0x00	; 0
___spriteDataBanks:
	.byte ___bank_player
	.db #0x00	; 0
___spriteStartFuncs:
	.dw _Start_SpritePlayer
	.dw #0x0000
___spriteUpdateFuncs:
	.dw _Update_SpritePlayer
	.dw #0x0000
___spriteDestroyFuncs:
	.dw _Destroy_SpritePlayer
	.dw #0x0000
___spriteDatas:
	.dw _player
	.dw #0x0000
___spriteFlips:
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
