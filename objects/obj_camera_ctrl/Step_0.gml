if (locked) exit;

if (!instance_exists(obj_p1)) exit;

var _cam_x  = camera_get_view_x(cam);
var _cam_y  = camera_get_view_y(cam);
var _view_w = camera_get_view_width(cam);
var _view_h = camera_get_view_height(cam);

// Follow P1
var _target_x = obj_p1.x - _view_w / 2;
var _target_y = obj_p1.y - _view_h / 2;

var _new_x = lerp(_cam_x, _target_x, follow_spd_x);
var _new_y = lerp(_cam_y, _target_y, follow_spd_y);

// Clamp trong room
_new_x = clamp(_new_x, 0, room_width  - _view_w);
_new_y = clamp(_new_y, 0, room_height - _view_h);

camera_set_view_pos(cam, _new_x, _new_y);