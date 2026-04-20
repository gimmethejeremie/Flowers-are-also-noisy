var _lit = is_in_light(x, y);

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
        x += lengthdir_x(spd, _dir);
        y += lengthdir_y(spd, _dir);
        if (place_meeting(x, y, obj_p1)) {
            obj_p1.captured      = true;
            obj_p1.capture_timer = 180;
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