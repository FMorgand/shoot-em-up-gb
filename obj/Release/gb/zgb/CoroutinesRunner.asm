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
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
	ld	a, d
	or	e
	jr	z, 1$
	ldhl	sp, #2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	h, d
	ld	l, e
	ld	e, c
	call	___sdcc_bcall_ehl
	pop	hl
	pop	hl
	pop	bc
	jp	(hl)
1$:
	pop	hl
	pop	bc
	jp	(hl)
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
	xor	a, a
	ld	hl, #_coro_free_ctx
	ld	(hl+), a
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:12: for (coro_runner_context_t * i = coro_contexts; i != (coro_contexts + CORO_MAX_CONTEXTS); i++) {
	ld	bc, #_coro_contexts
00103$:
	ld	a, #<((_coro_contexts + 1680))
	sub	a, c
	jr	NZ, 00122$
	ld	a, #>((_coro_contexts + 1680))
	sub	a, b
	ret	Z
00122$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:13: i->next = coro_free_ctx;
	ld	hl, #0x0067
	add	hl, bc
	ld	a, (_coro_free_ctx)
	ld	(hl+), a
	ld	a, (_coro_free_ctx + 1)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:14: coro_free_ctx = i;
	ld	hl, #_coro_free_ctx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:12: for (coro_runner_context_t * i = coro_contexts; i != (coro_contexts + CORO_MAX_CONTEXTS); i++) {
	ld	hl, #0x0069
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:16: }
	jr	00103$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:18: void * coro_runner_alloc_ex(coro_t coro, uint8_t coro_bank, void * user_data, coro_t destr, uint8_t destr_bank) {
;	---------------------------------
; Function coro_runner_alloc_ex
; ---------------------------------
_coro_runner_alloc_ex::
	add	sp, #-5
	ldhl	sp,	#3
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:19: if (coro_free_ctx) {
	ld	hl, #_coro_free_ctx + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:20: coro_runner_context_t * tmp = coro_free_ctx;
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_coro_free_ctx + 1)
	ldhl	sp,	#1
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:21: coro_free_ctx = tmp->next;
	pop	de
	push	de
	ld	hl, #0x0067
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ld	hl, #_coro_free_ctx
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:22: coro_init(&tmp->coro_context, coro, coro_bank, user_data, CORO_STACK_SIZE);
	pop	de
	push	de
	ld	bc, #0x0060
	push	bc
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#6
	ld	a, (hl+)
	push	af
	inc	sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_coro_init
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:23: tmp->destructor = (uint16_t *)destr;
	pop	de
	push	de
	ld	hl, #0x0062
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:24: tmp->bank = destr_bank;
	pop	de
	push	de
	ld	hl, #0x0064
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:25: tmp->data = user_data;
	pop	de
	push	de
	ld	hl, #0x0065
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:26: return tmp;
	pop	bc
	push	bc
	jr	00103$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:28: return NULL;
	ld	bc, #0x0000
00103$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:29: }
	add	sp, #5
	pop	hl
	add	sp, #5
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:78: void coro_runner_free(void * ctx) {
;	---------------------------------
; Function coro_runner_free
; ---------------------------------
_coro_runner_free::
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:79: if (!ctx) return;
	ld	(hl+), a
	ld	(hl), d
	or	a, d
	jr	Z, 00103$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:80: coro_call_handler(((coro_runner_context_t *)ctx)->destructor, ((coro_runner_context_t *)ctx)->bank, ((coro_runner_context_t *)ctx)->data);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0065
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0064
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0062
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	push	bc
	push	hl
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	pop	hl
	ld	e, l
	ld	d, a
	call	_coro_call_handler
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:81: ((coro_runner_context_t *)ctx)->next = coro_free_ctx;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0067
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (_coro_free_ctx)
	ld	(bc), a
	inc	bc
	ld	a, (_coro_free_ctx + 1)
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:82: coro_free_ctx = (coro_runner_context_t *)ctx;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_coro_free_ctx),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_coro_free_ctx + 1),a
00103$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/CoroutinesRunner.c:83: }
	add	sp, #6
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
