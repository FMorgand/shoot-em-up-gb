;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module gbt_player
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __gbt_channel3_loaded_instrument
	.globl _gbt_play
	.globl _gbt_pause
	.globl _gbt_stop
	.globl _gbt_loop
	.globl _gbt_update
	.globl _gbt_enable_channels
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
__gbt_channel3_loaded_instrument::
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:3: void gbt_play(void *data, UINT8 bank, UINT8 speed) OLDCALL {
;	---------------------------------
; Function gbt_play
; ---------------------------------
_gbt_play::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:4: data; bank; speed;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:5: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:7: void gbt_pause(UINT8 pause) OLDCALL {
;	---------------------------------
; Function gbt_pause
; ---------------------------------
_gbt_pause::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:8: pause;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:9: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:11: void gbt_stop(void) OLDCALL {
;	---------------------------------
; Function gbt_stop
; ---------------------------------
_gbt_stop::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:12: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:14: void gbt_loop(UINT8 loop) OLDCALL {
;	---------------------------------
; Function gbt_loop
; ---------------------------------
_gbt_loop::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:15: loop;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:16: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:18: void gbt_update(void) OLDCALL {
;	---------------------------------
; Function gbt_update
; ---------------------------------
_gbt_update::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:19: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:21: void gbt_enable_channels(UINT8 channel_flags) OLDCALL {
;	---------------------------------
; Function gbt_enable_channels
; ---------------------------------
_gbt_enable_channels::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:22: channel_flags;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/gbt_player.c:23: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
