#include "Banks/SetAutoBank.h"

#include "ZGBMain.h"
#include "EnemyDefs.h"
#include "Scroll.h"
#include "Sprite.h"
#include "SpriteManager.h"
#include "Balancing.h"

IMPORT_MAP(map);

static UINT8 scroll_timer = 0;
static Sprite* player;

void START(void) {
	static const UINT8 coll_tiles[] = {1, 0};  // tile 1 = obstacle
	InitScroll(BANK(map), &map, coll_tiles, 0);
	scroll_target = NULL;
	scroll_timer = 0;
	ENABLE_SCROLL_CLAMPING;
	MoveScroll(0, scroll_h - DEVICE_SCREEN_PX_HEIGHT);
	// Spawner dans la zone visible (bas de la map)
	UINT16 base_y = (UINT16)scroll_y;
	player = SpriteManagerAdd(SpritePlayer, 80, base_y + 120);
	SpriteManagerAddEx(SpriteEnemy,  40, base_y + 40, (void*)MOVE_LINE);
	SpriteManagerAddEx(SpriteEnemy, 120, base_y + 40, (void*)MOVE_LINE);
	SpriteManagerAddEx(SpriteEnemy,  80, base_y + 30, (void*)MOVE_SINE);
}

void UPDATE(void) {
	if (++scroll_timer >= SCROLL_MOVE_EVERY) {
		scroll_timer = 0;
		INT16 prev_y = scroll_y;
		MoveScroll(scroll_x, scroll_y - 1);
		if (scroll_y != prev_y) {
			// Compensation scroll : tous les sprites restent fixes dans le monde
			UINT8 i;
			Sprite* spr;
			SPRITEMANAGER_ITERATE(i, spr) {
				TranslateSprite(spr, 0, -1);
			}
		}
	}
}
