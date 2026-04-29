;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module hUGEDriver
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hUGE_mute_mask
	.globl _hUGE_current_wave
	.globl _hUGE_init
	.globl _hUGE_dosound
	.globl _hUGE_mute_channel
	.globl _hUGE_set_position
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
_hUGE_current_wave::
	.ds 1
_hUGE_mute_mask::
	.ds 1
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:3: void hUGE_init(const hUGESong_t * song) {
;	---------------------------------
; Function hUGE_init
; ---------------------------------
_hUGE_init::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:4: song;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:5: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:7: void hUGE_dosound(void) {
;	---------------------------------
; Function hUGE_dosound
; ---------------------------------
_hUGE_dosound::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:8: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:10: void hUGE_mute_channel(enum hUGE_channel_t ch, enum hUGE_mute_t mute) {
;	---------------------------------
; Function hUGE_mute_channel
; ---------------------------------
_hUGE_mute_channel::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:11: ch; mute;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:12: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:14: void hUGE_set_position(unsigned char pattern) {
;	---------------------------------
; Function hUGE_set_position
; ---------------------------------
_hUGE_set_position::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:15: pattern;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/hUGEDriver.c:16: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__hUGE_current_wave:
	.db #0x00	; 0
__xinit__hUGE_mute_mask:
	.db #0x00	; 0
	.area _CABS (ABS)
