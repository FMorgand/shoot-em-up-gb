#include "Banks/SetAutoBank.h"
#include "ZGBMain.h"
#include "SpriteManager.h"

#define enemy_hp  THIS->custom_data[0]

void START(void) {
    enemy_hp = 1;
}

void UPDATE(void) {
    UINT8 i;
    Sprite* spr;
    SPRITEMANAGER_ITERATE(i, spr) {
        if (spr->type == SpriteBullet && CheckCollision(THIS, spr)) {
            SpriteManagerRemoveSprite(spr);
            if (--enemy_hp == 0) {
                SpriteManagerRemoveSprite(THIS);
                return;
            }
        }
    }
}

void DESTROY(void) {
}
