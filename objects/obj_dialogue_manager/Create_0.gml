queue      = ds_queue_create();
is_active  = false;

function queue_dialogue(_id) { ds_queue_enqueue(queue, _id); }
function end_all() { ds_queue_clear(queue); is_active = false; obj_p1.movement_locked = false; }