if (solved) exit;

// Kích hoạt khi P1 đến gần và nhấn E
if (!active) {
    if (place_meeting(x, y, obj_p1) && obj_input_manager.p1_interact_pressed)
        active = true;
    exit;
}

// Mũi tên đã chuyển sang P1 (input_manager xử lý)
var _im = obj_input_manager;
var _input = "";
if (_im.p1_sym_right) _input = available_syms[selected_index];
if (_im.p1_sym_left) {
    selected_index = (selected_index - 1 + array_length(available_syms))
                     mod array_length(available_syms);
}
if (_im.p1_sym_right) {
    selected_index = (selected_index + 1) mod array_length(available_syms);
}

// E để xác nhận ký hiệu đang chọn
if (_im.p1_interact_pressed) {
    var _chosen = available_syms[selected_index];
    array_push(player_input, _chosen);
    var _i = array_length(player_input) - 1;

    if (_i >= array_length(correct_symbols) || _chosen != correct_symbols[_i]) {
        // Sai → xóa hết
        player_input   = [];
        selected_index = 0;
    } else if (array_length(player_input) == array_length(correct_symbols)) {
        solved = true;
        obj_game_manager.puzzles_solved++;
        obj_dialogue_manager.queue_dialogue("zone3_solved");
    }
}