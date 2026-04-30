#include "Banks/SetAutoBank.h"
#include "ZGBMain.h"
#include "SpriteManager.h"
#include "Balancing.h"
#define BULLET_MIN_Y   8u   // seuil hors écran (haut)

void START(void* data) {
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
