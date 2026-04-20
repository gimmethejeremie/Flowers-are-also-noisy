var _required = global.current_zone;
var _can_open = (global.puzzles_solved >= _required);

if (!wall_open && _can_open) {
    wall_open = true;

    var _tm = layer_tilemap_get_id("Walls");
    if (_tm != -1) {
        for (var _yy = y - open_half_h; _yy <= y + open_half_h; _yy += 16) {
            for (var _xx = x - open_half_w; _xx <= x + open_half_w; _xx += 16) {
                tilemap_set_at_pixel(_tm, _xx, _yy, 0);
            }
        }
    }
}

var _touching = place_meeting(x, y, obj_p1);

if (!triggered && _touching) {
    if (!wall_open) {
        if (!warned_locked) {
            var _dlg_id = (_required == 1) ? "zone_locked_1" : "zone_locked_2";
            obj_dialogue_manager.queue_dialogue(_dlg_id);
            warned_locked = true;
        }
    } else {
        warned_locked = false;
        triggered  = true;
        is_panning = true;
        obj_p1.movement_locked = true;
        obj_camera_ctrl.locked = true;  // thêm dòng này
        global.current_zone++;
    }
} else if (!_touching) {
    warned_locked = false;
}

if (is_panning) {
    var _cam_x  = camera_get_view_x(view_camera[0]);
    var _view_w = camera_get_view_width(view_camera[0]);
    var _dest   = target_x - _view_w / 2;
    var _new_x  = lerp(_cam_x, _dest, 0.05);
    camera_set_view_pos(view_camera[0], _new_x, camera_get_view_y(view_camera[0]));

    if (abs(_cam_x - _dest) < 4) {
        is_panning = false;
        obj_p1.movement_locked = false;
        obj_camera_ctrl.locked = false;  // thêm dòng này
    }
}