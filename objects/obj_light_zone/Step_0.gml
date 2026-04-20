// Step Event — sửa lại:
var _im = obj_input_manager;

if (_im.p2_light_lock) is_locked = !is_locked;

var _target_w = _im.p2_light_on ? 192 : 128;
var _target_h = _im.p2_light_on ? 192 : 128;
zone_w = lerp(zone_w, _target_w, 0.1);
zone_h = lerp(zone_h, _target_h, 0.1);

if (!is_locked) {
    x += _im.p2_rotate * move_speed;
    y += (keyboard_check(_im.P2_DOWN) - keyboard_check(_im.P2_UP)) * move_speed;
}

x = clamp(x, zone_w/2, room_width  - zone_w/2);
y = clamp(y, zone_h/2, room_height - zone_h/2);