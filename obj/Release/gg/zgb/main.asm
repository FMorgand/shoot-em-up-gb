;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl b_InitSprites
	.globl _InitSprites
	.globl b_InitStates
	.globl _InitStates
	.globl _InitWindow
	.globl _VBL_isr
	.globl b_SetDefaultColorPalettes
	.globl _SetDefaultColorPalettes
	.globl b_FadeOut
	.globl _FadeOut
	.globl b_FadeIn
	.globl _FadeIn
	.globl _MUSIC_isr
	.globl _sfx_sound_cut_mask
	.globl _SyncVBlank
	.globl _SpriteManagerUpdate
	.globl _SpriteManagerReset
	.globl _InitOAMs
	.globl _joypad_ex
	.globl _joypad_init
	.globl _add_VBL
	.globl _vbl_count
	.globl _fade_mode
	.globl _state_running
	.globl __is_SGB
	.globl _current_state
	.globl _delta_time
	.globl _SetState
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
_delta_time::
	.ds 1
_current_state::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
__is_SGB::
	.ds 1
_state_running::
	.ds 1
_fade_mode::
	.ds 1
_vbl_count::
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
	.area _CODE
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:21: static void __force_use_font(void) NAKED { __asm__(".globl _font_recode_table"); }
;	---------------------------------
; Function __force_use_font
; ---------------------------------
___force_use_font:
	.globl	_font_recode_table
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:33: void SetState(UINT8 state) {
;	---------------------------------
; Function SetState
; ---------------------------------
_SetState::
	ld	(_next_state+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:34: state_running = FALSE;
	xor	a, a
	ld	(_state_running+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:35: next_state = state;
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:36: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:46: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Keys.h:12: joypad_init(4, &joypads);
	ld	hl, #_joypads
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_joypad_init
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:63: InitOAMs();
	call	_InitOAMs
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Sound.h:79: sfx_sound_cut_mask(MUTE_MASK_ALL);
	ld	a, #0x0f
	call	_sfx_sound_cut_mask
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Music.h:87: }
	call	___sdcc_critical_enter
	push	af
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Music.h:85: add_VBL(MUSIC_isr);
	ld	hl, #_MUSIC_isr
	call	_add_VBL
	pop	af
	jp	PO, 00183$
	ei
00183$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:67: InitStates();
	ld	e, #b_InitStates
	ld	hl, #_InitStates
	call	___sdcc_bcall_ehl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:68: InitSprites();
	ld	e, #b_InitSprites
	ld	hl, #_InitSprites
	call	___sdcc_bcall_ehl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:73: }
	call	___sdcc_critical_enter
	push	af
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:72: add_VBL(VBL_isr);
	ld	hl, #_VBL_isr
	call	_add_VBL
	pop	af
	jp	PO, 00185$
	ei
00185$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:75: InitWindow();
	call	_InitWindow
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:80: SPRITES_8x16;
	ld	a, (_shadow_VDP_R1+0)
	or	a, #0x02
	ld	(_shadow_VDP_R1+0), a
	di
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	ei
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:82: SHOW_SPRITES; SHOW_BKG;
	xor	a, a
	ld	(__sprites_OFF+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:86: HIDE_LEFT_COLUMN;
	ld	a, (_shadow_VDP_R0+0)
	or	a, #0x20
	ld	(_shadow_VDP_R0+0), a
	di
	ld	a, (_shadow_VDP_R0+0)
	out	(_VDP_CMD), a
	ld	a, #0x80
	out	(_VDP_CMD), a
	ei
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:90: SetDefaultColorPalettes();
	ld	e, #b_SetDefaultColorPalettes
	ld	hl, #_SetDefaultColorPalettes
	call	___sdcc_bcall_ehl
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\sms.h:254: __WRITE_VDP_REG(VDP_R1, __READ_VDP_REG(VDP_R1) &= (~R1_DISP_ON));
	ld	a, (_shadow_VDP_R1+0)
	and	a, #0xbf
	ld	(_shadow_VDP_R1+0), a
	di
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	ei
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:94: while(TRUE) {
00115$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:104: SpriteManagerReset();                           // reset sprite manager and remove all sprites
	call	_SpriteManagerReset
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:105: scroll_target = NULL;                           // reset scroll target
	ld	hl, #0x0000
	ld	(_scroll_target), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:107: state_running = TRUE;
	ld	iy, #_state_running
	ld	0 (iy), #0x01
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:108: current_state = next_state;                     // switch to the next scene
	ld	a, (_next_state+0)
	ld	(_current_state+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:110: last_tile_loaded = 0;                           // reset tile allocator
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:112: last_bg_pal_loaded = 0;                         // reset palette allocator for CGB/SMS/GG
	xor	a, a
	ld	(_last_tile_loaded+0), a
	ld	(_last_bg_pal_loaded+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:114: scroll_x_vblank = scroll_offset_x = 0;          // reset the scroll position;
	xor	a, a
	ld	(_scroll_offset_x+0), a
	ld	(_scroll_x_vblank), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:115: scroll_y_vblank = scroll_offset_y = 0;
	xor	a, a
	ld	(_scroll_offset_y+0), a
	ld	(_scroll_y_vblank), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:119: SWITCH_ROM(stateBanks[current_state]);          // switch to the current state bank and stay
	ld	bc, #_stateBanks+0
	ld	a, (_current_state)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:121: startFuncs[current_state]();                    // initialize current state
	ld	bc, #_startFuncs+0
	ld	a, (_current_state)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:123: scroll_x_vblank = scroll_x, scroll_y_vblank = scroll_y;
	ld	hl, (_scroll_x)
	ld	(_scroll_x_vblank), hl
	ld	hl, (_scroll_y)
	ld	(_scroll_y_vblank), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:125: if (VECTOR_LEN(sprite_manager_updatables)) {
	ld	a, (#_sprite_manager_updatables + 0)
	or	a, a
	jr	Z, 00102$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:126: SpriteManagerUpdate();                  // render sprites on screen if START() of the state spawns any
	call	_SpriteManagerUpdate
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:127: SyncVBlank();                           // wait until sprites are actually rendered to OAM
	call	_SyncVBlank
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:130: if (state_running) {                            // initialization function may change state in START()
	ld	a, (_state_running+0)
	or	a, a
	jp	Z, 00113$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:132: switch (fade_mode) {                    // show screen content
	ld	a, (_fade_mode+0)
	dec	a
	jr	NZ, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:133: case FADE_ON : FadeOut(); break;
	ld	e, #b_FadeOut
	ld	hl, #_FadeOut
	call	___sdcc_bcall_ehl
	jr	00105$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:134: default: DISPLAY_ON; break;
00104$:
	ld	a, (_shadow_VDP_R1+0)
	or	a, #0x40
	ld	(_shadow_VDP_R1+0), a
	di
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	ei
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:135: }
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:137: Void_Func_Void current_update = updateFuncs[current_state];
	ld	a, (_current_state)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	iy, #_updateFuncs
	ex	de, hl
	add	iy, de
	ld	a, 0 (iy)
	ld	-2 (ix), a
	ld	a, 1 (iy)
	ld	-1 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:139: while (state_running) {
00106$:
	ld	a, (_state_running+0)
	or	a, a
	jr	Z, 00108$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:140: delta_time = SyncVBlank();      // wait VBlank if not slowdown
	call	_SyncVBlank
	ld	(_delta_time+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Keys.h:16: old_joypads.joy0 = joypads.joy0, old_joypads.joy1 = joypads.joy1, old_joypads.joy2 = joypads.joy2, old_joypads.joy3 = joypads.joy3;
	ld	a, (#_joypads + 1)
	ld	hl, #(_old_joypads + 1)
	ld	(hl), a
	inc	hl
	ld	a, (#_joypads + 2)
	ld	(hl), a
	inc	hl
	ld	a, (#_joypads + 3)
	ld	(hl), a
	inc	hl
	ld	a, (#_joypads + 4)
	ld	(hl), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/include/Keys.h:17: joypad_ex(&joypads);
	ld	hl, #_joypads
	call	_joypad_ex
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:144: SpriteManagerUpdate();          // render sprites on screen
	call	_SpriteManagerUpdate
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:146: current_update();               // update current state
	pop	hl
	push	hl
	call	___sdcc_call_hl
	jr	00106$
00108$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:149: switch (fade_mode) {                    // hide screen content
	ld	a, (_fade_mode+0)
	or	a, a
	jr	Z, 00110$
	ld	a, (_fade_mode+0)
	dec	a
	jr	NZ, 00113$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:150: case FADE_ON : FadeIn(); break;
	ld	e, #b_FadeIn
	ld	hl, #_FadeIn
	call	___sdcc_bcall_ehl
	jr	00113$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:151: case FADE_OFF: DISPLAY_OFF; break;
00110$:
;c:\users\franc\documents\projets\perso\gameboyprojects\gbdk\include\sms\sms.h:254: __WRITE_VDP_REG(VDP_R1, __READ_VDP_REG(VDP_R1) &= (~R1_DISP_ON));
	ld	a, (_shadow_VDP_R1+0)
	and	a, #0xbf
	ld	(_shadow_VDP_R1+0), a
	di
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	ei
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:152: }
00113$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:155: destroyFuncs[current_state]();                  // destroy current state
	ld	bc, #_destroyFuncs+0
	ld	a, (_current_state)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/main.c:157: }
	jp	00115$
	.area _CODE
	.area _INITIALIZER
__xinit___is_SGB:
	.db #0x00	; 0
__xinit__state_running:
	.db #0x00	; 0
__xinit__fade_mode:
	.db #0x01	; 1
__xinit__vbl_count:
	.db #0x00	; 0
	.area _CABS (ABS)
