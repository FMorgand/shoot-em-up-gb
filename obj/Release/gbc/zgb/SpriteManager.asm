;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteManager
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_native_data_wrap
	.globl _SetPalette
	.globl _RefreshScroll
	.globl _DrawSprite
	.globl _InitSprite
	.globl _ClearOAMs
	.globl _SwapOAMs
	.globl _BufferExchange
	.globl _BufferRotate
	.globl _memcmp
	.globl _memset
	.globl _THIS
	.globl _THIS_IDX
	.globl _enable_flickering
	.globl _sprite_tile_allocator_top
	.globl _sprite_manager_sprites_pool
	.globl _prev_scroll_target
	.globl _last_sprite_pal_loaded
	.globl _last_sprite_loaded
	.globl _sprite_manager_removal_check
	.globl _sprite_manager_updatables
	.globl _sprite_manager_sprites_poolSTACK
	.globl _sprite_manager_sprites
	.globl _sprite_manager_sprites_mem
	.globl _SpriteManagerReset
	.globl _SpriteManagerLoad
	.globl _SpriteManagerAddEx
	.globl _SpriteManagerRemove
	.globl _SpriteManagerRemoveSprite
	.globl _SpriteManagerFlushRemove
	.globl _SpriteManagerUpdate
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sprite_manager_sprites_mem::
	.ds 880
_sprite_manager_sprites::
	.ds 40
_sprite_manager_sprites_poolSTACK::
	.ds 20
_sprite_manager_updatables::
	.ds 21
_sprite_manager_removal_check::
	.ds 1
_last_sprite_loaded::
	.ds 2
_last_sprite_pal_loaded::
	.ds 1
_prev_scroll_target::
	.ds 2
_SpriteManagerUpdate___save_10000_319:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_sprite_manager_sprites_pool::
	.ds 2
_sprite_tile_allocator_top::
	.ds 2
_enable_flickering::
	.ds 1
_THIS_IDX::
	.ds 1
