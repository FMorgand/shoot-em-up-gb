;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module BankManager
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _bank_stack
	.globl _bank_stackSTACK
	.globl _PushBank
	.globl _PopBank
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
_bank_stackSTACK::
	.ds 10
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_bank_stack::
	.ds 2
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/BankManager.c:7: void PushBank(UINT8 b) NONBANKED {
;	---------------------------------
; Function PushBank
; ---------------------------------
_PushBank::
	ld	c, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/BankManager.c:8: StackPush(bank_stack, CURRENT_BANK);
	ld	hl, (_bank_stack)
	inc	hl
	ld	(_bank_stack), hl
	ld	hl, (_bank_stack)
	ld	a, (_MAP_FRAME1)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/BankManager.c:9: SWITCH_ROM(b);
	ld	hl, #_MAP_FRAME1
	ld	(hl), c
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/BankManager.c:10: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/BankManager.c:12: void PopBank(void) NONBANKED {
;	---------------------------------
; Function PopBank
; ---------------------------------
_PopBank::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/BankManager.c:13: UINT8 b = StackPop(bank_stack); 
	ld	hl, (_bank_stack)
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
	ld	hl, (_bank_stack)
	dec	hl
	ld	(_bank_stack), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/BankManager.c:14: SWITCH_ROM(b);
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/BankManager.c:15: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
__xinit__bank_stack:
	.dw (_bank_stackSTACK - 1)
	.area _CABS (ABS)
