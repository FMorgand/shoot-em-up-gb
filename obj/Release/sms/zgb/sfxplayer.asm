;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module sfxplayer
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sfx_play_sample
	.globl _sfx_play_bank
	.globl _sfx_frame_skip
	.globl _sfx_play_isr
	.globl _sfx_sound_cut_mask
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
_sfx_frame_skip::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_sfx_play_bank::
	.ds 1
_sfx_play_sample::
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/sfxplayer.c:9: UINT8 sfx_play_isr(void) NONBANKED NAKED {
;	---------------------------------
; Function sfx_play_isr
; ---------------------------------
_sfx_play_isr::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/sfxplayer.c:66: __endasm;
	ld	de, (_sfx_play_sample)
	ld	a, d
	or	e
	ret	z ; return 0
	ld	hl, #_sfx_frame_skip
	xor	a
	or	(hl)
	jr	z, 7$
	dec	(hl)
	ret	; A != 0 that returns 1
7$:
	ex	de, hl
	ld	a, (_MAP_FRAME1) ; save bank and switch
	ld	e, a
	ld	a, (_sfx_play_bank)
	inc	a ; 0xffu ?
	ret	z ; return 0
	dec	a
	ld	(_MAP_FRAME1), a
	ld	d, #0x0f
	ld	a, (hl)
	rlca
	rlca
	rlca
	rlca
	and	d
	ld	(_sfx_frame_skip), a
	ld	a, (hl)
	inc	hl
	and	d
	ld	b, a ; b = frame channel count
	jp	z, 0$ ; length 0 == terminator
	cp	d
	jp	z, 0$ ; length 0x0f == empty row
	ld	c, #_PSG
	otir
6$:
	inc	b ; return 1 if still playing
0$:
	ld	(_sfx_play_sample), hl ; save current position
	ld	a, e ; restore bank
	ld	(_MAP_FRAME1), a
	ld	a, b ; result in a
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/sfxplayer.c:75: }
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/sfxplayer.c:77: void sfx_sound_cut_mask(uint8_t mask) NAKED {
;	---------------------------------
; Function sfx_sound_cut_mask
; ---------------------------------
_sfx_sound_cut_mask::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/sfxplayer.c:101: __endasm;
	and	#0b00001111
	ret	z ; if nothing to retrigger then return
	ld	c, #_PSG ; c points to the PSG port
	ld	hl, #2$ ; hl points to the muting data
0$:
	srl	a
	jr	nc, 1$
	outi
	or	a
	ret	z
	jr	0$
1$:
	inc	hl
	jr	0$
2$:
	.irp	ch,0,1,2,3
	.db	#(0b10000000 | (ch << 5) | 0b00010000 | 0x0f)
	.endm
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/sfxplayer.c:108: }
	.area _CODE
	.area _INITIALIZER
__xinit__sfx_play_bank:
	.db #0xff	; 255
__xinit__sfx_play_sample:
	.dw #0x0000
	.area _CABS (ABS)
