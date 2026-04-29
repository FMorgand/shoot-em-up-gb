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
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_stateBanks::
	.ds 1
_startFuncs::
	.ds 2
_updateFuncs::
	.ds 2
_destroyFuncs::
	.ds 2
_spriteBanks::
	.ds 3
_spriteDataBanks::
	.ds 3
_spriteStartFuncs::
	.ds 6
_spriteUpdateFuncs::
	.ds 6
_spriteDestroyFuncs::
	.ds 6
_spriteDatas::
	.ds 6
_spriteFlips::
	.ds 3
_spriteIdxs::
	.ds 3
_spriteIdxsH::
	.ds 3
_spriteIdxsV::
	.ds 3
_spriteIdxsHV::
	.ds 3
_spritePalsOffset::
	.ds 3
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
	ld	de, #0x0001
	push	de
	ld	bc, #___stateBanks
	ld	de, #_stateBanks
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:41: memcpy(startFuncs, __startFuncs, sizeof(startFuncs));
	ld	de, #0x0002
	push	de
	ld	bc, #___startFuncs
	ld	de, #_startFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:42: memcpy(updateFuncs, __updateFuncs, sizeof(updateFuncs));
	ld	de, #0x0002
	push	de
	ld	bc, #___updateFuncs
	ld	de, #_updateFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:43: memcpy(destroyFuncs, __destroyFuncs, sizeof(destroyFuncs));
	ld	de, #0x0002
	push	de
	ld	bc, #___destroyFuncs
	ld	de, #_destroyFuncs
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
	ld	de, #0x0003
	push	de
	ld	bc, #___spriteBanks
	ld	de, #_spriteBanks
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:120: memcpy(spriteDataBanks,    __spriteDataBanks,    sizeof(spriteDataBanks)   );
	ld	de, #0x0003
	push	de
	ld	bc, #___spriteDataBanks
	ld	de, #_spriteDataBanks
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:121: memcpy(spriteStartFuncs,   __spriteStartFuncs,   sizeof(spriteStartFuncs)  );
	ld	de, #0x0006
	push	de
	ld	bc, #___spriteStartFuncs
	ld	de, #_spriteStartFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:122: memcpy(spriteUpdateFuncs,  __spriteUpdateFuncs,  sizeof(spriteUpdateFuncs) );
	ld	de, #0x0006
	push	de
	ld	bc, #___spriteUpdateFuncs
	ld	de, #_spriteUpdateFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:123: memcpy(spriteDestroyFuncs, __spriteDestroyFuncs, sizeof(spriteDestroyFuncs));
	ld	de, #0x0006
	push	de
	ld	bc, #___spriteDestroyFuncs
	ld	de, #_spriteDestroyFuncs
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:124: memcpy(spriteDatas,        __spriteDatas,        sizeof(spriteDatas)       );
	ld	de, #0x0006
	push	de
	ld	bc, #___spriteDatas
	ld	de, #_spriteDatas
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:125: memcpy(spriteFlips,        __spriteFlips,        sizeof(spriteFlips)       );
	ld	de, #0x0003
	push	de
	ld	bc, #___spriteFlips
	ld	de, #_spriteFlips
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/init/ZGBMain_Init.c:126: }
	ret
___spriteBanks:
	.byte ___bank_SpritePlayer
	.byte ___bank_SpriteBullet
	.byte ___bank_SpriteEnemy
	.db #0x00	; 0
___spriteDataBanks:
	.byte ___bank_player
	.byte ___bank_bullet
	.byte ___bank_enemy
	.db #0x00	; 0
___spriteStartFuncs:
	.dw _Start_SpritePlayer
	.dw _Start_SpriteBullet
	.dw _Start_SpriteEnemy
	.dw #0x0000
___spriteUpdateFuncs:
	.dw _Update_SpritePlayer
	.dw _Update_SpriteBullet
	.dw _Update_SpriteEnemy
	.dw #0x0000
___spriteDestroyFuncs:
	.dw _Destroy_SpritePlayer
	.dw _Destroy_SpriteBullet
	.dw _Destroy_SpriteEnemy
	.dw #0x0000
___spriteDatas:
	.dw _player
	.dw _bullet
	.dw _enemy
	.dw #0x0000
___spriteFlips:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
