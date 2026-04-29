;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module ScrollUpdateTile
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UPDATE_TILE
	.globl _GetTileReplacement
	.globl _SpriteManagerAddEx
	.globl _set_bkg_tile_xy
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_UPDATE_TILE_replacement_10000_273:
	.ds 1
_UPDATE_TILE_type_30000_276:
	.ds 1
_UPDATE_TILE_i_50000_278:
	.ds 1
_UPDATE_TILE_id_50000_278:
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:15: void UPDATE_TILE(INT16 x, INT16 y) {
;	---------------------------------
; Function UPDATE_TILE
; ---------------------------------
_UPDATE_TILE::
	add	sp, #-5
	ldhl	sp,	#3
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#1
	ld	a, c
	ld	(hl+), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:18: if(((UINT16)x >= scroll_tiles_w) || ((UINT16)y >= scroll_tiles_h)) { //This also checks x < 0 || y < 0
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_tiles_w
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00109$
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_tiles_h
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00110$
00109$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:19: replacement = 0;
	xor	a, a
	ld	(#_UPDATE_TILE_replacement_10000_273),a
	jp	00121$
00110$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:22: replacement = *scroll_ptr;
	ld	a, (_scroll_ptr)
	ld	hl, #_scroll_ptr + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_UPDATE_TILE_replacement_10000_273),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:23: type = GetTileReplacement(scroll_ptr, &replacement);
	ld	bc, #_UPDATE_TILE_replacement_10000_273
	ld	a, (_scroll_ptr)
	ld	e, a
	ld	hl, #_scroll_ptr + 1
	ld	d, (hl)
	call	_GetTileReplacement
	ld	hl, #_UPDATE_TILE_type_30000_276
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:24: if(type != 255u) {
	ld	a, (hl)
	inc	a
	jp	Z, 00121$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:27: id = SPRITE_UNIQUE_ID(x, y);
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	ld	c, #0x00
	ld	b, (hl)
	ld	e, #0x00
	ld	(_UPDATE_TILE_id_50000_278), a
	ld	a, b
	ld	(_UPDATE_TILE_id_50000_278 + 1), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:28: for (i = VECTOR_LEN(sprite_manager_updatables); (i); i--) {
	ld	a, (#_sprite_manager_updatables + 0)
	ld	(#_UPDATE_TILE_i_50000_278),a
00116$:
	ld	hl, #_UPDATE_TILE_i_50000_278
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:29: Sprite* s = sprite_manager_sprites[sprite_manager_updatables[i]];
	ld	a, #<(_sprite_manager_updatables)
	add	a, (hl)
	ld	c, a
	ld	a, #>(_sprite_manager_updatables)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:30: if ((s->type == type) && (s->unique_id == id)) {
	ld	hl, #0x001d
	add	hl, bc
	ld	a, (hl)
	ld	hl, #_UPDATE_TILE_type_30000_276
	sub	a, (hl)
	jr	NZ, 00117$
	ld	hl, #0x001f
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_UPDATE_TILE_id_50000_278
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00168$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00104$
00168$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:31: break;
00117$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:28: for (i = VECTOR_LEN(sprite_manager_updatables); (i); i--) {
	ld	hl, #_UPDATE_TILE_i_50000_278
	dec	(hl)
	jr	00116$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:34: if (i == 0) {
	ld	a, (#_UPDATE_TILE_i_50000_278)
	or	a, a
	jr	NZ, 00121$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:35: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:36: SWITCH_ROM(spriteDataBanks[type]);
	ld	a, #<(_spriteDataBanks)
	ld	hl, #_UPDATE_TILE_type_30000_276
	add	a, (hl)
	ld	c, a
	ld	a, #>(_spriteDataBanks)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:37: UINT16 sprite_y = TILE_TO_PX(y + 1) - spriteDatas[type]->height;
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	de, #_spriteDatas+0
	ld	a, (_UPDATE_TILE_type_30000_276)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:38: SWITCH_ROM(__save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:39: SpriteManagerAdd(type, TILE_TO_PX(x), sprite_y);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	a, (_UPDATE_TILE_type_30000_276)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/SpriteManager.h:45: return SpriteManagerAddEx(sprite_type, x, y, NULL);
	ld	hl, #0x0000
	push	hl
	push	bc
	call	_SpriteManagerAddEx
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:44: ScrollSetAttrTileXY(SCREEN_BKG_OFFSET_X + x + scroll_offset_x, y + scroll_offset_y, replacement, ((scroll_cptr) ? *scroll_cptr : scroll_tile_info[replacement]));
00121$:
	ld	a, (_UPDATE_TILE_replacement_10000_273)
	ld	b, a
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	ld	c, a
	ld	a, (_scroll_offset_y)
	add	a, c
	ld	e, a
	ld	c, (hl)
	ld	a, (_scroll_offset_x)
	add	a, c
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Scroll.h:181: UINT8* addr = set_bkg_tile_xy(x, y, t);
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:44: ScrollSetAttrTileXY(SCREEN_BKG_OFFSET_X + x + scroll_offset_x, y + scroll_offset_y, replacement, ((scroll_cptr) ? *scroll_cptr : scroll_tile_info[replacement]));
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:45: }
	add	sp, #5
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
