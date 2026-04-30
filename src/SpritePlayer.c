#include "Banks/SetAutoBank.h"
#include "ZGBMain.h"
#include "SpriteManager.h"
#include "Keys.h"
#include <gbdk/platform.h>
#include <gbdk/emu_debug.h>
#include "Scroll.h"
#include "Balancing.h"

// --- Formes ---
#define FORM_OFFENSIVE 0   // Lente, peut tirer (bouton A)
#define FORM_DEFENSIVE 1   // Rapide, ne tire pas

// --- Limites de l'écran (GBC : 160x144, sprite 8x16) ---
// Limites en coordonnées écran (offset depuis scroll_y)
#define PLAYER_MIN_X        8
#define PLAYER_MAX_X        144
#define PLAYER_SCREEN_MIN_Y 16
#define PLAYER_SCREEN_MAX_Y 128

// Stockage dans custom_data
#define player_form     THIS->custom_data[0]
#define fire_cooldown   THIS->custom_data[1]

void START(void* data) {
    player_form   = FORM_OFFENSIVE;
    fire_cooldown = 0;
    //THIS->coll_w = 16;
    //THIS->coll_h = 16;
    THIS->x -= 8;
    //THIS->y -= 8;
}

void UPDATE(void) {
    INT8 dx = 0;
    INT8 dy = 0;
    UINT8 speed;

    // --- Changement de forme (bouton B) ---
    if (KEY_TICKED(J_B)) {
        player_form = (player_form == FORM_OFFENSIVE) ? FORM_DEFENSIVE : FORM_OFFENSIVE;
    }

    // --- Tir (bouton A) ---
    // En forme défensive : bascule en offensive puis tire
    // En forme offensive : tire directement
    if (fire_cooldown > 0) {
        fire_cooldown--;
    }
    if (KEY_PRESSED(J_A) && fire_cooldown == 0) {
        player_form = FORM_OFFENSIVE;
        SpriteManagerAdd(SpriteBullet, THIS->x + 4, THIS->y);
        fire_cooldown = FIRE_COOLDOWN;
    }

    // --- Vitesse selon la forme active ---
    speed = (player_form == FORM_OFFENSIVE) ? SPEED_SLOW : SPEED_FAST;

    // --- Lecture du D-pad ---
    if (KEY_PRESSED(J_LEFT))  dx = -1;
    if (KEY_PRESSED(J_RIGHT)) dx = 1;
    if (KEY_PRESSED(J_UP))    dy = -1;
    if (KEY_PRESSED(J_DOWN))  dy = 1;

    // --- Normalisation diagonale ---
    UINT8 spd_diag = (player_form == FORM_OFFENSIVE) ? SPEED_SLOW_DIAG : SPEED_FAST_DIAG;

    if (dx != 0 && dy != 0) {
        // Diagonal : vitesse réduite par axe
        dx = (dx > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
        dy = (dy > 0) ? (INT8)spd_diag : -(INT8)spd_diag;
    } else {
        // Droit : vitesse pleine
        if (dx != 0) dx = (dx > 0) ? (INT8)speed : -(INT8)speed;
        if (dy != 0) dy = (dy > 0) ? (INT8)speed : -(INT8)speed;
    }

    // --- Déplacement avec clamping (INT16 pour éviter l'underflow sur UINT16) ---
    INT16 new_x = (INT16)THIS->x + (INT16)dx;
    INT16 new_y = (INT16)THIS->y + (INT16)dy;

    INT16 world_min_y = scroll_y + PLAYER_SCREEN_MIN_Y;
    INT16 world_max_y = scroll_y + PLAYER_SCREEN_MAX_Y;
    if (new_x < PLAYER_MIN_X)  new_x = PLAYER_MIN_X;
    if (new_x > PLAYER_MAX_X)  new_x = PLAYER_MAX_X;
    if (new_y < world_min_y)   new_y = world_min_y;
    if (new_y > world_max_y)   new_y = world_max_y;

    TranslateSprite(THIS, (INT8)(new_x - (INT16)THIS->x), (INT8)(new_y - (INT16)THIS->y));
    EMU_printf("x=%d y=%d coll_w=%d coll_h=%d\n", THIS->x, THIS->y, THIS->coll_w, THIS->coll_h);
}

void DESTROY(void) {
}
