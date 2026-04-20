var _lit = is_in_light(x, y);

if (global.in_puzzle_room) exit;

switch (state) {
    case MSTATE.SLEEP:
        if (point_distance(x, y, obj_p1.x, obj_p1.y) < detect_r && !_lit)
            state = MSTATE.TRACKING;
        break;

    case MSTATE.TRACKING:
        if (_lit) { state = MSTATE.FROZEN; break; }
        wake_timer--;
        if (wake_timer <= 0) state = MSTATE.CHASE;
        break;

case MSTATE.CHASE:
    if (_lit) { state = MSTATE.FROZEN; freeze_lerp = 0; break; }
    var _dir = point_direction(x, y, obj_p1.x, obj_p1.y);
    var _tilemap = layer_tilemap_get_id("Walls");
    var _mx = lengthdir_x(spd, _dir);
    var _my = lengthdir_y(spd, _dir);
    if (tilemap_get_at_pixel(_tilemap, x + _mx, y) == 0) x += _mx;
    if (tilemap_get_at_pixel(_tilemap, x, y + _my) == 0) y += _my;
    if (place_meeting(x, y, obj_p1)) {
        obj_p1.captured        = true;
        obj_p1.capture_timer   = 180;
        obj_p1.movement_locked = true;
        if (!obj_p1.rescued_dialogue_played) {
            obj_dialogue_manager.queue_dialogue("zone2_p1_caught");
            obj_p1.rescued_dialogue_played = true;
        }
        state      = MSTATE.SLEEP;
        wake_timer = wake_timer_max;
    }
    break;


    case MSTATE.FROZEN:
        freeze_lerp = min(freeze_lerp + 0.05, 1);
        if (!_lit) { state = MSTATE.STUN; stun_timer = 120; }
        break;

    case MSTATE.STUN:
        freeze_lerp = max(freeze_lerp - 0.05, 0);
        stun_timer--;
        if (stun_timer <= 0) {
            state = (point_distance(x, y, obj_p1.x, obj_p1.y) < detect_r)
                    ? MSTATE.CHASE : MSTATE.SLEEP;
            wake_timer = wake_timer_max;
        }
        break;
}