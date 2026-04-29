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
	.globl _set_attributed_tile_xy
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
_UPDATE_TILE_replacement_10000_235:
	.ds 1
_UPDATE_TILE_type_30000_238:
	.ds 1
_UPDATE_TILE_i_50000_240:
	.ds 1
_UPDATE_TILE_id_50000_240:
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
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	c, l
	ld	b, h
	ld	-2 (ix), e
	ld	-1 (ix), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:18: if(((UINT16)x >= scroll_tiles_w) || ((UINT16)y >= scroll_tiles_h)) { //This also checks x < 0 || y < 0
	ld	e, c
	ld	d, b
	ld	hl, #_scroll_tiles_w
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	NC, 00109$
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #_scroll_tiles_h
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00110$
00109$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:19: replacement = 0;
	xor	a, a
	ld	(_UPDATE_TILE_replacement_10000_235+0), a
	jp	00111$
00110$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:22: replacement = *scroll_ptr;
	ld	hl, (_scroll_ptr)
	ld	a, (hl)
	ld	(_UPDATE_TILE_replacement_10000_235+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:23: type = GetTileReplacement(scroll_ptr, &replacement);
	push	bc
	ld	de, #_UPDATE_TILE_replacement_10000_235
	ld	hl, (_scroll_ptr)
	call	_GetTileReplacement
	pop	bc
	ld	(_UPDATE_TILE_type_30000_238+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:24: if(type != 255u) {
	ld	a, (_UPDATE_TILE_type_30000_238+0)
	inc	a
	jp	Z, 00111$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:27: id = SPRITE_UNIQUE_ID(x, y);
	ld	l, c
	ld	h, -2 (ix)
	ld	(_UPDATE_TILE_id_50000_240), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:28: for (i = VECTOR_LEN(sprite_manager_updatables); (i); i--) {
	ld	a, (#_sprite_manager_updatables + 0)
	ld	(_UPDATE_TILE_i_50000_240+0), a
00116$:
	ld	a, (_UPDATE_TILE_i_50000_240+0)
	or	a, a
	jr	Z, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:29: Sprite* s = sprite_manager_sprites[sprite_manager_updatables[i]];
	ld	hl, #_sprite_manager_updatables
	ld	a, (_UPDATE_TILE_i_50000_240)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:30: if ((s->type == type) && (s->unique_id == id)) {
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x001d
	add	hl, bc
	pop	bc
	ld	l, (hl)
	ld	a, (_UPDATE_TILE_type_30000_238)
	sub	a, l
	jr	NZ, 00117$
	ld	hl, #31
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, (_UPDATE_TILE_id_50000_240)
	cp	a, a
	sbc	hl, de
	jr	Z, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:31: break;
00117$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:28: for (i = VECTOR_LEN(sprite_manager_updatables); (i); i--) {
	ld	hl, #_UPDATE_TILE_i_50000_240
	dec	(hl)
	jr	00116$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:34: if (i == 0) {
	ld	a, (_UPDATE_TILE_i_50000_240+0)
	or	a, a
	jr	NZ, 00111$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:35: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-3 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:36: SWITCH_ROM(spriteDataBanks[type]);
	ld	hl, #_spriteDataBanks
	ld	a, (_UPDATE_TILE_type_30000_238)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:37: UINT16 sprite_y = TILE_TO_PX(y + 1) - spriteDatas[type]->height;
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	inc	de
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	a, (_UPDATE_TILE_type_30000_238)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	a, #<(_spriteDatas)
	add	a, l
	ld	l, a
	ld	a, #>(_spriteDatas)
	adc	a, h
	ld	h, a
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:38: SWITCH_ROM(__save);
	ld	a, -3 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:39: SpriteManagerAdd(type, TILE_TO_PX(x), sprite_y);
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, (_UPDATE_TILE_type_30000_238)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/SpriteManager.h:45: return SpriteManagerAddEx(sprite_type, x, y, NULL);
	push	bc
	ld	bc, #0x0000
	push	bc
	ex	de, hl
	push	hl
	call	_SpriteManagerAddEx
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:39: SpriteManagerAdd(type, TILE_TO_PX(x), sprite_y);
00111$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:44: ScrollSetAttrTileXY(SCREEN_BKG_OFFSET_X + x + scroll_offset_x, y + scroll_offset_y, replacement, ((scroll_cptr) ? *scroll_cptr : scroll_tile_info[replacement]));
	ld	a, (_scroll_cptr+1)
	ld	hl, #_scroll_cptr
	or	a, (hl)
	jr	Z, 00120$
	ld	hl, (_scroll_cptr)
	ld	e, (hl)
	jr	00121$
00120$:
	ld	de, #_scroll_tile_info+0
	ld	a, (_UPDATE_TILE_replacement_10000_235)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	e, (hl)
00121$:
	ld	a, (_UPDATE_TILE_replacement_10000_235)
	ld	l, a
	ld	d, -2 (ix)
	ld	a, (_scroll_offset_y)
	add	a, d
	ld	d, a
	inc	c
	ld	a, (_scroll_offset_x)
	add	a, c
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Scroll.h:190: set_attributed_tile_xy(x, y, (UINT16)(c << 8) | t);
	ld	b, e
	ld	c, l
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_set_attributed_tile_xy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:44: ScrollSetAttrTileXY(SCREEN_BKG_OFFSET_X + x + scroll_offset_x, y + scroll_offset_y, replacement, ((scroll_cptr) ? *scroll_cptr : scroll_tile_info[replacement]));
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/ScrollUpdateTile.c:45: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
