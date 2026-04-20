// Khi P1 chạm trigger lần đầu
if (!triggered && place_meeting(x, y, obj_p1)) {
    triggered  = true;
    is_panning = true;
    obj_p1.movement_locked = true;
    global.current_zone++;
}

// Camera pan về khu mới
if (is_panning) {
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _view_w = camera_get_view_width(view_camera[0]);
    var _dest = target_x - _view_w / 2;

    // Lerp camera về đích
    var _new_x = lerp(_cam_x, _dest, 0.05);
    camera_set_view_pos(view_camera[0], _new_x, camera_get_view_y(view_camera[0]));

    // Khi camera đã tới nơi
    if (abs(_cam_x - _dest) < 4) {
        is_panning = false;
        obj_p1.movement_locked = false;
    }
}