show_label = is_in_light(x, y);

if (filled) exit;

// P1 đứng gần, đang cầm đúng item, nhấn E
if (place_meeting(x, y, obj_p1) && obj_input_manager.p1_interact_pressed) {
    if (obj_p1.held_item == required_item) {
        filled           = true;
        obj_p1.held_item = ""; // lấy item khỏi tay P1

        // Kiểm tra tất cả slot xong chưa
        var _all = true;
        with (obj_puzzle_slot) { if (!filled) _all = false; }
        if (_all) {
            obj_game_manager.puzzles_solved++;
            obj_dialogue_manager.queue_dialogue("zone2_enter");
        }
    }
}