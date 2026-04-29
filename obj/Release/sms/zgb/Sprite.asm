;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Sprite
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerRemoveSprite
	.globl _GetSpriteAnimation
	.globl _InitSprite
	.globl _SetSpriteAnim
	.globl _DrawSprite
	.globl _CheckCollision
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
_DrawSprite_screen_x_10000_256:
	.ds 2
_DrawSprite_screen_y_10000_256:
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:19: void InitSprite(Sprite* sprite, UINT8 sprite_type) {
;	---------------------------------
; Function InitSprite
; ---------------------------------
_InitSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	c, l
	ld	b, h
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:20: const struct MetaSpriteInfo* mt_sprite_info = spriteDatas[sprite_type];
	ld	l, 4 (ix)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_spriteDatas
	add	hl, de
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:22: sprite->mt_sprite_info = mt_sprite_info;
	ld	hl, #0x0007
	add	hl, bc
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:23: sprite->mt_sprite_bank = spriteDataBanks[sprite_type];
	ld	hl, #0x0006
	add	hl, bc
	ex	de, hl
	ld	a, #<(_spriteDataBanks)
	add	a, 4 (ix)
	ld	-3 (ix), a
	ld	a, #>(_spriteDataBanks)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:25: sprite->flips = spriteFlips[sprite_type];
	ld	hl, #0x0009
	add	hl, bc
	ex	de, hl
	ld	a, #<(_spriteFlips)
	add	a, 4 (ix)
	ld	l, a
	ld	a, #>(_spriteFlips)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:26: sprite->first_tile = spriteIdxs[sprite_type];
	ld	hl, #0x000a
	add	hl, bc
	ex	de, hl
	ld	a, #<(_spriteIdxs)
	add	a, 4 (ix)
	ld	l, a
	ld	a, #>(_spriteIdxs)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:27: sprite->first_tile_H = spriteIdxsH[sprite_type];
	ld	hl, #0x000b
	add	hl, bc
	ex	de, hl
	ld	a, #<(_spriteIdxsH)
	add	a, 4 (ix)
	ld	l, a
	ld	a, #>(_spriteIdxsH)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:28: sprite->first_tile_V = spriteIdxsV[sprite_type];
	ld	hl, #0x000c
	add	hl, bc
	ex	de, hl
	ld	a, #<(_spriteIdxsV)
	add	a, 4 (ix)
	ld	l, a
	ld	a, #>(_spriteIdxsV)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:29: sprite->first_tile_HV = spriteIdxsHV[sprite_type];
	ld	hl, #0x000d
	add	hl, bc
	ex	de, hl
	ld	a, #<(_spriteIdxsHV)
	add	a, 4 (ix)
	ld	l, a
	ld	a, #>(_spriteIdxsHV)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:33: sprite->attr_add = 0;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:36: sprite->anim_data = NULL;	
	ld	hl, #0x000f
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:37: sprite->anim_speed = 33u;
	ld	hl, #0x0012
	add	hl, bc
	ld	(hl), #0x21
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Sprite.h:81: sprite->mt_sprite = GetSpriteAnimation(sprite, frame);
	ld	hl, #0x0014
	add	hl, bc
	push	hl
	push	bc
	ld	de, #0x0000
	ld	l, c
	ld	h, b
	call	_GetSpriteAnimation
	pop	bc
	pop	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Sprite.h:82: sprite->anim_frame = frame;
	ld	hl, #0x0013
	add	hl, bc
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:41: sprite->ctx = NULL;
	ld	hl, #0x0017
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:43: sprite->x = 0;
	ld	l, c
	ld	h, b
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:44: sprite->y = 0;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
	inc	de
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:46: sprite->coll_group = COLL_GROUP_DEFAULT;
	ld	hl, #0x0022
	add	hl, bc
	ld	(hl), #0x01
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:47: sprite->coll_group_down = COLL_GROUP_DOWN;
	ld	hl, #0x0023
	add	hl, bc
	ld	(hl), #0x80
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Sprite.h:100: sprite->visible = (visible);
	ld	hl, #0x0021
	add	hl, bc
	set	0, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Sprite.h:103: sprite->persistent = (persistent);
	ld	hl, #0x0021
	add	hl, bc
	res	1, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Sprite.h:106: sprite->loop_anim = (loop_anim);
	ld	hl, #0x0021
	add	hl, bc
	set	2, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:53: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-1 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:54: SWITCH_ROM(spriteDataBanks[sprite_type]);
	pop	de
	pop	hl
	push	hl
	push	de
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:55: sprite->coll_w = mt_sprite_info->width;
	ld	hl, #0x0004
	add	hl, bc
	ex	de, hl
	pop	hl
	push	hl
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:56: sprite->coll_h = mt_sprite_info->height;
	ld	hl, #0x0005
	add	hl, bc
	ex	de, hl
	pop	hl
	push	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:57: SWITCH_ROM(__save);
	ld	a, -1 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:58: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:60: void SetSpriteAnim(Sprite* sprite, const UINT8* data, UINT8 speed) {
;	---------------------------------
; Function SetSpriteAnim
; ---------------------------------
_SetSpriteAnim::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	c, l
	ld	b, h
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:61: if (sprite->anim_data != data) {
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	dec	hl
	ld	a, -2 (ix)
	sub	a, e
	jr	NZ, 00113$
	ld	a, -1 (ix)
	sub	a, d
	jr	Z, 00104$
00113$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:62: sprite->anim_data = (UINT8* )data;
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:63: SetFrame(sprite, VECTOR_GET(data, 0));
	inc	de
	ld	a, (de)
	ld	-1 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Sprite.h:81: sprite->mt_sprite = GetSpriteAnimation(sprite, frame);
	ld	hl, #0x0014
	add	hl, bc
	ld	e, -1 (ix)
	ld	d, #0x00
	push	hl
	push	bc
	ld	l, c
	ld	h, b
	call	_GetSpriteAnimation
	pop	bc
	pop	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Sprite.h:82: sprite->anim_frame = frame;
	ld	hl, #0x0013
	add	hl, bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:64: sprite->anim_frame = 0;
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:65: sprite->anim_accum_ticks = 0;
	ld	hl, #0x0011
	add	hl, bc
	ld	(hl), #0x00
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:66: sprite->anim_speed = speed;
	ld	hl, #0x0012
	add	hl, bc
	ld	a, 4 (ix)
	ld	(hl), a
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:68: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:72: void DrawSprite(void) {
;	---------------------------------
; Function DrawSprite
; ---------------------------------
_DrawSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:74: screen_x = THIS->x - scroll_x;
	ld	hl, (_THIS)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, (_scroll_x)
	ld	hl, #_DrawSprite_screen_x_10000_256
	ld	a, c
	sub	a, e
	ld	(hl), a
	inc	hl
	ld	a, b
	sbc	a, d
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:75: screen_y = THIS->y - scroll_y;
	ld	hl, (_THIS)
	ld	-2 (ix), l
	ld	-1 (ix), h
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, (_scroll_y)
	ld	hl, #_DrawSprite_screen_y_10000_256
	ld	a, c
	sub	a, e
	ld	(hl), a
	inc	hl
	ld	a, b
	sbc	a, d
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:78: if (THIS->anim_data) {
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #15
	add	hl, bc
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00109$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:79: THIS->anim_accum_ticks += (THIS->anim_speed << delta_time);
	ld	a, -2 (ix)
	add	a, #0x11
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #18
	add	hl, bc
	ld	c, (hl)
	ld	iy, #_delta_time
	ld	b, 0 (iy)
	inc	b
	jr	00220$
00219$:
	sla	c
00220$:
	djnz	00219$
	add	a, c
	ld	(de), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:75: screen_y = THIS->y - scroll_y;
	ld	hl, (_THIS)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:79: THIS->anim_accum_ticks += (THIS->anim_speed << delta_time);
	ld	bc, #0x0011
	add	hl, bc
	ld	a, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:80: if (THIS->anim_accum_ticks >= 100u) {
	cp	a, #0x64
	jr	C, 00109$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:81: THIS->anim_accum_ticks -= 100u;
	add	a, #0x9c
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:83: if (++THIS->anim_frame >= VECTOR_LEN(THIS->anim_data)) {
	ld	hl, (_THIS)
	ld	bc, #0x0013
	add	hl, bc
	inc	(hl)
	ld	e, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:75: screen_y = THIS->y - scroll_y;
	ld	bc, (_THIS)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:83: if (++THIS->anim_frame >= VECTOR_LEN(THIS->anim_data)) {
	push	bc
	pop	iy
	ld	l, 15 (iy)
	ld	h, 16 (iy)
	ld	a, e
	sub	a, (hl)
	jr	C, 00105$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:84: if (THIS->loop_anim) {
	ld	e, c
	ld	d, b
	ld	hl, #33
	add	hl, de
	ld	a, (hl)
	rrca
	rrca
	and	a, #0x01
	ld	e, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:85: THIS->anim_frame = 0;
	ld	hl, #0x0013
	add	hl, bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:84: if (THIS->loop_anim) {
	ld	a, e
	or	a, a
	jr	Z, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:85: THIS->anim_frame = 0;
	ld	(hl), #0x00
	jr	00105$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:87: --THIS->anim_frame;
	dec	(hl)
	ld	a, (hl)
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:75: screen_y = THIS->y - scroll_y;
	ld	de, (_THIS)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:90: THIS->mt_sprite = GetSpriteAnimation(THIS, VECTOR_GET(THIS->anim_data, THIS->anim_frame));
	ld	hl, #0x0014
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	c, e
	ld	b, d
	ld	hl, #15
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #19
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	inc	hl
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, (_THIS)
	call	_GetSpriteAnimation
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00109$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:75: screen_y = THIS->y - scroll_y;
	ld	de, (_THIS)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:96: (THIS->visible) &&
	ld	c, e
	ld	b, d
	ld	hl, #33
	add	hl, bc
	ld	a, (hl)
	and	a, #0x01
	jp	Z, 00121$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:98: ((UINT16)(screen_x + MAXIMUM_SPRITES_SIZE) < (UINT16)(DEVICE_SCREEN_PX_WIDTH + (MAXIMUM_SPRITES_SIZE << 1))) &&
	ld	hl, (_DrawSprite_screen_x_10000_256)
	ld	bc, #0x0020
	add	hl, bc
	ld	a, l
	sub	a, #0x40
	ld	a, h
	sbc	a, #0x01
	jp	NC, 00121$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:99: ((UINT16)(screen_y + MAXIMUM_SPRITES_SIZE) < (UINT16)(DEVICE_SCREEN_PX_HEIGHT + (MAXIMUM_SPRITES_SIZE << 1)))
	ld	hl, (_DrawSprite_screen_y_10000_256)
	ld	bc, #0x0020
	add	hl, bc
	ld	a, h
	sub	a, #0x01
	jp	NC, 00121$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:103: screen_x += (DEVICE_SPRITE_PX_OFFSET_X + SCREEN_SPR_OFFSET_X);
	ld	hl, #_DrawSprite_screen_x_10000_256
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
	jr	NC, 00221$
	inc	hl
	inc	(hl)
00221$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:104: screen_y += DEVICE_SPRITE_PX_OFFSET_Y;
	ld	hl, #_DrawSprite_screen_y_10000_256
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:107: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-16 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:75: screen_y = THIS->y - scroll_y;
	ld	hl, (_THIS)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:108: SWITCH_ROM(THIS->mt_sprite_bank);
	ld	-15 (ix), l
	ld	-14 (ix), h
	ld	bc, #6
	add	hl, bc
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:109: switch(THIS->mirror) {
	ld	c, -15 (ix)
	ld	b, -14 (ix)
	ld	hl, #22
	add	hl, bc
	ld	a, (hl)
	ld	-13 (ix), a
	ld	a, #0x04
	sub	a, -13 (ix)
	jp	C, 00115$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:110: case NO_MIRROR: next_oam_idx += move_metasprite_ex    (THIS->mt_sprite, THIS->first_tile,    THIS->attr_add, next_oam_idx, screen_x,                screen_y               ); break;
	ld	hl, (_DrawSprite_screen_y_10000_256)
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	de, (_DrawSprite_screen_x_10000_256)
	ld	a, (_next_oam_idx+0)
	ld	-10 (ix), a
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:151: return __move_metasprite_flipy(base_sprite, x, y - ((__READ_VDP_REG(VDP_R1) & R1_SPR_8X16) ? 16 : 8) );
	ld	a, (_shadow_VDP_R1)
	ld	l, a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:90: THIS->mt_sprite = GetSpriteAnimation(THIS, VECTOR_GET(THIS->anim_data, THIS->anim_frame));
	ld	c, -15 (ix)
	ld	b, -14 (ix)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:111: case H_MIRROR:  next_oam_idx += move_metasprite_flipy (THIS->mt_sprite, THIS->first_tile_H,  THIS->attr_add, next_oam_idx, screen_x,                screen_y + THIS->coll_h); break;
	ld	a, -15 (ix)
	add	a, #0x05
	ld	-9 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:151: return __move_metasprite_flipy(base_sprite, x, y - ((__READ_VDP_REG(VDP_R1) & R1_SPR_8X16) ? 16 : 8) );
	ld	a, l
	and	a, #0x02
	ld	-7 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:112: case V_MIRROR:  next_oam_idx += move_metasprite_flipx (THIS->mt_sprite, THIS->first_tile_V,  THIS->attr_add, next_oam_idx, screen_x + THIS->coll_w, screen_y               ); break;
	ld	a, -15 (ix)
	add	a, #0x04
	ld	-6 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:110: case NO_MIRROR: next_oam_idx += move_metasprite_ex    (THIS->mt_sprite, THIS->first_tile,    THIS->attr_add, next_oam_idx, screen_x,                screen_y               ); break;
	ld	hl, #20
	add	hl, bc
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:83: __current_metasprite = metasprite;
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:109: switch(THIS->mirror) {
	ld	c, -13 (ix)
	ld	b, #0x00
	ld	hl, #00222$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00222$:
	.dw	00110$
	.dw	00111$
	.dw	00112$
	.dw	00114$
	.dw	00114$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:110: case NO_MIRROR: next_oam_idx += move_metasprite_ex    (THIS->mt_sprite, THIS->first_tile,    THIS->attr_add, next_oam_idx, screen_x,                screen_y               ); break;
00110$:
	ld	c, -12 (ix)
	ld	b, -11 (ix)
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	(___current_base_tile+0), a
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:83: __current_metasprite = metasprite;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(___current_metasprite), hl
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:85: return __move_metasprite(base_sprite, x, y);
	push	bc
	ld	a, -10 (ix)
	call	___move_metasprite
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:110: case NO_MIRROR: next_oam_idx += move_metasprite_ex    (THIS->mt_sprite, THIS->first_tile,    THIS->attr_add, next_oam_idx, screen_x,                screen_y               ); break;
	ld	hl, #_next_oam_idx
	add	a, (hl)
	ld	(hl), a
	jp	00115$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:111: case H_MIRROR:  next_oam_idx += move_metasprite_flipy (THIS->mt_sprite, THIS->first_tile_H,  THIS->attr_add, next_oam_idx, screen_x,                screen_y + THIS->coll_h); break;
00111$:
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, (_DrawSprite_screen_y_10000_256)
	add	hl, bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	-2 (ix), e
	ld	-1 (ix), d
	ld	c, -15 (ix)
	ld	b, -14 (ix)
	ld	hl, #11
	add	hl, bc
	ld	a, (hl)
	ld	(___current_base_tile+0), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -10 (ix)
	ld	-3 (ix), a
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:149: __current_metasprite = metasprite;
	ld	(___current_metasprite), hl
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:151: return __move_metasprite_flipy(base_sprite, x, y - ((__READ_VDP_REG(VDP_R1) & R1_SPR_8X16) ? 16 : 8) );
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00131$
	ld	-8 (ix), #0x10
	ld	-7 (ix), #0
	jr	00132$
00131$:
	ld	-8 (ix), #0x08
	ld	-7 (ix), #0
00132$:
	ld	a, -6 (ix)
	ld	b, -5 (ix)
	sub	a, -8 (ix)
	ld	c, a
	ld	a, b
	sbc	a, -7 (ix)
	ld	b, a
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	a, -3 (ix)
	call	___move_metasprite_flipy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:111: case H_MIRROR:  next_oam_idx += move_metasprite_flipy (THIS->mt_sprite, THIS->first_tile_H,  THIS->attr_add, next_oam_idx, screen_x,                screen_y + THIS->coll_h); break;
	ld	hl, #_next_oam_idx
	add	a, (hl)
	ld	(hl), a
	jp	00115$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:112: case V_MIRROR:  next_oam_idx += move_metasprite_flipx (THIS->mt_sprite, THIS->first_tile_V,  THIS->attr_add, next_oam_idx, screen_x + THIS->coll_w, screen_y               ); break;
00112$:
	ld	c, -12 (ix)
	ld	b, -11 (ix)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, (_DrawSprite_screen_x_10000_256)
	add	hl, de
	ex	de, hl
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	push	bc
	ld	bc, #0x000c
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	(___current_base_tile+0), a
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:120: __current_metasprite = metasprite;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(___current_metasprite), hl
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:122: return __move_metasprite_flipx(base_sprite, x - 8, y);
	ld	a, e
	add	a, #0xf8
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	push	bc
	ld	a, -10 (ix)
	call	___move_metasprite_flipx
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:112: case V_MIRROR:  next_oam_idx += move_metasprite_flipx (THIS->mt_sprite, THIS->first_tile_V,  THIS->attr_add, next_oam_idx, screen_x + THIS->coll_w, screen_y               ); break;
	ld	hl, #_next_oam_idx
	add	a, (hl)
	ld	(hl), a
	jr	00115$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:114: case HV_MIRROR: next_oam_idx += move_metasprite_flipxy(THIS->mt_sprite, THIS->first_tile_HV, THIS->attr_add, next_oam_idx, screen_x + THIS->coll_w, screen_y + THIS->coll_h); break;
00114$:
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, (_DrawSprite_screen_y_10000_256)
	add	hl, bc
	ex	de, hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, (_DrawSprite_screen_x_10000_256)
	add	hl, bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	c, -15 (ix)
	ld	b, -14 (ix)
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	ld	(___current_base_tile+0), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, -10 (ix)
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:178: __current_metasprite = metasprite;
	ld	(___current_metasprite), hl
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\metasprites.h:180: return __move_metasprite_flipxy(base_sprite, x - 8, y - ((__READ_VDP_REG(VDP_R1) & R1_SPR_8X16) ? 16 : 8));
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00133$
	ld	-4 (ix), #0x10
	ld	-3 (ix), #0
	jr	00134$
00133$:
	ld	-4 (ix), #0x08
	ld	-3 (ix), #0
00134$:
	ld	a, e
	sub	a, -4 (ix)
	ld	l, a
	ld	a, d
	sbc	a, -3 (ix)
	ld	h, a
	ld	a, -2 (ix)
	ld	b, -1 (ix)
	add	a, #0xf8
	ld	e, a
	ld	a, b
	adc	a, #0xff
	push	hl
	ld	d, a
	ld	a, c
	call	___move_metasprite_flipxy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:114: case HV_MIRROR: next_oam_idx += move_metasprite_flipxy(THIS->mt_sprite, THIS->first_tile_HV, THIS->attr_add, next_oam_idx, screen_x + THIS->coll_w, screen_y + THIS->coll_h); break;
	ld	hl, #_next_oam_idx
	add	a, (hl)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:115: }
00115$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:116: SWITCH_ROM(__save);
	ld	a, -16 (ix)
	ld	(_MAP_FRAME1+0), a
	jr	00129$
00121$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:120: (!(THIS->persistent)) && 
	ld	c, e
	ld	b, d
	ld	hl, #33
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x01
	jr	NZ, 00129$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:122: ((UINT16)(screen_x + THIS->lim_x + 16u) > (UINT16)((THIS->lim_x << 1) + (DEVICE_SCREEN_PX_WIDTH + (16u << 1)))) || 
	ld	c, e
	ld	b, d
	ld	hl, #25
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_DrawSprite_screen_x_10000_256)
	add	hl, bc
	push	de
	ld	de, #0x0010
	add	hl, de
	pop	de
	ld	a, c
	add	a, a
	rl	b
	add	a, #0x20
	ld	c, a
	ld	a, b
	adc	a, #0x01
	ld	b, a
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	C, 00116$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:123: ((UINT16)(screen_y + THIS->lim_y + 16u) > (UINT16)((THIS->lim_y << 1) + (DEVICE_SCREEN_PX_HEIGHT + (16u << 1))))
	ld	hl, #27
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_DrawSprite_screen_y_10000_256)
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0010
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	bc, #0x00e0
	add	hl, bc
	xor	a, a
	sbc	hl, de
	jr	NC, 00129$
00116$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:126: return SpriteManagerRemoveSprite(THIS);
	ld	hl, (_THIS)
	call	_SpriteManagerRemoveSprite
00129$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:130: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:132: UINT8 CheckCollision(Sprite* sprite1, Sprite* sprite2) {
;	---------------------------------
; Function CheckCollision
; ---------------------------------
_CheckCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	ld	c, l
	ld	b, h
	ld	-2 (ix), e
	ld	-1 (ix), d
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:133: if ((sprite1->x + sprite1->coll_w) < sprite2->x) return 0;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	pop	iy
	ld	l, 4 (iy)
	ld	h, #0x00
	add	hl, de
	ex	(sp), hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	sub	a, -4 (ix)
	ld	a, -5 (ix)
	sbc	a, -3 (ix)
	jr	NC, 00102$
	xor	a, a
	jr	00109$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:134: if ((sprite2->x + sprite2->coll_w) < sprite1->x) return 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a, -4 (ix)
	ld	l, a
	ld	a, h
	adc	a, -3 (ix)
	ld	h, a
	xor	a, a
	sbc	hl, de
	jr	NC, 00104$
	xor	a, a
	jr	00109$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:135: if ((sprite1->y + sprite1->coll_h) < sprite2->y) return 0;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #5
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -4 (ix)
	sub	a, c
	ld	a, -3 (ix)
	sbc	a, b
	jr	NC, 00106$
	xor	a, a
	jr	00109$
00106$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:136: if ((sprite2->y + sprite2->coll_h) < sprite1->y) return 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	xor	a, a
	sbc	hl, de
	jr	NC, 00108$
	xor	a, a
	jr	00109$
00108$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:137: return 1;
	ld	a, #0x01
00109$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Sprite.c:138: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
