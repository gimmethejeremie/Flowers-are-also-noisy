if (!triggered && place_meeting(x, y, obj_p1)) {
    triggered = true;
    obj_dialogue_manager.queue_dialogue(dialogue_id);
}