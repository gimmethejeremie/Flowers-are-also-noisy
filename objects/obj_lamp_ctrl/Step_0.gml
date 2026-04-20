var _im = obj_input_manager;
if (!angle_locked) angle += _im.p2_rotate * rotate_speed;
if (_im.p2_light_lock) angle_locked = !angle_locked;

var _ti = _im.p2_light_on ? 1.0 : 0.55;
light_intensity = lerp(light_intensity, _ti, 0.08);
var _t = (light_intensity - 0.55) / 0.45;
cone_length = lerp(180, 280, _t);