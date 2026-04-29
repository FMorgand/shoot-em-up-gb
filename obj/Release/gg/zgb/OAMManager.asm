;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module OAMManager
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memset
	.globl _oam1
	.globl _oam0
	.globl _oam
	.globl _next_oam_idx
	.globl _SwapOAMs
	.globl _ClearOAMs
	.globl _InitOAMs
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
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_next_oam_idx::
	.ds 1
_oam::
	.ds 2
_oam0::
	.ds 2
_oam1::
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:28: void SwapOAMs(void) {
;	---------------------------------
; Function SwapOAMs
; ---------------------------------
_SwapOAMs::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:30: if (next_oam_idx < MAX_HARDWARE_SPRITES) oam[next_oam_idx] = 0xd0;
	ld	a, (_next_oam_idx+0)
	sub	a, #0x40
	jr	NC, 00102$
	ld	hl, #_next_oam_idx
	ld	a, (_oam+0)
	add	a, (hl)
	ld	c, a
	ld	a, (_oam+1)
	adc	a, #0x00
	ld	h, a
	ld	l, c
	ld	(hl), #0xd0
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:35: if ((_shadow_OAM_base = __render_shadow_OAM) == (UINT8)((UINT16)mirror_OAM >> 8)) {
	ld	a, (___render_shadow_OAM+0)
	ld	(__shadow_OAM_base+0), a
	ld	c, #>(_mirror_OAM)
	ld	a, (___render_shadow_OAM+0)
	sub	a, c
	jr	NZ, 00104$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:36: __render_shadow_OAM = (UINT8)((UINT16)(oam = (UINT8*)shadow_OAM) >> 8);
	ld	hl, #_shadow_OAM
	ld	iy, #_oam
	ld	0 (iy), #<(_shadow_OAM)
	ld	1 (iy), #>(_shadow_OAM)
	ld	hl, #___render_shadow_OAM
	ld	(hl), #>(_shadow_OAM)
	jr	00105$
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:38: __render_shadow_OAM = (UINT8)((UINT16)(oam = (UINT8*)mirror_OAM) >> 8);
	ld	iy, #_oam
	ld	0 (iy), #<(_mirror_OAM)
	ld	1 (iy), #>(_mirror_OAM)
	ld	hl, #___render_shadow_OAM
	ld	(hl), #>(_mirror_OAM)
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:40: next_oam_idx = 0;
	xor	a, a
	ld	(_next_oam_idx+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:42: scroll_x_vblank = scroll_x, scroll_y_vblank = scroll_y;
	ld	hl, (_scroll_x)
	ld	(_scroll_x_vblank), hl
	ld	hl, (_scroll_y)
	ld	(_scroll_y_vblank), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:43: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:45: void ClearOAMs(void) {
;	---------------------------------
; Function ClearOAMs
; ---------------------------------
_ClearOAMs::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:46: next_oam_idx = 0;
	xor	a, a
	ld	(_next_oam_idx+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:48: shadow_OAM[0] = mirror_OAM[0] = 0xd0;
	ld	hl, #_mirror_OAM+0
	ld	(hl), #0xd0
	ld	hl, #_shadow_OAM
	ld	(hl), #0xd0
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:52: }
	ret
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:54: void InitOAMs(void) {
;	---------------------------------
; Function InitOAMs
; ---------------------------------
_InitOAMs::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:55: memset(shadow_OAM, 0, MAX_HARDWARE_SPRITES * OAM_ENTRY_SIZE);
	ld	hl, #0x00c0
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_shadow_OAM
	push	hl
	call	_memset
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:56: memset(mirror_OAM, 0, MAX_HARDWARE_SPRITES * OAM_ENTRY_SIZE);
	ld	hl, #0x00c0
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_mirror_OAM
	push	hl
	call	_memset
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/OAMManager.c:57: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__next_oam_idx:
	.db #0x00	; 0
__xinit__oam:
	.dw _shadow_OAM
__xinit__oam0:
	.dw _shadow_OAM
__xinit__oam1:
	.dw _mirror_OAM
	.area _CABS (ABS)
