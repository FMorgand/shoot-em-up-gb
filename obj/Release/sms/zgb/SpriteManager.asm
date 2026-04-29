;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteManager
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SetPalette
	.globl _RefreshScroll
	.globl _DrawSprite
	.globl _InitSprite
	.globl _set_sprite_data_flip
	.globl _ClearOAMs
	.globl _SwapOAMs
	.globl _BufferExchange
	.globl _BufferRotate
	.globl _set_sprite_native_data
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
_SpriteManagerUpdate___save_10000_287:
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
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:37: prev_scroll_target = NULL;
	ld	hl, #0x0000
	ld	(_prev_scroll_target), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:39: last_sprite_loaded = sprite_tile_allocator_top;
	ld	hl, (_sprite_tile_allocator_top)
	ld	(_last_sprite_loaded), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:40: last_sprite_pal_loaded = 0;
	xor	a, a
	ld	(_last_sprite_pal_loaded+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:42: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-1 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:44: for(UINT8 i = 0u; i != VECTOR_LEN(sprite_manager_updatables); ++ i) {
	ld	c, #0x00
00104$:
	ld	a, (#_sprite_manager_updatables + 0)
	sub	a, c
	jr	Z, 00101$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:45: THIS = sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, i)];
	inc	c
	ld	hl, #_sprite_manager_updatables
	ld	b, #0x00
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:46: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	de, (_THIS)
	ld	hl, #0x001d
	add	hl, de
	ex	de, hl
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:47: spriteDestroyFuncs[THIS->type]();
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_spriteDestroyFuncs
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de,hl
	call	___sdcc_call_hl
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:44: for(UINT8 i = 0u; i != VECTOR_LEN(sprite_manager_updatables); ++ i) {
	jr	00104$
00101$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:49: SWITCH_ROM(__save);
	ld	a, -1 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:52: StackClear(sprite_manager_sprites_pool);
	ld	hl, #(_sprite_manager_sprites_poolSTACK - 1)
	ld	(_sprite_manager_sprites_pool), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:53: for(UINT8 i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x14
	jr	Z, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:54: sprite_manager_sprites[i] = &sprite_manager_sprites_mem[i];
	ld	e, c
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	ex	de, hl
	ld	hl, #_sprite_manager_sprites
	add	hl, de
	ex	de, hl
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, #<(_sprite_manager_sprites_mem)
	add	a, l
	ld	l, a
	ld	a, #>(_sprite_manager_sprites_mem)
	adc	a, h
	ld	b, a
	ld	a, l
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:55: StackPush(sprite_manager_sprites_pool, i);
	ld	hl, (_sprite_manager_sprites_pool)
	inc	hl
	ld	(_sprite_manager_sprites_pool), hl
	ld	hl, (_sprite_manager_sprites_pool)
	ld	(hl), c
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:53: for(UINT8 i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	inc	c
	jr	00107$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:57: ClearOAMs();
	call	_ClearOAMs
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:59: memset(spriteIdxs,   (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	hl, #0x0001
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_spriteIdxs
	push	hl
	call	_memset
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:60: memset(spriteIdxsH,  (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	hl, #0x0001
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_spriteIdxsH
	push	hl
	call	_memset
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:61: memset(spriteIdxsV,  (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	hl, #0x0001
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_spriteIdxsV
	push	hl
	call	_memset
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:62: memset(spriteIdxsHV, (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	hl, #0x0001
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_spriteIdxsHV
	push	hl
	call	_memset
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:65: VECTOR_CLEAR(sprite_manager_updatables);
	ld	hl, #_sprite_manager_updatables
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:66: sprite_manager_removal_check = FALSE;
	xor	a, a
	ld	(_sprite_manager_removal_check+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:67: }
	inc	sp
	pop	ix
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:73: UINT8 SpriteManagerLoad(UINT8 sprite_type) {
;	---------------------------------
; Function SpriteManagerLoad
; ---------------------------------
_SpriteManagerLoad::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-19
	add	hl, sp
	ld	sp, hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:75: if (((INT8)spriteIdxs[sprite_type]) >= last_sprite_loaded)
	ld	-1 (ix), a
	add	a, #<(_spriteIdxs)
	ld	-5 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteIdxs)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
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
	jp	PO, 00202$
	xor	a, #0x80
00202$:
	jp	M, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:76: return TRUE;
	ld	a, #0x01
	jp	00123$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:78: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-19 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:79: SWITCH_ROM(spriteDataBanks[sprite_type]);
	ld	bc, #_spriteDataBanks+0
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:81: const struct MetaSpriteInfo* data = spriteDatas[sprite_type];
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	ld	iy, #_spriteDatas
	ex	de, hl
	add	iy, de
	ld	a, 0 (iy)
	ld	-18 (ix), a
	ld	a, 1 (iy)
	ld	-17 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:82: UINT8 n_tiles = data->num_tiles;
	ld	c, -18 (ix)
	ld	b, -17 (ix)
	inc	bc
	inc	bc
	ld	a, (bc)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:85: if ((last_sprite_loaded - n_tiles) < SPRITE_TILE_ALLOC_BOTTOM) {
	ld	-16 (ix), a
	ld	-15 (ix), a
	ld	-14 (ix), #0x00
	ld	a, (_last_sprite_loaded+0)
	sub	a, -15 (ix)
	ld	-3 (ix), a
	ld	a, (_last_sprite_loaded+1)
	sbc	a, -14 (ix)
	ld	-2 (ix), a
	bit	7, -2 (ix)
	jr	Z, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:86: SWITCH_ROM(__save);
	ld	a, -19 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:87: return FALSE;
	xor	a, a
	jp	00123$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:91: last_sprite_loaded -= n_tiles;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(_last_sprite_loaded), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:93: spriteIdxs[sprite_type] = last_sprite_loaded;
	ld	a, (_last_sprite_loaded)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:94: spriteIdxsH[sprite_type] = last_sprite_loaded;
	ld	a, -1 (ix)
	add	a, #<(_spriteIdxsH)
	ld	-13 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteIdxsH)
	ld	-12 (ix), a
	ld	a, (_last_sprite_loaded)
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:95: spriteIdxsV[sprite_type] = last_sprite_loaded;
	ld	a, -1 (ix)
	add	a, #<(_spriteIdxsV)
	ld	-11 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteIdxsV)
	ld	-10 (ix), a
	ld	a, (_last_sprite_loaded)
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:96: spriteIdxsHV[sprite_type] = last_sprite_loaded;
	ld	a, -1 (ix)
	add	a, #<(_spriteIdxsHV)
	ld	-9 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteIdxsHV)
	ld	-8 (ix), a
	ld	a, (_last_sprite_loaded)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:98: if (n_tiles) {
	ld	a, -16 (ix)
	or	a, a
	jp	Z, 00118$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:105: set_sprite_native_data(last_sprite_loaded, n_tiles, data->data);
	ld	a, -18 (ix)
	add	a, #0x03
	ld	-7 (ix), a
	ld	a, -17 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -16 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	a, (_last_sprite_loaded)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	push	hl
	ld	e, -3 (ix)
	ld	d, #0x00
	call	_set_sprite_native_data
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:110: if (spriteFlips[sprite_type] & FLIP_X) {
	ld	a, -1 (ix)
	add	a, #<(_spriteFlips)
	ld	-3 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteFlips)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	bit	1, (hl)
	jr	Z, 00108$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:111: if ((last_sprite_loaded - n_tiles) >= SPRITE_TILE_ALLOC_BOTTOM) {
	ld	a, (_last_sprite_loaded+0)
	sub	a, -15 (ix)
	ld	c, a
	ld	a, (_last_sprite_loaded+1)
	sbc	a, -14 (ix)
	ld	b, a
	bit	7, b
	jr	NZ, 00108$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:112: last_sprite_loaded -= n_tiles;
	ld	(_last_sprite_loaded), bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:113: spriteIdxsV[sprite_type] = last_sprite_loaded;
	ld	a, (_last_sprite_loaded)
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:114: set_sprite_data_flip(last_sprite_loaded, n_tiles, data->data, FLIP_X);
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, (_last_sprite_loaded)
	ld	h, #0x02
	push	hl
	inc	sp
	push	bc
	ld	l, -16 (ix)
	call	_set_sprite_data_flip
00108$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:118: if (spriteFlips[sprite_type] & FLIP_Y) {
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	rrca
	jr	NC, 00112$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:119: if ((last_sprite_loaded - n_tiles) >= SPRITE_TILE_ALLOC_BOTTOM) {
	ld	a, (_last_sprite_loaded+0)
	sub	a, -15 (ix)
	ld	-5 (ix), a
	ld	a, (_last_sprite_loaded+1)
	sbc	a, -14 (ix)
	ld	-4 (ix), a
	bit	7, -4 (ix)
	jr	NZ, 00112$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:120: last_sprite_loaded -= n_tiles;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(_last_sprite_loaded), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:121: spriteIdxsH[sprite_type] = last_sprite_loaded;
	ld	a, (_last_sprite_loaded)
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:122: set_sprite_data_flip(last_sprite_loaded, n_tiles, data->data, FLIP_Y);
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, (_last_sprite_loaded)
	ld	h, #0x01
	push	hl
	inc	sp
	push	bc
	ld	l, -16 (ix)
	call	_set_sprite_data_flip
00112$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:126: if (spriteFlips[sprite_type] & FLIP_XY) {
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	bit	2, (hl)
	jr	Z, 00118$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:127: if ((last_sprite_loaded - n_tiles) >= SPRITE_TILE_ALLOC_BOTTOM) {
	ld	a, (_last_sprite_loaded+0)
	sub	a, -15 (ix)
	ld	-3 (ix), a
	ld	a, (_last_sprite_loaded+1)
	sbc	a, -14 (ix)
	ld	-2 (ix), a
	bit	7, -2 (ix)
	jr	NZ, 00118$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:128: last_sprite_loaded -= n_tiles;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(_last_sprite_loaded), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:129: spriteIdxsHV[sprite_type] = last_sprite_loaded;
	ld	a, (_last_sprite_loaded+0)
	ld	-2 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:130: set_sprite_data_flip(last_sprite_loaded, n_tiles, data->data, FLIP_X | FLIP_Y);
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, (_last_sprite_loaded+0)
	ld	-4 (ix), a
	ld	a, #0x03
	push	af
	inc	sp
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	push	hl
	ld	l, -16 (ix)
	ld	a, -4 (ix)
	call	_set_sprite_data_flip
00118$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:138: if (n_pals = data->num_palettes) {
	ld	c, -18 (ix)
	ld	b, -17 (ix)
	ld	hl, #5
	add	hl, bc
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-4 (ix), a
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00122$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:155: spritePalsOffset[sprite_type] = 0;
	ld	bc, #_spritePalsOffset+0
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:157: if (!last_sprite_pal_loaded) {
	ld	a, (_last_sprite_pal_loaded+0)
	or	a, a
	jr	NZ, 00122$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:158: last_sprite_pal_loaded += SetPalette(SPRITES_PALETTE, 0, n_pals, data->palettes, CURRENT_BANK);
	ld	a, -18 (ix)
	ld	-3 (ix), a
	ld	a, -17 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0006
	add	hl, de
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, (_MAP_FRAME1)
	push	af
	inc	sp
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	push	hl
	ld	a, -4 (ix)
	push	af
	inc	sp
	ld	l, #0x00
	ld	a, #0x01
	call	_SetPalette
	ld	c, a
	ld	a, (_last_sprite_pal_loaded)
	add	a, c
	ld	(_last_sprite_pal_loaded+0), a
00122$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:164: SWITCH_ROM(__save);
	ld	a, -19 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:166: return TRUE;
	ld	a, #0x01
00123$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:167: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:169: Sprite* SpriteManagerAddEx(UINT8 sprite_type, UINT16 x, UINT16 y, void* data) {
;	---------------------------------
; Function SpriteManagerAddEx
; ---------------------------------
_SpriteManagerAddEx::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	ld	b, a
	ld	-2 (ix), e
	ld	-1 (ix), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:173: if (VECTOR_LEN(sprite_manager_updatables) > (N_SPRITE_MANAGER_SPRITES - 1)) return NULL;
	ld	a, (#_sprite_manager_updatables + 0)
	cp	a, #0x14
	jr	C, 00102$
	ld	de, #0x0000
	jp	00105$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:175: if (!SpriteManagerLoad(sprite_type)) return NULL;
	push	bc
	ld	a, b
	call	_SpriteManagerLoad
	pop	bc
	or	a, a
	jr	NZ, 00104$
	ld	de, #0x0000
	jp	00105$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:177: sprite_idx = StackPop(sprite_manager_sprites_pool);
	ld	hl, (_sprite_manager_sprites_pool)
	ld	c, (hl)
	ld	hl, (_sprite_manager_sprites_pool)
	dec	hl
	ld	(_sprite_manager_sprites_pool), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:178: sprite = sprite_manager_sprites[sprite_idx];
	ld	de, #_sprite_manager_sprites+0
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:179: sprite->type = sprite_type;
	ld	hl, #0x001d
	add	hl, de
	ld	(hl), b
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:180: sprite->marked_for_removal = FALSE;
	ld	hl, #0x001e
	add	hl, de
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:181: sprite->lim_x = SPRITE_LIMIT_X;
	ld	hl, #0x0019
	add	hl, de
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:182: sprite->lim_y = SPRITE_LIMIT_Y;
	ld	hl, #0x001b
	add	hl, de
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:183: sprite->mirror = NO_MIRROR;
	ld	hl, #0x0016
	add	hl, de
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:185: VectorAdd(sprite_manager_updatables, sprite_idx);
	ld	a, (#_sprite_manager_updatables + 0)
	inc	a
	ld	(#_sprite_manager_updatables),a
	add	a, #<(_sprite_manager_updatables)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_sprite_manager_updatables)
	ld	h, a
	ld	(hl), c
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:187: InitSprite(sprite, sprite_type);
	push	de
	push	bc
	inc	sp
	ex	de,hl
	call	_InitSprite
	pop	de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:188: sprite->x = x;
	ld	l, e
	ld	h, d
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:189: sprite->y = y;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a, 4 (ix)
	ld	(bc), a
	inc	bc
	ld	a, 5 (ix)
	ld	(bc), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:190: sprite->unique_id = SPRITE_UNIQUE_ID(PX_TO_TILE(x), PX_TO_TILE(y + sprite->coll_h - 1));
	ld	hl, #0x001f
	add	hl, de
	ex	(sp), hl
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	-4 (ix), c
	ld	-3 (ix), #0x00
	push	de
	pop	iy
	ld	c, 5 (iy)
	ld	b, #0x00
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	add	hl, bc
	dec	hl
	ld	b, l
	srl	h
	rr	b
	srl	h
	rr	b
	srl	h
	rr	b
	ld	c, -4 (ix)
	pop	hl
	push	hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:193: cached_sprite = THIS;
	ld	hl, (_THIS)
	ex	(sp), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:194: cached_sprite_idx = THIS_IDX;
	ld	a, (_THIS_IDX+0)
	ld	-4 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:195: THIS = sprite;
	ld	(_THIS), de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:196: THIS_IDX = VECTOR_LEN(sprite_manager_updatables) - 1;
	ld	a, (#_sprite_manager_updatables + 0)
	ld	hl, #_THIS_IDX
	dec	a
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:198: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-3 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:199: SWITCH_ROM(spriteBanks[sprite->type]);
	ld	hl, #0x001d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:200: spriteStartFuncs[sprite->type](data);
	ld	a, (bc)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	bc, #_spriteStartFuncs
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	de
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	bc
	pop	iy
	call	___sdcc_call_iy
	pop	de
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:201: SWITCH_ROM(__save);
	ld	a, -3 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:204: THIS = cached_sprite;
	pop	hl
	push	hl
	ld	(_THIS), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:205: THIS_IDX = cached_sprite_idx;
	ld	a, -4 (ix)
	ld	(_THIS_IDX+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:206: return sprite;
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:207: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:209: void SpriteManagerRemove(UINT8 idx) {
;	---------------------------------
; Function SpriteManagerRemove
; ---------------------------------
_SpriteManagerRemove::
	ld	e, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:210: sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, idx)]->marked_for_removal = TRUE;
	ld	bc, #_sprite_manager_sprites+0
	ld	hl, #_sprite_manager_updatables+0
	inc	e
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
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
	ld	bc, #0x001e
	add	hl, bc
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
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:221: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-3 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:224: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(_THIS_IDX+0), a
	ld	bc, #_sprite_manager_sprites+0
	ld	hl, #_sprite_manager_updatables + 1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
	ld	-2 (ix), #0x00
00106$:
	ld	hl, #_sprite_manager_updatables
	ld	e, (hl)
	ld	a, (_THIS_IDX+0)
	sub	a, e
	jp	Z, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:225: UINT8 sprite_idx = VECTOR_GET(sprite_manager_updatables, THIS_IDX);
	ld	a, (_THIS_IDX+0)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	a, (hl)
	ld	-1 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:226: if (THIS->marked_for_removal) {
	ld	de, (_THIS)
	push	de
	pop	iy
	ld	a, 30 (iy)
	or	a, a
	jr	Z, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:228: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	hl, #0x001d
	add	hl, de
	ex	de, hl
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:229: spriteDestroyFuncs[THIS->type]();
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_spriteDestroyFuncs
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de,hl
	call	___sdcc_call_hl
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:231: StackPush(sprite_manager_sprites_pool, sprite_idx);
	ld	hl, (_sprite_manager_sprites_pool)
	inc	hl
	ld	(_sprite_manager_sprites_pool), hl
	ld	hl, (_sprite_manager_sprites_pool)
	ld	a, -1 (ix)
	ld	(hl), a
	jr	00107$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:234: VECTOR_SET_DIRECT(sprite_manager_updatables, current++, sprite_idx);
	inc	-2 (ix)
	ld	l, -2 (ix)
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	a, -1 (ix)
	ld	(hl), a
00107$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:224: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (_THIS_IDX+0)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
	jp	00106$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:238: VECTOR_LEN(sprite_manager_updatables) = current;
	ld	hl, #_sprite_manager_updatables
	ld	a, -2 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:239: SWITCH_ROM(__save);
	ld	a, -3 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:240: sprite_manager_removal_check = FALSE;
	xor	a, a
	ld	(_sprite_manager_removal_check+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:241: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:246: void SpriteManagerUpdate(void) {
;	---------------------------------
; Function SpriteManagerUpdate
; ---------------------------------
_SpriteManagerUpdate::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:250: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_SpriteManagerUpdate___save_10000_287+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:252: if (prev_scroll_target != scroll_target) {
	ld	a, (_prev_scroll_target+0)
	ld	iy, #_scroll_target
	sub	a, 0 (iy)
	jr	NZ, 00247$
	ld	a, (_prev_scroll_target+1)
	sub	a, 1 (iy)
	jr	Z, 00108$
00247$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:254: if ((enable_flickering) && (scroll_target)) {
	ld	a, (_enable_flickering+0)
	or	a, a
	jr	Z, 00105$
	ld	a, (_scroll_target+1)
	or	a, 0 (iy)
	jr	Z, 00105$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:255: for (UINT8 i = 0; i != VECTOR_LEN(sprite_manager_updatables); ++i) {
	ld	c, #0x00
00127$:
	ld	a, (#_sprite_manager_updatables + 0)
	sub	a, c
	jr	Z, 00105$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:256: if (sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, i)] == scroll_target) {
	ld	b, c
	inc	b
	ld	l, b
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, (_scroll_target)
	cp	a, a
	sbc	hl, de
	jr	NZ, 00128$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:257: VectorExchange(sprite_manager_updatables, 0, i);
	ld	hl, #_sprite_manager_updatables
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Vector.h:69: if ((pos1 < v[0]) && (pos2 < v[0])) BufferExchange(v, (UINT16)((pos1 + 1u) << 8) | (UINT8)(pos2 + 1u));
	ld	e, (hl)
	xor	a, a
	sub	a, e
	jr	NC, 00105$
	ld	a, c
	sub	a, e
	jr	NC, 00105$
	ld	e, b
	ld	d, #0x01
	call	_BufferExchange
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:258: break;
	jr	00105$
00128$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:255: for (UINT8 i = 0; i != VECTOR_LEN(sprite_manager_updatables); ++i) {
	ld	c, b
	jr	00127$
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:263: prev_scroll_target = scroll_target;
	ld	hl, (_scroll_target)
	ld	(_prev_scroll_target), hl
00108$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:266: if (enable_flickering) {
	ld	a, (_enable_flickering+0)
	or	a, a
	jr	Z, 00110$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:267: VectorRotateFrom(sprite_manager_updatables, (scroll_target) ? 1 : 0);
	ld	a, (_scroll_target+1)
	ld	hl, #_scroll_target
	or	a, (hl)
	ld	e, #0x01
	jr	NZ, 00134$
	ld	e, #0x00
00134$:
	ld	hl, #_sprite_manager_updatables+0
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Vector.h:65: if (pos < v[0]) BufferRotate(&v[pos + 1u], (v[0] - pos));
	ld	c, (hl)
	ld	a, e
	sub	a, c
	jr	NC, 00110$
	ld	a, c
	sub	a, e
	ld	b, a
	inc	e
	ld	d, #0x00
	add	hl, de
	push	bc
	inc	sp
	call	_BufferRotate
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:267: VectorRotateFrom(sprite_manager_updatables, (scroll_target) ? 1 : 0);
00110$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:270: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(_THIS_IDX+0), a
	ld	hl, #_sprite_manager_updatables + 1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
00130$:
	ld	hl, #_sprite_manager_updatables
	ld	c, (hl)
	ld	a, (_THIS_IDX+0)
	sub	a, c
	jr	Z, 00116$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:272: if (THIS->marked_for_removal) continue;
	ld	hl, (_THIS)
	ex	(sp), hl
	pop	bc
	push	bc
	ld	hl, #30
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00115$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:274: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	a, -2 (ix)
	add	a, #0x1d
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_spriteBanks
	add	hl, de
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:276: spriteUpdateFuncs[THIS->type]();
	ld	a, (bc)
	ld	h, #0x00
	ld	l, a
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
	ld	a, (_THIS+0)
	ld	iy, #_scroll_target
	sub	a, 0 (iy)
	jr	NZ, 00114$
	ld	a, (_THIS+1)
	sub	a, 1 (iy)
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
	ld	a, (_THIS_IDX+0)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
	jr	00130$
00116$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:285: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerUpdate___save_10000_287+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:287: SwapOAMs();
	call	_SwapOAMs
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:289: if (sprite_manager_removal_check) {
	ld	a, (_sprite_manager_removal_check+0)
	or	a, a
	jr	Z, 00131$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:290: SpriteManagerFlushRemove();
	call	_SpriteManagerFlushRemove
00131$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/SpriteManager.c:292: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__sprite_manager_sprites_pool:
	.dw (_sprite_manager_sprites_poolSTACK - 1)
__xinit__sprite_tile_allocator_top:
	.dw #0x0100
__xinit__enable_flickering:
	.db #0x01	; 1
__xinit__THIS_IDX:
	.db #0x00	; 0
__xinit__THIS:
	.dw #0x0000
	.area _CABS (ABS)