_THIS::
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:36: void SpriteManagerReset(void) {
;	---------------------------------
; Function SpriteManagerReset
; ---------------------------------
_SpriteManagerReset::
	dec	sp
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:37: prev_scroll_target = NULL;
	xor	a, a
	ld	hl, #_prev_scroll_target
	ld	(hl+), a
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:39: last_sprite_loaded = sprite_tile_allocator_top;
	ld	a, (#_sprite_tile_allocator_top)
	ld	(#_last_sprite_loaded),a
	ld	a, (#_sprite_tile_allocator_top + 1)
	ld	(#_last_sprite_loaded + 1),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:40: last_sprite_pal_loaded = 0;
	xor	a, a
	ld	(#_last_sprite_pal_loaded),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:42: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	c, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:44: for(UINT8 i = 0u; i != VECTOR_LEN(sprite_manager_updatables); ++ i) {
	ld	b, #0x00
00104$:
	ld	a, (#_sprite_manager_updatables + 0)
	sub	a, b
	jr	Z, 00101$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:45: THIS = sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, i)];
	inc	b
	ld	a, #<(_sprite_manager_updatables)
	add	a, b
	ld	l, a
	ld	a, #>(_sprite_manager_updatables)
	adc	a, #0x00
	ld	h, a
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_THIS
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:46: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	d, (hl)
	add	a, #0x1d
	ld	e, a
	jr	NC, 00141$
	inc	d
00141$:
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:47: spriteDestroyFuncs[THIS->type]();
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_spriteDestroyFuncs
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	ld	bc, #00142$
	push	bc
	push	hl
	ret
00142$:
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:44: for(UINT8 i = 0u; i != VECTOR_LEN(sprite_manager_updatables); ++ i) {
	jr	00104$
00101$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:49: SWITCH_ROM(__save);
	ld	a, c
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), c
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:52: StackClear(sprite_manager_sprites_pool);
	ld	hl, #_sprite_manager_sprites_pool
	ld	(hl), #<((_sprite_manager_sprites_poolSTACK - 1))
	inc	hl
	ld	(hl), #>((_sprite_manager_sprites_poolSTACK - 1))
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:53: for(UINT8 i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	ldhl	sp,	#0
	ld	(hl), #0x00
00107$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x14
	jr	Z, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:54: sprite_manager_sprites[i] = &sprite_manager_sprites_mem[i];
	ldhl	sp,	#0
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	ld	hl, #_sprite_manager_sprites
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #_sprite_manager_sprites_mem
	add	hl, de
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:55: StackPush(sprite_manager_sprites_pool, i);
	ld	hl, #_sprite_manager_sprites_pool
	inc	(hl)
	jr	NZ, 00145$
	inc	hl
	inc	(hl)
00145$:
	ld	a, (_sprite_manager_sprites_pool)
	ld	c, a
	ld	hl, #_sprite_manager_sprites_pool + 1
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:53: for(UINT8 i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	inc	(hl)
	jr	00107$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:57: ClearOAMs();
	call	_ClearOAMs
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:59: memset(spriteIdxs,   (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	de, #0x0003
	push	de
	xor	a, a
	push	af
	ld	de, #_spriteIdxs
	push	de
	call	_memset
	add	sp, #6
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:60: memset(spriteIdxsH,  (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	de, #0x0003
	push	de
	xor	a, a
	push	af
	ld	de, #_spriteIdxsH
	push	de
	call	_memset
	add	sp, #6
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:61: memset(spriteIdxsV,  (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	de, #0x0003
	push	de
	xor	a, a
	push	af
	ld	de, #_spriteIdxsV
	push	de
	call	_memset
	add	sp, #6
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:62: memset(spriteIdxsHV, (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	de, #0x0003
	push	de
	xor	a, a
	push	af
	ld	de, #_spriteIdxsHV
	push	de
	call	_memset
	add	sp, #6
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:65: VECTOR_CLEAR(sprite_manager_updatables);
	ld	hl, #_sprite_manager_updatables
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:66: sprite_manager_removal_check = FALSE;
	xor	a, a
	ld	(#_sprite_manager_removal_check),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:67: }
	inc	sp
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:73: UINT8 SpriteManagerLoad(UINT8 sprite_type) {
;	---------------------------------
; Function SpriteManagerLoad
; ---------------------------------
_SpriteManagerLoad::
	add	sp, #-13
	ldhl	sp,	#11
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:75: if (((INT8)spriteIdxs[sprite_type]) >= last_sprite_loaded)
	ld	de, #_spriteIdxs
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_last_sprite_loaded
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00185$
	bit	7, d
	jr	NZ, 00186$
	cp	a, a
	jr	00186$
00185$:
	bit	7, d
	jr	Z, 00186$
	scf
00186$:
	jr	C, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:76: return TRUE;
	ld	a, #0x01
	jp	00117$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:78: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:79: SWITCH_ROM(spriteDataBanks[sprite_type]);
	ld	bc, #_spriteDataBanks+0
	ldhl	sp,	#11
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:81: const struct MetaSpriteInfo* data = spriteDatas[sprite_type];
	ld	bc, #_spriteDatas+0
	ldhl	sp,	#11
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:82: UINT8 n_tiles = data->num_tiles;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	inc	hl
	ld	b, a
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:85: if ((last_sprite_loaded - n_tiles) < SPRITE_TILE_ALLOC_BOTTOM) {
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_last_sprite_loaded
	ld	a, (hl+)
	sub	a, c
	ld	c, a
	ld	a, (hl)
	sbc	a, b
	ld	b, a
	ld	a, c
	sub	a, #0x80
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:86: SWITCH_ROM(__save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:87: return FALSE;
	xor	a, a
	jp	00117$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:91: last_sprite_loaded -= n_tiles;
	ld	hl, #_last_sprite_loaded
	ld	a, c
	ld	(hl+), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:93: spriteIdxs[sprite_type] = last_sprite_loaded;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#7
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:94: spriteIdxsH[sprite_type] = last_sprite_loaded;
	ld	bc, #_spriteIdxsH+0
	ldhl	sp,	#11
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (_last_sprite_loaded)
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:95: spriteIdxsV[sprite_type] = last_sprite_loaded;
	ld	bc, #_spriteIdxsV+0
	ldhl	sp,	#11
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (_last_sprite_loaded)
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:96: spriteIdxsHV[sprite_type] = last_sprite_loaded;
	ld	bc, #_spriteIdxsHV+0
	ldhl	sp,	#11
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (_last_sprite_loaded)
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:98: if (n_tiles) {
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:101: set_sprite_native_data_wrap(last_sprite_loaded, n_tiles, data->data);
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (_last_sprite_loaded)
	push	bc
	ldhl	sp,	#14
	ld	e, (hl)
	call	_set_sprite_native_data_wrap
00106$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:138: if (n_pals = data->num_palettes) {
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#1
	ld	(hl), a
	or	a, a
	jp	Z, 00113$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:142: for (search_index = 0; search_index != last_sprite_pal_loaded; ++search_index) {
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#12
	ld	(hl), #0x00
00115$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:143: if (memcmp(ZGB_Fading_SPal + (search_index * N_PALETTE_COLORS), data->palettes, n_pals * PALETTE_SIZE) == 0)
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:142: for (search_index = 0; search_index != last_sprite_pal_loaded; ++search_index) {
	ld	a, (#_last_sprite_pal_loaded)
	ldhl	sp,	#12
	sub	a, (hl)
	jr	Z, 00130$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:143: if (memcmp(ZGB_Fading_SPal + (search_index * N_PALETTE_COLORS), data->palettes, n_pals * PALETTE_SIZE) == 0)
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x03
00188$:
	ldhl	sp,	#9
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00188$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#6
	ld	a, (hl)
	ld	e, #0x00
	add	a, a
	rl	e
	add	a, a
	rl	e
	ld	l, a
	ld	h, e
	add	hl, hl
	ld	de, #_ZGB_Fading_SPal
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	push	de
	call	_memcmp
	add	sp, #6
	ld	a, d
	or	a, e
	jr	Z, 00130$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:142: for (search_index = 0; search_index != last_sprite_pal_loaded; ++search_index) {
	ldhl	sp,	#12
	inc	(hl)
	jr	00115$
00130$:
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:148: spritePalsOffset[sprite_type] = ((search_index > (MAX_PALETTES - n_pals)) ? (MAX_PALETTES - n_pals) : search_index);
	ld	de, #_spritePalsOffset
	ldhl	sp,	#11
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #0x0008
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#9
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00190$
	bit	7, d
	jr	NZ, 00191$
	cp	a, a
	jr	00191$
00190$:
	bit	7, d
	jr	Z, 00191$
	scf
00191$:
	jr	NC, 00119$
	ldhl	sp,	#1
	ld	e, (hl)
	ld	a, #0x08
	sub	a, e
	jr	00120$
00119$:
	ldhl	sp,	#12
	ld	a, (hl)
00120$:
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:151: if (search_index == last_sprite_pal_loaded) {
	ld	a, (#_last_sprite_pal_loaded)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NZ, 00113$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:152: last_sprite_pal_loaded += SetPalette(SPRITES_PALETTE, last_sprite_pal_loaded, n_pals, data->palettes, CURRENT_BANK);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldh	a, (__current_bank + 0)
	push	af
	inc	sp
	push	bc
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, (_last_sprite_pal_loaded)
	ld	e, a
	ld	a, #0x01
	call	_SetPalette
	ld	hl, #_last_sprite_pal_loaded
	ld	c, (hl)
	add	a, c
	ld	(hl), a
00113$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:164: SWITCH_ROM(__save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:166: return TRUE;
	ld	a, #0x01
00117$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:167: }
	add	sp, #13
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:169: Sprite* SpriteManagerAddEx(UINT8 sprite_type, UINT16 x, UINT16 y, void* data) {
;	---------------------------------
; Function SpriteManagerAddEx
; ---------------------------------
_SpriteManagerAddEx::
	add	sp, #-9
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:173: if (VECTOR_LEN(sprite_manager_updatables) > (N_SPRITE_MANAGER_SPRITES - 1)) return NULL;
	ld	a, (#_sprite_manager_updatables + 0)
	cp	a, #0x14
	jr	C, 00102$
	ld	bc, #0x0000
	jp	00105$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:175: if (!SpriteManagerLoad(sprite_type)) return NULL;
	ldhl	sp,	#8
	ld	a, (hl)
	call	_SpriteManagerLoad
	or	a, a
	jr	NZ, 00104$
	ld	bc, #0x0000
	jp	00105$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:177: sprite_idx = StackPop(sprite_manager_sprites_pool);
	ld	a, (_sprite_manager_sprites_pool)
	ld	hl, #_sprite_manager_sprites_pool + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ld	hl, #_sprite_manager_sprites_pool
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:178: sprite = sprite_manager_sprites[sprite_idx];
	ld	bc, #_sprite_manager_sprites+0
	ldhl	sp,	#5
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:179: sprite->type = sprite_type;
	ld	hl, #0x001d
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:180: sprite->marked_for_removal = FALSE;
	ld	hl, #0x001e
	add	hl, bc
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:181: sprite->lim_x = SPRITE_LIMIT_X;
	ld	hl, #0x0019
	add	hl, bc
	ld	a, #0x20
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:182: sprite->lim_y = SPRITE_LIMIT_Y;
	ld	hl, #0x001b
	add	hl, bc
	ld	a, #0x20
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:183: sprite->mirror = NO_MIRROR;
	ld	hl, #0x0016
	add	hl, bc
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:185: VectorAdd(sprite_manager_updatables, sprite_idx);
	ld	a, (#_sprite_manager_updatables + 0)
	inc	a
	ld	(#_sprite_manager_updatables),a
	add	a, #<(_sprite_manager_updatables)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_sprite_manager_updatables)
	ld	d, a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:187: InitSprite(sprite, sprite_type);
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	ld	e, c
	ld	d, b
	call	_InitSprite
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:188: sprite->x = x;
	ld	e, c
	ld	d, b
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:189: sprite->y = y;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:190: sprite->unique_id = SPRITE_UNIQUE_ID(PX_TO_TILE(x), PX_TO_TILE(y + sprite->coll_h - 1));
	ld	hl, #0x001f
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #0x0005
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	dec	de
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	ld	(hl+), a
	ld	a, e
	ld	(hl-), a
	pop	de
	push	de
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:193: cached_sprite = THIS;
	ld	a, (#_THIS)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_THIS + 1)
	ldhl	sp,	#3
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:194: cached_sprite_idx = THIS_IDX;
	ld	a, (#_THIS_IDX)
	ldhl	sp,	#4
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:195: THIS = sprite;
	ld	hl, #_THIS
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:196: THIS_IDX = VECTOR_LEN(sprite_manager_updatables) - 1;
	ld	a, (#_sprite_manager_updatables + 0)
	dec	a
	ld	(#_THIS_IDX),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:198: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#5
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:199: SWITCH_ROM(spriteBanks[sprite->type]);
	ld	hl, #0x001d
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:200: spriteStartFuncs[sprite->type](data);
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_spriteStartFuncs
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	ldhl	sp,	#17
	ld	e, (hl)
	ldhl	sp,	#18
	ld	d, (hl)
	pop	hl
	ld	bc, #00121$
	push	bc
	ld	c, l
	ld	b, h
	push	bc
	ret
00121$:
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:201: SWITCH_ROM(__save);
	ldhl	sp,	#5
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:204: THIS = cached_sprite;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_THIS),a
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_THIS + 1),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:205: THIS_IDX = cached_sprite_idx;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_THIS_IDX),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:206: return sprite;
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:207: }
	add	sp, #9
	pop	hl
	add	sp, #4
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:209: void SpriteManagerRemove(UINT8 idx) {
;	---------------------------------
; Function SpriteManagerRemove
; ---------------------------------
_SpriteManagerRemove::
	ld	e, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:210: sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, idx)]->marked_for_removal = TRUE;
	ld	bc, #_sprite_manager_sprites+0
	inc	e
	ld	l, e
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001e
	add	hl, bc
	ld	(hl), #0x01
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:211: sprite_manager_removal_check = TRUE;
	ld	hl, #_sprite_manager_removal_check
	ld	(hl), #0x01
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:212: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:214: void SpriteManagerRemoveSprite(Sprite* sprite) {
;	---------------------------------
; Function SpriteManagerRemoveSprite
; ---------------------------------
_SpriteManagerRemoveSprite::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:215: sprite->marked_for_removal = TRUE;
	ld	hl, #0x001e
	add	hl, de
	ld	(hl), #0x01
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:216: sprite_manager_removal_check = TRUE;
	ld	hl, #_sprite_manager_removal_check
	ld	(hl), #0x01
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:217: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:219: void SpriteManagerFlushRemove(void) {
;	---------------------------------
; Function SpriteManagerFlushRemove
; ---------------------------------
_SpriteManagerFlushRemove::
	dec	sp
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:221: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:224: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(#_THIS_IDX),a
	ld	hl, #_sprite_manager_updatables + 1
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_THIS
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	c, #0x00
00106$:
	ld	a, (#_sprite_manager_updatables + 0)
	ld	hl, #_THIS_IDX
	sub	a, (hl)
	jp	Z, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:225: UINT8 sprite_idx = VECTOR_GET(sprite_manager_updatables, THIS_IDX);
	ld	a, (#_THIS_IDX)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	b, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:226: if (THIS->marked_for_removal) {
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	ld	hl, #0x001e
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:228: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	hl, #0x001d
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:229: spriteDestroyFuncs[THIS->type]();
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_spriteDestroyFuncs
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	ld	bc, #00133$
	push	bc
	push	hl
	ret
00133$:
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:231: StackPush(sprite_manager_sprites_pool, sprite_idx);
	ld	hl, #_sprite_manager_sprites_pool
	inc	(hl)
	jr	NZ, 00134$
	inc	hl
	inc	(hl)
00134$:
	ld	a, (_sprite_manager_sprites_pool)
	ld	hl, #_sprite_manager_sprites_pool + 1
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
	jr	00107$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:234: VECTOR_SET_DIRECT(sprite_manager_updatables, current++, sprite_idx);
	inc	c
	ld	l, c
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	(hl), b
00107$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:224: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (hl)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_THIS
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jp	00106$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:238: VECTOR_LEN(sprite_manager_updatables) = current;
	ld	hl, #_sprite_manager_updatables
	ld	(hl), c
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:239: SWITCH_ROM(__save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:240: sprite_manager_removal_check = FALSE;
	xor	a, a
	ld	(#_sprite_manager_removal_check),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:241: }
	inc	sp
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:246: void SpriteManagerUpdate(void) {
;	---------------------------------
; Function SpriteManagerUpdate
; ---------------------------------
_SpriteManagerUpdate::
	dec	sp
	dec	sp
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:250: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_SpriteManagerUpdate___save_10000_319),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:252: if (prev_scroll_target != scroll_target) {
	ld	a, (#_prev_scroll_target)
	ld	hl, #_scroll_target
	sub	a, (hl)
	jr	NZ, 00247$
	ld	a, (#_prev_scroll_target + 1)
	ld	hl, #_scroll_target + 1
	sub	a, (hl)
	jr	Z, 00108$
00247$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:254: if ((enable_flickering) && (scroll_target)) {
	ld	a, (#_enable_flickering)
	or	a, a
	jr	Z, 00105$
	ld	hl, #_scroll_target + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00105$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:255: for (UINT8 i = 0; i != VECTOR_LEN(sprite_manager_updatables); ++i) {
	ld	b, #0x00
00127$:
	ld	a, (#_sprite_manager_updatables + 0)
	sub	a, b
	jr	Z, 00105$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:256: if (sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, i)] == scroll_target) {
	ld	c, b
	inc	c
	ld	a, #<(_sprite_manager_updatables)
	add	a, c
	ld	l, a
	ld	a, #>(_sprite_manager_updatables)
	adc	a, #0x00
	ld	h, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#_scroll_target)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NZ, 00128$
	ld	a, (#_scroll_target + 1)
	ldhl	sp,	#1
	sub	a, (hl)
	jr	NZ, 00128$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:257: VectorExchange(sprite_manager_updatables, 0, i);
	ld	de, #_sprite_manager_updatables
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Vector.h:69: if ((pos1 < v[0]) && (pos2 < v[0])) BufferExchange(v, (UINT16)((pos1 + 1u) << 8) | (UINT8)(pos2 + 1u));
	ld	a, (de)
	ld	l, a
	xor	a, a
	sub	a, l
	jr	NC, 00105$
	ld	a, b
	sub	a, l
	jr	NC, 00105$
	ld	b, #0x01
	call	_BufferExchange
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:258: break;
	jr	00105$
00128$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:255: for (UINT8 i = 0; i != VECTOR_LEN(sprite_manager_updatables); ++i) {
	ld	b, c
	jr	00127$
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:263: prev_scroll_target = scroll_target;
	ld	a, (#_scroll_target)
	ld	(#_prev_scroll_target),a
	ld	a, (#_scroll_target + 1)
	ld	(#_prev_scroll_target + 1),a
00108$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:266: if (enable_flickering) {
	ld	a, (#_enable_flickering)
	or	a, a
	jr	Z, 00110$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:267: VectorRotateFrom(sprite_manager_updatables, (scroll_target) ? 1 : 0);
	ld	hl, #_scroll_target + 1
	ld	a, (hl-)
	or	a, (hl)
	ld	e, #0x01
	jr	NZ, 00134$
	ld	e, #0x00
00134$:
	ld	hl, #_sprite_manager_updatables
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Vector.h:65: if (pos < v[0]) BufferRotate(&v[pos + 1u], (v[0] - pos));
	ld	c, (hl)
	ld	a, e
	sub	a, c
	jr	NC, 00110$
	ld	a, c
	sub	a, e
	ld	c, a
	inc	e
	ld	d, #0x00
	add	hl, de
	ld	a, c
	ld	e, l
	ld	d, h
	call	_BufferRotate
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:267: VectorRotateFrom(sprite_manager_updatables, (scroll_target) ? 1 : 0);
00110$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:270: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(#_THIS_IDX),a
	ld	hl, #_sprite_manager_updatables + 1
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_THIS
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
00130$:
	ld	a, (#_sprite_manager_updatables + 0)
	ld	hl, #_THIS_IDX
	sub	a, (hl)
	jp	Z, 00116$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:272: if (THIS->marked_for_removal) continue;
	ld	a, (#_THIS)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_THIS + 1)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00115$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:274: SWITCH_ROM(spriteBanks[THIS->type]);
	pop	de
	push	de
	ld	hl, #0x001d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_spriteBanks
	add	hl, de
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_spriteBanks
	add	hl, de
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:276: spriteUpdateFuncs[THIS->type]();
	ld	a, (bc)
	ld	l, a
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_spriteUpdateFuncs
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:278: if (THIS == scroll_target) {
	ld	a, (#_THIS)
	ld	hl, #_scroll_target
	sub	a, (hl)
	jr	NZ, 00114$
	ld	a, (#_THIS + 1)
	ld	hl, #_scroll_target + 1
	sub	a, (hl)
	jr	NZ, 00114$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:279: RefreshScroll();
	call	_RefreshScroll
00114$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:282: DrawSprite();
	call	_DrawSprite
00115$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:270: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (hl)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_THIS
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jp	00130$
00116$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:285: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerUpdate___save_10000_319)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:287: SwapOAMs();
	call	_SwapOAMs
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:289: if (sprite_manager_removal_check) {
	ld	a, (#_sprite_manager_removal_check)
	or	a, a
	jr	Z, 00131$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:290: SpriteManagerFlushRemove();
	inc	sp
	inc	sp
	jp	_SpriteManagerFlushRemove
00131$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:292: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__sprite_manager_sprites_pool:
	.dw (_sprite_manager_sprites_poolSTACK - 1)
__xinit__sprite_tile_allocator_top:
	.dw #0x0080
__xinit__enable_flickering:
	.db #0x01	; 1
__xinit__THIS_IDX:
	.db #0x00	; 0
__xinit__THIS:
	.dw #0x0000
	.area _CABS (ABS)
