if (!is_active && !ds_queue_empty(queue)) {
    is_active = true;
    obj_p1.movement_locked = true;
    obj_dialogue_box.start_dialogue(ds_queue_dequeue(queue));
}
if (is_active && !obj_dialogue_box.is_running) {
    is_active = false;
    if (ds_queue_empty(queue))
        obj_p1.movement_locked = false;
}