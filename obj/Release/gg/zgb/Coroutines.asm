;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Coroutines
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _coro_finalize
	.globl _coro_current_context
	.globl _coro_main_context
	.globl _coro_yield
	.globl _coro_init
	.globl _coro_continue
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
_coro_main_context::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_coro_current_context::
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:10: bool coro_yield(void) NONBANKED NAKED {
;	---------------------------------
; Function coro_yield
; ---------------------------------
_coro_yield::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:86: __endasm;
	ld	de, (_coro_current_context)
	ld	a, d
	or	e
	ret	z
	ld	hl, #-4
	add	hl, sp
	ex	de, hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	push	ix
	ld	a, (_MAP_FRAME1)
	push	af
	ld	sp, (_coro_main_context)
	pop	af
	ld	(_MAP_FRAME1), a
	pop	ix
	ld	hl, #0
	ld	(_coro_current_context), hl
	ld	a, #1
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:87: }
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:89: bool coro_finalize(void) NONBANKED NAKED {
;	---------------------------------
; Function coro_finalize
; ---------------------------------
_coro_finalize::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:125: __endasm;
	ld	sp, (_coro_main_context)
	pop	af
	ld	(_MAP_FRAME1), a
	pop	ix
	ld	hl, #0
	ld	(_coro_current_context), hl
	xor	a
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:126: }
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:128: void coro_init(coro_context_t * context, coro_t coro, uint8_t coro_bank, void * user_data, uint16_t stack_size) NONBANKED {
;	---------------------------------
; Function coro_init
; ---------------------------------
_coro_init::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
	push	de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:129: uint16_t * stack = context->stack + ((stack_size >> 1) - 1);
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	l, 7 (ix)
	ld	h, 8 (ix)
	srl	h
	rr	l
	dec	hl
	add	hl, hl
	add	hl, de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:130: *stack = (uint16_t)user_data;
	ld	a, 5 (ix)
	ld	e, 6 (ix)
	ld	(hl), a
	inc	hl
	ld	(hl), e
	dec	hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:134: stack = (uint16_t *)((uint8_t *)stack - 5); // match Z80 banked call convention
	ld	a, l
	add	a, #0xfb
	ld	l, a
	ld	a, h
	adc	a, #0xff
	ld	h, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:138: *stack-- = (uint16_t *)coro_finalize;
	ld	de, #_coro_finalize
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	dec	hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:139: *stack = (uint16_t *)coro;
	ld	a, -2 (ix)
	ld	e, -1 (ix)
	ld	(hl), a
	inc	hl
	ld	(hl), e
	dec	hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:143: stack -= 2;                                 // dummy IX value
	ld	a, l
	add	a, #0xfc
	ld	l, a
	ld	a, h
	adc	a, #0xff
	ld	h, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:144: *stack = coro_bank << 8;                    // coroutine bank
	ld	e, 4 (ix)
	ld	(hl), #0x00
	inc	hl
	ld	(hl), e
	dec	hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:148: context->SP = stack;
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:149: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	inc	sp
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:151: bool coro_continue(coro_context_t * context) NONBANKED NAKED {
;	---------------------------------
; Function coro_continue
; ---------------------------------
_coro_continue::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:199: __endasm;
	push	ix
	ld	a, (_MAP_FRAME1)
	push	af
	ld	(_coro_main_context), sp
	ld	(_coro_current_context), hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	sp, hl
	pop	af
	ld	(_MAP_FRAME1), a
	pop	ix
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Coroutines.c:200: }
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
__xinit__coro_current_context:
	.dw #0x0000
	.area _CABS (ABS)
