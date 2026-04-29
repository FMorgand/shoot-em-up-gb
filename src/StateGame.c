#include "Banks/SetAutoBank.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"

IMPORT_MAP(map);

void START(void) {
	SpriteManagerAdd(SpritePlayer, 80, 120);
	SpriteManagerAdd(SpriteEnemy,  40,  40);
	SpriteManagerAdd(SpriteEnemy,  80,  30);
	SpriteManagerAdd(SpriteEnemy, 120,  50);
	InitScroll(BANK(map), &map, 0, 0);
	scroll_target = NULL;
}

void UPDATE(void) {
}
