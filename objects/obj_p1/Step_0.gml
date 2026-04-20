var _im = obj_input_manager;

// Bị bắt
if (captured) {
    // Chờ dialogue chạy xong
    if (obj_dialogue_box.is_running) { exit; }

    // Đếm ngược
    capture_timer--;
    if (capture_timer <= 0) {
        x               = global.p1_checkpoint_x[global.current_zone];
        y               = global.p1_checkpoint_y[global.current_zone];
        captured        = false;
        movement_locked = false;
        capture_timer   = 180; // reset cho lần sau
    }
    exit;
}

if (movement_locked) exit;

// Auto-walk (endgame)
if (auto_walking) {
    var _dx = auto_walk_target_x - x;
    var _dy = auto_walk_target_y - y;
    var _d  = point_distance(0, 0, _dx, _dy);
    if (_d > 4) { x += (_dx/_d)*spd*0.7; y += (_dy/_d)*spd*0.7; }
    else        { auto_walking = false; }
    exit;
}

// Di chuyển + collision
var _nx = x + _im.p1_dx * spd;
var _ny = y + _im.p1_dy * spd;
if (tilemap_get_at_pixel(layer_tilemap_get_id("Walls"), _nx, y) == 0)
    x = _nx;
if (tilemap_get_at_pixel(layer_tilemap_get_id("Walls"), x, _ny) == 0)
    y = _ny;


// Nhặt / thả item
if (_im.p1_pickup_pressed) {
    if (held_item == "") {
        var _item = instance_place(x, y, obj_pickup_item);
        if (_item != noone) {
            held_item = _item.item_name;
            with (_item) instance_destroy();
        }
    } else {
        var _drop = instance_create_layer(x, y, "Items", obj_pickup_item);
        _drop.item_name = held_item;
        held_item = "";
    }
}