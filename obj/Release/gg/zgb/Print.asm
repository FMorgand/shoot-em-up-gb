;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Print
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateMapTile
	.globl _set_native_tile_data
	.globl _memcpy
	.globl _uitoa
	.globl _itoa
	.globl _font_offset
	.globl _print_target
	.globl _print_y
	.globl _print_x
	.globl _print_render
	.globl _font_tiledata_bank
	.globl _font_tiledata
	.globl _font_current_offset
	.globl _default_recode_table
	.globl b_InitDefaultRecode
	.globl _InitDefaultRecode
	.globl _InitRecodeTable
	.globl _Printf
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
_font_current_offset::
	.ds 2
_font_tiledata::
	.ds 2
_font_tiledata_bank::
	.ds 1
_Printf_tmp_10000_233:
	.ds 10
_Printf_old_x_10000_233:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_print_render::
	.ds 1
_print_x::
	.ds 1
_print_y::
	.ds 1
_print_target::
	.ds 1
_font_offset::
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
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:32: void InitRecodeTable(const UINT8* recode_table, UINT8 bank) NONBANKED {
;	---------------------------------
; Function InitRecodeTable
; ---------------------------------
_InitRecodeTable::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ex	de, hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:33: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-1 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:34: SWITCH_ROM(bank);
	ld	a, 4 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:35: memcpy(font_recode_table, recode_table + ' ', RECODE_TABLE_SIZE);
	ld	hl, #0x0020
	add	hl, de
	ex	de, hl
	ld	hl, #0x0060
	push	hl
	ld	hl, #_font_recode_table
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:36: SWITCH_ROM(__save);
	ld	a, -1 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:37: }
	inc	sp
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:39: UINT8 Printf(const unsigned char* txt, ...) NONBANKED { 
;	---------------------------------
; Function Printf
; ---------------------------------
_Printf::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:43: const unsigned char *ptr = txt; 
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:46: old_x = print_x;
	ld	a, (_print_x+0)
	ld	(_Printf_old_x_10000_233+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:49: if(print_target != PRINT_BKG) return 0;
	ld	a, (_print_target+0)
	or	a, a
	jr	Z, 00102$
	xor	a, a
	jp	00117$
00102$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:51: va_start(list, txt); 
	ld	hl, #9
	add	hl, sp
	ex	(sp), hl
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:52: while(*ptr) {
00114$:
	ld	a, (bc)
	or	a, a
	jp	Z, 00116$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:53: c = (*ptr++) & 0x7fu; // support only ascii
	inc	bc
	and	a, #0x7f
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:54: if (c == '%') {
	ld	-1 (ix), a
	sub	a, #0x25
	jr	NZ, 00110$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:55: switch(c = *(ptr++) & 0x7fu) {
	ld	a, (bc)
	inc	bc
	res	7, a
	ld	-1 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:58: itoa(va_arg(list, INT16), tmp, 10);
	pop	de
	push	de
	inc	de
	inc	de
	ld	l, e
	ld	h, d
	dec	hl
	dec	hl
	push	hl
	pop	iy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:55: switch(c = *(ptr++) & 0x7fu) {
	cp	a, #0x64
	jr	Z, 00104$
	cp	a, #0x69
	jr	Z, 00104$
	cp	a, #0x73
	jr	Z, 00106$
	sub	a, #0x75
	jr	Z, 00105$
	jr	00110$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:57: case 'i':
00104$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:58: itoa(va_arg(list, INT16), tmp, 10);
	inc	sp
	inc	sp
	push	de
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #_Printf_tmp_10000_233
	push	hl
	push	de
	call	_itoa
	pop	af
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:59: Printf(tmp);
	inc	sp
	ld	hl,#_Printf_tmp_10000_233
	ex	(sp),hl
	call	_Printf
	pop	af
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:60: continue;
	jr	00114$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:61: case 'u':
00105$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:62: uitoa(va_arg(list, INT16), tmp, 10);
	inc	sp
	inc	sp
	push	de
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #_Printf_tmp_10000_233
	push	hl
	push	de
	call	_uitoa
	pop	af
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:63: Printf(tmp);
	inc	sp
	ld	hl,#_Printf_tmp_10000_233
	ex	(sp),hl
	call	_Printf
	pop	af
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:64: continue;
	jr	00114$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:65: case 's':
00106$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:66: Printf(va_arg(list, char*));
	inc	sp
	inc	sp
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	push	de
	call	_Printf
	pop	af
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:67: continue;
	jp	00114$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:70: }
00110$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:72: c = font_recode_table[((c < ' ') ? 0u : (c - ' '))];
	ld	a, -1 (ix)
	sub	a, #0x20
	jr	NC, 00119$
	xor	a, a
	jr	00120$
00119$:
	ld	a, -1 (ix)
	add	a, #0xe0
00120$:
	ld	l, a
	ld	h, #0x00
	ld	de, #_font_recode_table
	add	hl, de
	ld	e, (hl)
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:73: if (print_render) {
	ld	a, (_print_render+0)
	or	a, a
	jr	Z, 00112$
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:74: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-1 (ix), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:75: SWITCH_ROM(font_tiledata_bank);
	ld	a, (_font_tiledata_bank+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:80: set_native_tile_data(font_current_offset, 1, font_tiledata + ((UINT16)c << 5));
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, (_font_tiledata)
	add	hl, de
	ld	iy, (_font_current_offset)
	push	bc
	push	hl
	ld	de, #0x0001
	push	iy
	pop	hl
	call	_set_native_tile_data
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:85: SWITCH_ROM(__save);
	ld	a, -1 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:90: UpdateMapTile(print_target, print_x + scroll_offset_x, print_y + scroll_offset_y, font_current_offset, 0, NULL);
	ld	hl, #_scroll_offset_y
	ld	a, (_print_y+0)
	add	a, (hl)
	ld	d, a
	ld	hl, #_scroll_offset_x
	ld	a, (_print_x+0)
	add	a, (hl)
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	h, #0x00
	push	hl
	inc	sp
	ld	hl, (_font_current_offset)
	push	hl
	push	de
	inc	sp
	ld	l, a
	ld	a, (_print_target)
	call	_UpdateMapTile
	pop	bc
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:95: font_current_offset++;
	ld	hl, (_font_current_offset)
	inc	hl
	ld	(_font_current_offset), hl
	jr	00113$
00112$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:100: UpdateMapTile(print_target, print_x + scroll_offset_x, print_y + scroll_offset_y, font_offset, c, NULL);
	ld	hl, #_scroll_offset_y
	ld	a, (_print_y+0)
	add	a, (hl)
	ld	d, a
	ld	hl, #_scroll_offset_x
	ld	a, (_print_x+0)
	add	a, (hl)
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	h, e
	push	hl
	inc	sp
	ld	hl, (_font_offset)
	push	hl
	push	de
	inc	sp
	ld	l, a
	ld	a, (_print_target)
	call	_UpdateMapTile
	pop	bc
00113$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:106: print_x++;
	ld	hl, #_print_x
	inc	(hl)
	jp	00114$
00116$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:110: return print_x - old_x;
	ld	hl, #_Printf_old_x_10000_233
	ld	a, (_print_x+0)
	sub	a, (hl)
00117$:
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:111: }
	ld	sp, ix
	pop	ix
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:28: void InitDefaultRecode(void) BANKED {
;	---------------------------------
; Function InitDefaultRecode
; ---------------------------------
	b_InitDefaultRecode	= 1
_InitDefaultRecode::
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:29: memcpy(font_recode_table, default_recode_table, RECODE_TABLE_SIZE);
	ld	hl, #0x0060
	push	hl
	ld	de, #_default_recode_table
	ld	hl, #_font_recode_table
	call	_memcpy
;C:/Users/franc/Documents/Projets/Perso/GameBoyProjects/CrossZGB/common/src/Print.c:30: }
	ret
_default_recode_table:
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x2b	; 43
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CODE_1
	.area _INITIALIZER
__xinit__print_render:
	.db #0x00	; 0
__xinit__print_x:
	.db #0x00	; 0
__xinit__print_y:
	.db #0x00	; 0
__xinit__print_target:
	.db #0x00	; 0
__xinit__font_offset:
	.dw #0x0000
	.area _CABS (ABS)
