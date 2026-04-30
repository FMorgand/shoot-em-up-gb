;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module StateGame
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_StateGame
	.globl _Start_StateGame
	.globl _MoveScroll
	.globl _InitScroll
	.globl _SpriteManagerAddEx
	.globl _TranslateSprite
	.globl ___bank_StateGame
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_player:
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_scroll_timer:
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
	.area _CODE_255
;StateGame.c:15: void START(void) {
;	---------------------------------
; Function Start_StateGame
; ---------------------------------
_Start_StateGame::
;StateGame.c:17: InitScroll(BANK(map), &map, coll_tiles, 0);
	ld	bc, #_Start_StateGame_coll_tiles_10000_276+0
	ld	de, #_map+0
	ld	a, #<(___bank_map)
	ld	hl, #0x0000
	push	hl
	push	bc
	call	_InitScroll
;StateGame.c:18: scroll_target = NULL;
	xor	a, a
	ld	hl, #_scroll_target
	ld	(hl+), a
	ld	(hl), a
;StateGame.c:19: scroll_timer = 0;
	xor	a, a
	ld	(#_scroll_timer),a
;StateGame.c:20: ENABLE_SCROLL_CLAMPING;
	ld	hl, #_clamp_enabled
	ld	(hl), #0x01
;StateGame.c:21: MoveScroll(0, scroll_h - DEVICE_SCREEN_PX_HEIGHT);
	ld	hl, #_scroll_h
	ld	a, (hl+)
	add	a, #0x70
	ld	c, a
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	de, #0x0000
	call	_MoveScroll
;StateGame.c:23: UINT16 base_y = (UINT16)scroll_y;
	ld	a, (_scroll_y)
	ld	e, a
	ld	hl, #_scroll_y + 1
	ld	d, (hl)
;StateGame.c:24: player = SpriteManagerAdd(SpritePlayer, 80, base_y + 120);
	ld	hl, #0x0078
	add	hl, de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/SpriteManager.h:45: return SpriteManagerAddEx(sprite_type, x, y, NULL);
	push	de
	ld	bc, #0x0000
	push	bc
	push	hl
	ld	de, #0x0050
	xor	a, a
	call	_SpriteManagerAddEx
	pop	de
;StateGame.c:24: player = SpriteManagerAdd(SpritePlayer, 80, base_y + 120);
	ld	hl, #_player
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;StateGame.c:25: SpriteManagerAddEx(SpriteEnemy,  40, base_y + 40, (void*)MOVE_LINE);
	ld	hl, #0x0028
	add	hl, de
	push	hl
	push	de
	ld	bc, #0x0001
	push	bc
	push	hl
	ld	de, #0x0028
	ld	a, #0x02
	call	_SpriteManagerAddEx
	pop	de
	pop	hl
;StateGame.c:26: SpriteManagerAddEx(SpriteEnemy, 120, base_y + 40, (void*)MOVE_LINE);
	push	de
	ld	bc, #0x0001
	push	bc
	push	hl
	ld	de, #0x0078
	ld	a, #0x02
	call	_SpriteManagerAddEx
	pop	de
;StateGame.c:27: SpriteManagerAddEx(SpriteEnemy,  80, base_y + 30, (void*)MOVE_SINE);
	ld	hl, #0x001e
	add	hl, de
	ld	de, #0x0002
	push	de
	push	hl
	ld	de, #0x0050
	ld	a, #0x02
	call	_SpriteManagerAddEx
;StateGame.c:28: }
	ret
___bank_StateGame	=	0x00ff
_Start_StateGame_coll_tiles_10000_276:
	.db #0x01	; 1
	.db #0x00	; 0
;StateGame.c:30: void UPDATE(void) {
;	---------------------------------
; Function Update_StateGame
; ---------------------------------
_Update_StateGame::
	dec	sp
;StateGame.c:31: if (++scroll_timer >= SCROLL_MOVE_EVERY) {
	ld	hl, #_scroll_timer
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x32
	jr	C, 00109$
;StateGame.c:32: scroll_timer = 0;
	ld	(hl), #0x00
;StateGame.c:33: INT16 prev_y = scroll_y;
	ld	a, (_scroll_y)
	ld	e, a
	ld	hl, #_scroll_y + 1
;StateGame.c:34: MoveScroll(scroll_x, scroll_y - 1);
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	push	de
	ld	a, (_scroll_x)
	ld	e, a
	ld	hl, #_scroll_x + 1
	ld	d, (hl)
	call	_MoveScroll
	pop	de
;StateGame.c:35: if (scroll_y != prev_y) {
	ld	hl, #_scroll_y
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00140$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00109$
00140$:
;StateGame.c:39: SPRITEMANAGER_ITERATE(i, spr) {
	ld	hl, #_sprite_manager_updatables + 1
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	(hl), #0x00
00107$:
	ld	a, (#_sprite_manager_updatables + 0)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	Z, 00109$
;StateGame.c:40: TranslateSprite(spr, 0, -1);
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	ld	e, c
	ld	d, b
	call	_TranslateSprite
;StateGame.c:39: SPRITEMANAGER_ITERATE(i, spr) {
	ldhl	sp,	#0
	inc	(hl)
	ld	c, (hl)
	xor	a, a
	ld	b, a
	inc	bc
	ld	hl, #_sprite_manager_updatables
	add	hl, bc
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	jr	00107$
00109$:
;StateGame.c:44: }
	inc	sp
	ret
	.area _CODE_255
	.area _INITIALIZER
__xinit__scroll_timer:
	.db #0x00	; 0
	.area _CABS (ABS)
