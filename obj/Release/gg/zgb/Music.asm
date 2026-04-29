;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Music
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sfx_play_isr
	.globl _sfx_sound_cut_mask
	.globl _stop_music_on_new_state
	.globl _last_music_bank
	.globl _last_music
	.globl _sfx_priority
	.globl _music_mute_mask
	.globl _music_paused
	.globl _compensate_music_NTSC
	.globl _MUSIC_isr
	.globl ___PlayMusic
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
_compensate_music_NTSC::
	.ds 1
_music_compensation:
	.ds 1
_MUSIC_isr_old_mute_mask_10000_149:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_music_paused::
	.ds 1
_music_mute_mask::
	.ds 1
_sfx_priority::
	.ds 1
_last_music::
	.ds 2
_last_music_bank::
	.ds 1
_stop_music_on_new_state::
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:85: static UINT8 old_mute_mask = ~MUTE_MASK_NONE;
	ld	iy, #_MUSIC_isr_old_mute_mask_10000_149
	ld	0 (iy), #0xff
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:84: void MUSIC_isr(void) NONBANKED {
;	---------------------------------
; Function MUSIC_isr
; ---------------------------------
_MUSIC_isr::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:88: if ((compensate_music_NTSC) && (++music_compensation > 5)) {
	ld	a, (_compensate_music_NTSC+0)
	or	a, a
	jr	Z, 00102$
	ld	iy, #_music_compensation
	inc	0 (iy)
	ld	a, #0x05
	sub	a, 0 (iy)
	jr	NC, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:89: music_compensation = 0; 
	ld	0 (iy), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:90: return;
	ret
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:94: if (old_mute_mask != music_mute_mask) {
	ld	a, (_MUSIC_isr_old_mute_mask_10000_149+0)
	ld	hl, #_music_mute_mask
	sub	a, (hl)
	jr	Z, 00105$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:96: old_mute_mask = music_mute_mask;
	ld	a, (_music_mute_mask+0)
	ld	(_MUSIC_isr_old_mute_mask_10000_149+0), a
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:99: if (sfx_play_bank != SFX_STOP_BANK) {
	ld	a, (_sfx_play_bank+0)
	inc	a
	jr	Z, 00109$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:100: if (!sfx_play_isr()) {
	call	_sfx_play_isr
	or	a, a
	jr	NZ, 00109$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:102: sfx_sound_cut_mask(music_mute_mask);
	ld	a, (_music_mute_mask)
	call	_sfx_sound_cut_mask
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:105: music_mute_mask = old_mute_mask = MUTE_MASK_NONE;
	xor	a, a
	ld	(_MUSIC_isr_old_mute_mask_10000_149+0), a
	ld	(_music_mute_mask+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:107: sfx_priority = SFX_PRIORITY_MINIMAL;
	xor	a, a
	ld	(_sfx_priority+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:108: sfx_play_bank = SFX_STOP_BANK;
	ld	hl, #_sfx_play_bank
	ld	(hl), #0xff
00109$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:112: if (music_paused)
	ld	a, (_music_paused+0)
	or	a, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:113: return;
	ret	NZ
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:114: if (last_music_bank == SFX_STOP_BANK)
	ld	a, (_last_music_bank+0)
	inc	a
	ret	Z
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:115: return;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:139: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:141: void __PlayMusic(void* music, UINT8 bank, UINT8 loop) NONBANKED {
;	---------------------------------
; Function __PlayMusic
; ---------------------------------
___PlayMusic::
	ex	de, hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:143: if ((music != last_music) || (last_music_bank != bank)) {
	ld	hl, (_last_music)
	cp	a, a
	sbc	hl, de
	jr	NZ, 00101$
	ld	a, (_last_music_bank+0)
	ld	iy, #2
	add	iy, sp
	sub	a, 0 (iy)
	jr	Z, 00102$
00101$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:144: last_music_bank = SFX_STOP_BANK;
	ld	hl, #_last_music_bank
	ld	(hl), #0xff
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:145: UBYTE __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1)
	ld	c, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Sound.h:79: sfx_sound_cut_mask(MUTE_MASK_ALL);
	push	bc
	push	de
	ld	a, #0x0f
	call	_sfx_sound_cut_mask
	pop	de
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:164: SWITCH_ROM(__save);
	ld	hl, #_MAP_FRAME1
	ld	(hl), c
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:165: last_music = music;
	ld	(_last_music), de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:166: last_music_bank = bank;
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(_last_music_bank+0), a
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:168: music_paused = 0;
	xor	a, a
	ld	(_music_paused+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Music.c:169: }
	pop	hl
	pop	af
	jp	(hl)
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
__xinit__music_paused:
	.db #0x01	; 1
__xinit__music_mute_mask:
	.db #0x00	; 0
__xinit__sfx_priority:
	.db #0x00	; 0
__xinit__last_music:
	.dw #0x0000
__xinit__last_music_bank:
	.db #0xff	; 255
__xinit__stop_music_on_new_state:
	.db #0x01	; 1
	.area _CABS (ABS)
