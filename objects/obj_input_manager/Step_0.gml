var _puz_id = asset_get_index("obj_puzzle_symbol");
var _in_puz3 = (_puz_id != -1)
               && instance_exists(_puz_id)
               && instance_find(_puz_id, 0).active
               && !instance_find(_puz_id, 0).solved;

// Thêm check puzzle 1
var _sig_id = asset_get_index("obj_puzzle_signal");
var _in_puz1 = (_sig_id != -1)
               && instance_exists(_sig_id)
               && instance_find(_sig_id, 0).active
               && instance_find(_sig_id, 0).phase == 1
               && !instance_find(_sig_id, 0).solved;

var _in_puz = _in_puz1 || _in_puz3;

// Phần còn lại giữ nguyên
p1_dx = keyboard_check(P1_RIGHT) - keyboard_check(P1_LEFT);
p1_dy = keyboard_check(P1_DOWN)  - keyboard_check(P1_UP);
if (p1_dx != 0 && p1_dy != 0) { p1_dx *= 0.7071; p1_dy *= 0.7071; }

p1_interact_pressed = keyboard_check_pressed(P1_INTERACT);
p1_pickup_pressed   = keyboard_check_pressed(P1_PICKUP);

if (!_in_puz) {
    p2_rotate    = keyboard_check(P2_RIGHT) - keyboard_check(P2_LEFT);
    p1_sym_up    = false; p1_sym_down  = false;
    p1_sym_left  = false; p1_sym_right = false;
} else {
    p2_rotate    = 0;
    p1_sym_up    = keyboard_check_pressed(vk_up);
    p1_sym_down  = keyboard_check_pressed(vk_down);
    p1_sym_left  = keyboard_check_pressed(vk_left);
    p1_sym_right = keyboard_check_pressed(vk_right);
}

p2_light_on   = keyboard_check(P2_LIGHT_HOLD);
p2_light_lock = keyboard_check_pressed(P2_LIGHT_LOCK);