if (!is_running) exit;

// Typewriter
if (char_index < string_length(current_text)) {
    char_timer++;
    if (char_timer >= char_speed) {
        char_timer = 0;
        char_index++;
        display_text = string_copy(current_text, 1, char_index);
    }
}

// E để skip hoặc sang dòng tiếp
if (obj_input_manager.p1_interact_pressed) {
    if (char_index < string_length(current_text)) {
        char_index   = string_length(current_text);
        display_text = current_text;
    } else {
        is_running = false;
    }
}