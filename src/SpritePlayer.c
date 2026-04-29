#include "Banks/SetAutoBank.h"
#include "ZGBMain.h"
#include "SpriteManager.h"
#include "Keys.h"
#include <gbdk/platform.h>

// --- Formes ---
#define FORM_OFFENSIVE 0   // Lente, peut tirer (bouton A)
#define FORM_DEFENSIVE 1   // Rapide, ne tire pas

// --- Tir ---
#define FIRE_COOLDOWN 15   // frames entre deux tirs (~4 tirs/sec à 60fps)

// --- Vitesses (pixels par frame) ---
// Diagonal = speed / √2, arrondi à l'entier le plus proche
#define SPEED_SLOW          1   // Forme offensive, droit
#define SPEED_SLOW_DIAG     1   // Forme offensive, diagonal (inévitable avec des entiers)
#define SPEED_FAST          3   // Forme défensive, droit
#define SPEED_FAST_DIAG     2   // Forme défensive, diagonal (≈ 3/√2 ≈ 2.12)

// --- Limites de l'écran (GBC : 160x144, sprite 8x16) ---
#define PLAYER_MIN_X  8
#define PLAYER_MAX_X  144
#define PLAYER_MIN_Y  16
#define PLAYER_MAX_Y  128

// Stockage dans custom_data
#define player_form     THIS->custom_data[0]
#define fire_cooldown   THIS->custom_data[1]

void START(void) {
    player_form   = FORM_OFFENSIVE;
    fire_cooldown = 0;
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

    if (new_x < PLAYER_MIN_X) new_x = PLAYER_MIN_X;
    if (new_x > PLAYER_MAX_X) new_x = PLAYER_MAX_X;
    if (new_y < PLAYER_MIN_Y) new_y = PLAYER_MIN_Y;
    if (new_y > PLAYER_MAX_Y) new_y = PLAYER_MAX_Y;

    THIS->x = (UINT16)new_x;
    THIS->y = (UINT16)new_y;
}

void DESTROY(void) {
}
