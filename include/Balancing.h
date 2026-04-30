#ifndef BALANCING_H
#define BALANCING_H

// ============================================================
// JOUEUR
// ============================================================

#define FIRE_COOLDOWN       15   // frames entre deux tirs (~4 tirs/sec à 60fps)

#define SPEED_SLOW          1    // forme offensive, droit
#define SPEED_SLOW_DIAG     1    // forme offensive, diagonal
#define SPEED_FAST          3    // forme défensive, droit
#define SPEED_FAST_DIAG     2    // forme défensive, diagonal (≈ 3/√2 ≈ 2.12)

// ============================================================
// BULLETS JOUEUR
// ============================================================

#define BULLET_SPEED        4    // pixels par frame, vers le haut

// ============================================================
// ENNEMIS — valeurs par type
// L'ennemi avance de 1px toutes les MOVE_EVERY frames.
// 1 = 1px/frame (rapide), 3 = 1px/3frames, 6 = lent, etc.
// ============================================================

// Ennemi basique (ligne droite)
#define ENEMY_BASIC_HP          1
#define ENEMY_BASIC_MOVE_EVERY  3

// Ennemi sinusoïde
#define ENEMY_SINE_HP           1
#define ENEMY_SINE_MOVE_EVERY   2   // descente (plus rapide que le basique)
#define ENEMY_SINE_AMPLITUDE    2   // px de déplacement horizontal par step
#define ENEMY_SINE_PERIOD       1   // pas d'avance dans la table par step (1=lent, 2=2x plus vite, 4=4x)

// ============================================================
// ENVIRONNEMENT
// ============================================================

// Scrolling vertical automatique — remonte la map vers le haut
// 1px toutes les SCROLL_MOVE_EVERY frames (plus grand = plus lent)
#define SCROLL_MOVE_EVERY   10

#endif
