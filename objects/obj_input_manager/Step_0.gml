var _in_puz3 = false;
if (instance_exists(obj_puzzle_symbol)) {
    with (obj_puzzle_symbol) {
        if (active && !solved) other._in_puz3 = true;
    }
}

// Thêm check puzzle 1
var _in_puz1 = false;
if (instance_exists(obj_puzzle_signal)) {
    with (obj_puzzle_signal) {
        if (active && phase == 1 && !solved) other._in_puz1 = true;
    }
}

var _rm_puzzle_1 = asset_get_index("rm_puzzle_1");
var _rm_puzzle_3 = asset_get_index("rm_puzzle_3");
var _is_puzzle_room = (room == _rm_puzzle_1 || room == _rm_puzzle_3);
var _in_puz = _is_puzzle_room || _in_puz1 || _in_puz3;

// Phần còn lại giữ nguyên
p1_dx = keyboard_check(P1_RIGHT) - keyboard_check(P1_LEFT);
p1_dy = keyboard_check(P1_DOWN)  - keyboard_check(P1_UP);
if (p1_dx != 0 && p1_dy != 0) { p1_dx *= 0.7071; p1_dy *= 0.7071; }

p1_interact_pressed = keyboard_check_pressed(P1_INTERACT);
p1_pickup_pressed   = keyboard_check_pressed(P1_PICKUP);

if (!_is_puzzle_room && !_in_puz) {
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

if (_is_puzzle_room) {
    p2_light_on   = false;
    p2_light_lock = false;
} else {
    p2_light_on   = keyboard_check(P2_LIGHT_HOLD);
    p2_light_lock = keyboard_check_pressed(P2_LIGHT_LOCK);
}