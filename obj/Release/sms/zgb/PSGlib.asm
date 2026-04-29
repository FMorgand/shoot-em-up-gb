;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module PSGlib
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PSGMuteMask
	.globl _PSGStatus
	.globl _PSGStart
	.globl _PSGLoopFlag
	.globl _PSGPlay
	.globl _PSGRetriggerChannels
	.globl _PSGCutChannels
	.globl _PSGFrame
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
_PSGLoopFlag::
	.ds 1
_PSGStart::
	.ds 2
_PSGPointer:
	.ds 2
_PSGLoopPoint:
	.ds 2
_PSGSkipFrames:
	.ds 1
_PSGLastChannel:
	.ds 1
_PSGShadow:
	.ds 12
_PSGSubLen:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_PSGStatus::
	.ds 1
_PSGMuteMask::
	.ds 1
_PSGSubRetAddr:
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:39: void PSGPlay (void *song, uint8_t loop) {
;	---------------------------------
; Function PSGPlay
; ---------------------------------
_PSGPlay::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:42: PSGLoopFlag = loop;
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	ld	(_PSGLoopFlag+0), a
	pop	hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:43: PSGStart = song;                    // store the beginning point of music
	ld	(_PSGStart), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:44: PSGPointer = song;                  // set music pointer to the beginning
	ld	(_PSGPointer), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:45: PSGLoopPoint = song;                // loop pointer points to the beginning
	ld	(_PSGLoopPoint), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:47: PSGSkipFrames = 0;                  // reset the skip frames
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:48: PSGSubLen = 0;                      // reset the substring len (for compression)
	xor	a, a
	ld	(_PSGSkipFrames+0), a
	ld	(_PSGSubLen+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:49: PSGLastChannel = 0;                 // latch channel 0
	xor	a, a
	ld	(_PSGLastChannel+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:51: PSGShadow[PSG_CH0 >> 5].volume = PSG_LATCH | PSG_CH0 | PSG_VOLUME | 0x0f;
	ld	hl, #_PSGShadow + 2
	ld	(hl), #0x9f
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:52: PSGShadow[PSG_CH1 >> 5].volume = PSG_LATCH | PSG_CH1 | PSG_VOLUME | 0x0f;
	ld	hl, #_PSGShadow + 5
	ld	(hl), #0xbf
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:53: PSGShadow[PSG_CH2 >> 5].volume = PSG_LATCH | PSG_CH2 | PSG_VOLUME | 0x0f;
	ld	hl, #_PSGShadow + 8
	ld	(hl), #0xdf
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:54: PSGShadow[PSG_CH3 >> 5].volume = PSG_LATCH | PSG_CH3 | PSG_VOLUME | 0x0f;
	ld	hl, #_PSGShadow + 11
	ld	(hl), #0xff
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:56: PSGStatus = PSG_PLAYING;            // start playback
	ld	iy, #_PSGStatus
	ld	0 (iy), #0x01
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:57: }
	pop	hl
	inc	sp
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:59: void PSGRetriggerChannels(uint8_t mask) NAKED {
;	---------------------------------
; Function PSGRetriggerChannels
; ---------------------------------
_PSGRetriggerChannels::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:80: __endasm;
	and	#(0b00000001 | 0b00000010 | 0b00000100 | 0b00001000)
	ret	z ; if nothing to retrigger then return
	ld	c, #_PSG ; c points to the PSG port
	ld	hl, #_PSGShadow ; hl points to shadow regs copy
	ld	de, #3
0$:
	srl	a ; check bits one by one
	jp	nc, 1$ ; if zero then advance to next channel
	outi	; write tone to PSG
	outi	; write data to PSG
	outi	; write volume to PSG
	or	a ; check if anything else to retrigger
	ret	z ; return if done
	jr	0$ ; loop
1$:
	add	hl, de ; advance pointer to the next channel
	jr	0$ ; loop
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:81: }
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:83: void PSGCutChannels(uint8_t mask) NAKED {
;	---------------------------------
; Function PSGCutChannels
; ---------------------------------
_PSGCutChannels::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:105: __endasm;
	and	#(0b00000001 | 0b00000010 | 0b00000100 | 0b00001000)
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
	.irp	ch,0b00000000,0b00100000,0b01000000,0b01100000
	.db	#(0b10000000 | ch | 0b00010000 | 0x0f)
	.endm
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:106: }
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:108: void PSGFrame (void) NAKED {
;	---------------------------------
; Function PSGFrame
; ---------------------------------
_PSGFrame::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:268: __endasm;
	.ez80
	ld	a, (_PSGStatus) ; check if we have got to play a tune
	or	a
	ret	z
	xor	a
	ld	hl, #_PSGSkipFrames
	or	(hl)
	jp	z, 0$
	dec	(hl)
	ret
0$:
	ld	de, (_PSGPointer) ; read current address
11$:
	ld	a, (de)
	ld	b, a ; load PSG byte (in B)
	inc	de ; point to next byte
	ld	a, (_PSGSubLen) ; read substring len
	or	a
	jr	z, 1$ ; check if it is 0 (we are not in a substring)
	dec	a ; decrease len
	ld	(_PSGSubLen), a ; save len
	jr	nz, 1$
	ld	de, (_PSGSubRetAddr) ; substring is over, retrieve return address
1$:
	ld	a, b ; copy PSG byte into A
	cp	#0b10000000 ; is it a latch?
	jp	c, 7$ ; if < $80 then it is NOT a latch
;	--- latch --------------------
	rlca
	rlca
	rlca
	and	#0x03
	ld	(_PSGLastChannel), a ; store last latched channel
	jp	12$ ; save to shadow copy
;	--- no latch -----------------
7$:
	cp	#0x40
	jr	c, 8$ ; if < $40 then it is a command
;	--- save shadow registers -----
12$:
	ld	iy, #_PSGShadow
	ld	a, (_PSGLastChannel)
	ld	c, a
	add	a
	add	c
	add	iyl
	ld	iyl, a
	adc	iyh
	sub	iyl
	ld	iyh, a
	bit	4, b
	jp	z, 14$
	ld	2(iy), b ; volume byte
	jp	17$
14$:
	ld	a, (_PSGLastChannel)
	cp	#(0b01100000 >> 5)
	jp	z, 16$ ; special case for the noise
	bit	7, b
	jp	z, 13$
	ld	0(iy), b ; tone byte
	jp	17$
13$:
	ld	1(iy), b ; tone data byte
	jp	17$
16$:
	ld	a, b
	and	#0b00000111
	or	#(0b10000000 | 0b01100000)
	ld	b, a
	ld	0(iy), b ; tone byte
	ld	1(iy), b ; tone data byte
;	--- check mute and write -------
17$:
	ld	a, (_PSGLastChannel)
	ld	hl, #15$ ; point to the mute bits array
	add	l
	ld	l, a
	adc	h
	sub	l
	ld	h, a
	ld	a, (_PSGMuteMask)
	and	(hl)
	jp	nz, 11$ ; dont write to PSG if muted
	ld	a, b
	out	(_PSG), a ; write to PSG
	jp	11$ ; loop
15$:
	.db	0b00000001, 0b00000010, 0b00000100, 0b00001000
;	--- commands -------------------
8$:
	cp	#0x38
	jr	z, 4$ ; no additional frames
	jr	c, 5$ ; other commands?
	and	#0x07 ; take only the last 3 bits for skip frames
	ld	(_PSGSkipFrames), a ; we got additional frames
4$:
	ld	(_PSGPointer),de ; save current address
	ret	; frame done
5$:
	cp	#0x08
	jr	nc, 10$
	cp	#0x00
	jr	z, 9$
	cp	#0x01
	ret	nz
;	--- set loop point -------------
	ld	(_PSGLoopPoint), de
	jp	11$
;	--- set loop -------------------
9$:
	ld	a, (_PSGLoopFlag) ; looping requested?
	or	a
	jp	nz, 6$ ; No - stop
	ld	a, #0
	ld	(_PSGStatus), a
	ret
6$:
	ld	de, (_PSGLoopPoint)
	jp	11$
;	--- substring ------------------
10$:
	sub	#(#0x08 - 4) ; len is value - $08 + 4
	ld	(_PSGSubLen), a ; save len
	ld	a, (de) ; load substring address (offset)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	de
	ld	(_PSGSubRetAddr), de ; save return address
	ld	hl, (_PSGStart)
	add	hl, bc ; make substring current
	ld	d, h
	ld	e, l
	jp	11$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/sms/PSGlib.c:269: }
	.area _CODE
	.area _INITIALIZER
__xinit__PSGStatus:
	.db #0x00	; 0
__xinit__PSGMuteMask:
	.db #0x00	; 0
__xinit__PSGSubRetAddr:
	.dw #0x0000
	.area _CABS (ABS)
