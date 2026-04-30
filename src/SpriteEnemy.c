#include "Banks/SetAutoBank.h"
#include "ZGBMain.h"
#include "SpriteManager.h"
#include "Scroll.h"

#include "EnemyDefs.h"
#include "Balancing.h"

// --- Limites ---
#define ENEMY_MAX_Y  160u  // suppression quand hors écran en bas

// --- custom_data ---
#define enemy_hp      THIS->custom_data[0]
#define enemy_move    THIS->custom_data[1]
#define enemy_timer   THIS->custom_data[2]  // compteur de frames pour la vitesse
#define enemy_phase   THIS->custom_data[3]  // phase sinusoïde (index dans la table)

// --- Table de sinus (32 entrées = 1 période complète) ---
// Approximation entière de sin(i * 2π/32), somme = 0 sur une période complète
// ENEMY_SINE_PERIOD contrôle la vitesse d'oscillation :
//   1 = lent (avance 1 case/step), 2 = moyen, 4 = rapide
static const INT8 sine_dx[32] = {
    0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 0, 0
};

void START(void* data) {
    enemy_move  = (UINT8)(UINT16)data;  // comportement passé via SpriteManagerAddEx
    enemy_timer = 0;
    enemy_phase = 0;

    // HP selon le type
    switch (enemy_move) {
        case MOVE_SINE:  enemy_hp = ENEMY_SINE_HP;  break;
        default:         enemy_hp = ENEMY_BASIC_HP; break;
    }
}

static void UpdateMovement(void) {
    switch (enemy_move) {
        case MOVE_STATIC:
            break;

        case MOVE_LINE:
            if (++enemy_timer >= ENEMY_BASIC_MOVE_EVERY) {
                enemy_timer = 0;
                THIS->y += 1;
            }
            break;

        case MOVE_SINE:
            if (++enemy_timer >= ENEMY_SINE_MOVE_EVERY) {
                enemy_timer = 0;
                THIS->y += 1;
                THIS->x = (UINT16)((INT16)THIS->x + (INT16)sine_dx[enemy_phase & 31u] * ENEMY_SINE_AMPLITUDE);
                enemy_phase += ENEMY_SINE_PERIOD;
            }
            break;

        case MOVE_V:
        case MOVE_BOUNCE:
        default:
            break;
    }
}

void UPDATE(void) {
    // Déplacement (désactivé — test de la compensation scroll)
    // UpdateMovement();

    // Suppression si hors écran (bas) — coordonnées monde
    if (THIS->y >= (UINT16)scroll_y + DEVICE_SCREEN_PX_HEIGHT) {
        SpriteManagerRemoveSprite(THIS);
        return;
    }

    // Collision avec les bullets joueur
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
