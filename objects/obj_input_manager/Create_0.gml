// P1 — WASD + E + Q (giữ nguyên)
P1_UP       = ord("W");
P1_DOWN     = ord("S");
P1_LEFT     = ord("A");
P1_RIGHT    = ord("D");
P1_INTERACT = ord("E");
P1_PICKUP   = ord("Q");

// P2 — mũi tên + L + K
P2_LEFT       = vk_left;
P2_RIGHT      = vk_right;
P2_UP         = vk_up;
P2_DOWN       = vk_down;
P2_LIGHT_HOLD = ord("L");
P2_LIGHT_LOCK = ord("K");

// Output P1
p1_dx = 0; p1_dy = 0;
p1_interact_pressed = false;
p1_pickup_pressed   = false;

// Output P2
p2_dx = 0; p2_dy = 0;         // nếu muốn P2 di chuyển sau này
p2_rotate     = 0;
p2_light_on   = false;
p2_light_lock = false;

// Puzzle 3 — mũi tên chuyển sang P1
p1_sym_up    = false; p1_sym_down  = false;
p1_sym_left  = false; p1_sym_right = false;