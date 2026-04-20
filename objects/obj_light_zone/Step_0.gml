var _im = obj_input_manager;

// P2 giữ L → vùng sáng mở rộng
var _target_w = _im.p2_light_on ? 192 : 128;
var _target_h = _im.p2_light_on ? 192 : 128;
zone_w = lerp(zone_w, _target_w, 0.1);
zone_h = lerp(zone_h, _target_h, 0.1);

// P2 giữ K → khóa vị trí, không di chuyển được
if (!_im.p2_light_lock) {
    x += _im.p2_rotate * move_speed;
    y += (keyboard_check(_im.P2_DOWN) - keyboard_check(_im.P2_UP)) * move_speed;
}

x = clamp(x, zone_w/2, room_width  - zone_w/2);
y = clamp(y, zone_h/2, room_height - zone_h/2);