if (solved) exit;

// Kích hoạt khi P2 chiếu đèn vào
if (!active) {
    if (is_in_light(x, y)) active = true;
    exit;
}

// Phase 0 — phát chuỗi tín hiệu
if (phase == 0) {
    show_timer++;
    if (show_timer >= show_delay) {
        show_timer = 0;
        if (show_index < array_length(correct_seq)) {
            // Hiện tín hiệu hiện tại
            switch (correct_seq[show_index]) {
                case 1: current_hint = "← TRÁI";  break;
                case 2: current_hint = "→ PHẢI"; break;
                case 3: current_hint = "↑ LÊN";   break;
                case 4: current_hint = "↓ XUỐNG"; break;
            }
            show_index++;
        } else {
            // Phát xong → chuyển sang phase nhập
            current_hint = "Nhập lại!";
            show_index   = 0;
            phase        = 1;
        }
    }
    exit;
}

// Phase 1 — P1 nhập
if (phase == 1) {
    var _im  = obj_input_manager;
    var _input = -1;
    if (_im.p1_sym_left)  _input = 1;
    if (_im.p1_sym_down)  _input = 4;
    if (_im.p1_sym_up)    _input = 3;
    if (_im.p1_sym_right) _input = 2;

    if (_input != -1) {
        array_push(player_seq, _input);
        var _i = array_length(player_seq) - 1;

        if (player_seq[_i] != correct_seq[_i]) {
            // Sai → reset
            player_seq   = [];
            phase        = 0;
            show_index   = 0;
            current_hint = "Sai! Phát lại...";
        } else if (array_length(player_seq) == array_length(correct_seq)) {
            // Đúng hết → solved
            solved       = true;
            current_hint = "SOLVED!";
            obj_game_manager.puzzles_solved++;
        }
    }
}

if (array_length(player_seq) == array_length(correct_seq)) {
    solved       = true;
    current_hint = "SOLVED!";
    obj_game_manager.puzzles_solved++;
    
    // Xóa tường chặn
    with (obj_wall) {
        if (x > 1100 && x < 1200) instance_destroy(); // chỉnh tọa độ theo room
    }
}