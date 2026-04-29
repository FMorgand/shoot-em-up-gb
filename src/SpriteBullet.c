#include "Banks/SetAutoBank.h"
#include "ZGBMain.h"
#include "SpriteManager.h"

#define BULLET_SPEED   4    // pixels par frame, vers le haut
#define BULLET_MIN_Y   8u   // seuil hors écran (haut)

void START(void) {
}

void UPDATE(void) {
    // UINT16 est unsigned : on vérifie avant de soustraire pour éviter l'underflow
    if (THIS->y > BULLET_MIN_Y + BULLET_SPEED) {
        THIS->y -= BULLET_SPEED;
    } else {
        SpriteManagerRemoveSprite(THIS);
    }
}

void DESTROY(void) {
}
