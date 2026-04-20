var _sw = display_get_gui_width();
var _sh = display_get_gui_height();
if (!surface_exists(surf)) surf = surface_create(_sw, _sh);

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _sx = _sw / camera_get_view_width(view_camera[0]);
var _sy = _sh / camera_get_view_height(view_camera[0]);

// Tọa độ vùng sáng trong GUI space
var _lz = obj_light_zone;
var _lx1 = (_lz.x - _lz.zone_w/2 - _cam_x) * _sx;
var _ly1 = (_lz.y - _lz.zone_h/2 - _cam_y) * _sy;
var _lx2 = (_lz.x + _lz.zone_w/2 - _cam_x) * _sx;
var _ly2 = (_lz.y + _lz.zone_h/2 - _cam_y) * _sy;

surface_set_target(surf);
    draw_clear_alpha(c_black, 1);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_set_alpha(0);
    // Khoét lỗ hình chữ nhật = vùng sáng
    draw_rectangle(_lx1, _ly1, _lx2, _ly2, false);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
surface_reset_target();

var _target = 0.88;
switch (global.current_zone) {
    case 1: _target = 0.88; break;
    case 2: _target = 0.94; break;
    case 3: _target = lerp(0.91, 0, obj_game_manager.puzzles_solved / 3); break;
}
darkness_alpha = lerp(darkness_alpha, _target, 0.02);
draw_surface_ext(surf, 0, 0, 1, 1, 0, c_black, darkness_alpha);