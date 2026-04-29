;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module CoroutinesRunner
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _coro_init
	.globl _coro_free_ctx
	.globl _coro_contexts
	.globl _coro_runner_init
	.globl _coro_runner_alloc_ex
	.globl _coro_runner_free
	.globl b_NONE
	.globl _NONE
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
_coro_contexts::
	.ds 1680
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_coro_free_ctx::
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:31: static void coro_call_handler(void * handler, uint16_t bank, void * data) NONBANKED NAKED {
;	---------------------------------
; Function coro_call_handler
; ---------------------------------
_coro_call_handler:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:75: __endasm;
	pop	iy
	pop	bc
	ld	a, h
	or	l
	jp	z, 1$
	push	iy
	push	bc
	call	___sdcc_bcall_ehl
	pop	bc
	ret
1$:
	jp	(iy)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:76: }
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:89: static void __initializer__(void) NONBANKED NAKED {
;	---------------------------------
; Function __initializer__
; ---------------------------------
___initializer__:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:101: __endasm;
;	we inject the call to the coro_runner_init() in the _GSINIT section,
;	so there will be no need to call it explicitly in the game code
	.AREA	_GSINIT
	call	_coro_runner_init
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:102: }
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:10: void coro_runner_init(void) {
;	---------------------------------
; Function coro_runner_init
; ---------------------------------
_coro_runner_init::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:11: coro_free_ctx = NULL;
	ld	hl, #0x0000
	ld	(_coro_free_ctx), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:12: for (coro_runner_context_t * i = coro_contexts; i != (coro_contexts + CORO_MAX_CONTEXTS); i++) {
	ld	de, #_coro_contexts
00103$:
	ld	hl, #(_coro_contexts + 1680)
	cp	a, a
	sbc	hl, de
	ret	Z
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:13: i->next = coro_free_ctx;
	ld	hl, #0x0067
	add	hl, de
	ld	a, (_coro_free_ctx)
	ld	(hl), a
	inc	hl
	ld	a, (_coro_free_ctx + 1)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:14: coro_free_ctx = i;
	ld	(_coro_free_ctx), de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:12: for (coro_runner_context_t * i = coro_contexts; i != (coro_contexts + CORO_MAX_CONTEXTS); i++) {
	ld	hl, #0x0069
	add	hl, de
	ex	de, hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:16: }
	jr	00103$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:18: void * coro_runner_alloc_ex(coro_t coro, uint8_t coro_bank, void * user_data, coro_t destr, uint8_t destr_bank) {
;	---------------------------------
; Function coro_runner_alloc_ex
; ---------------------------------
_coro_runner_alloc_ex::
	push	ix
	ld	ix,#0
	add	ix,sp
	ex	de, hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:19: if (coro_free_ctx) {
	ld	a, (_coro_free_ctx+1)
	ld	iy, #_coro_free_ctx
	or	a, 0 (iy)
	jr	Z, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:20: coro_runner_context_t * tmp = coro_free_ctx;
	ld	bc, (_coro_free_ctx)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:21: coro_free_ctx = tmp->next;
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0067
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	(_coro_free_ctx+0), a
	ld	a, (hl)
	ld	(_coro_free_ctx+1), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:22: coro_init(&tmp->coro_context, coro, coro_bank, user_data, CORO_STACK_SIZE);
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0060
	push	bc
	push	hl
	ld	l, 5 (ix)
	ld	h, 6 (ix)
	ex	(sp), hl
	ld	a, 4 (ix)
	push	af
	inc	sp
	call	_coro_init
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:23: tmp->destructor = (uint16_t *)destr;
	ld	hl, #0x0062
	add	hl, bc
	ld	a, 7 (ix)
	ld	e, 8 (ix)
	ld	(hl), a
	inc	hl
	ld	(hl), e
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:24: tmp->bank = destr_bank;
	ld	hl, #0x0064
	add	hl, bc
	ld	a, 9 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:25: tmp->data = user_data;
	ld	hl, #0x0065
	add	hl, bc
	ld	a, 5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:26: return tmp;
	ld	e, c
	ld	d, b
	jr	00103$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:28: return NULL;
	ld	de, #0x0000
00103$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:29: }
	pop	ix
	pop	hl
	pop	af
	pop	af
	pop	af
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:78: void coro_runner_free(void * ctx) {
;	---------------------------------
; Function coro_runner_free
; ---------------------------------
_coro_runner_free::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	c, l
	ld	b, h
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:79: if (!ctx) return;
	ld	a, b
	or	a, c
	jr	Z, 00103$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:80: coro_call_handler(((coro_runner_context_t *)ctx)->destructor, ((coro_runner_context_t *)ctx)->bank, ((coro_runner_context_t *)ctx)->data);
	ld	e, c
	ld	d, b
	ld	hl, #101
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0064
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0063
	add	hl, bc
	pop	bc
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	push	bc
	push	de
	ld	e, -2 (ix)
	ld	d, #0x00
	ld	h, a
	call	_coro_call_handler
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:81: ((coro_runner_context_t *)ctx)->next = coro_free_ctx;
	ld	hl, #0x0067
	add	hl, bc
	ld	a, (_coro_free_ctx)
	ld	(hl), a
	inc	hl
	ld	a, (_coro_free_ctx + 1)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:82: coro_free_ctx = (coro_runner_context_t *)ctx;
	ld	(_coro_free_ctx), bc
00103$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:83: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:85: void NONE(void * data) BANKED {
;	---------------------------------
; Function NONE
; ---------------------------------
	b_NONE	= 0
_NONE::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:86: (void)data;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:87: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__coro_free_ctx:
	.dw #0x0000
	.area _CABS (ABS)
