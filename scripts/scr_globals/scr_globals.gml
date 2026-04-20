enum MSTATE { SLEEP, TRACKING, CHASE, FROZEN, STUN }

function is_in_light(_px, _py) {
    if (!instance_exists(obj_light_zone)) return false;
    var _lz = obj_light_zone;
    return (_px > _lz.x - _lz.zone_w/2)
        && (_px < _lz.x + _lz.zone_w/2)
        && (_py > _lz.y - _lz.zone_h/2)
        && (_py < _lz.y + _lz.zone_h/2);
}