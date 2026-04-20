if (solved) exit;

var _rm_puzzle_3 = asset_get_index("rm_puzzle_3");

if (room == rm_main) {
    if (instance_exists(obj_p1)) {
        var _near = point_distance(x, y, obj_p1.x, obj_p1.y) <= 28;
        if (_near) {
            global.return_x = obj_p1.x;
            global.return_y = obj_p1.y;
            global.return_from_puzzle = true;
            room_goto(_rm_puzzle_3);
            exit;
        }
    }
    exit;
}

if (room != _rm_puzzle_3) exit;

active = true;
var _im = obj_input_manager;

// Move selector
if (_im.p1_sym_left) {
    selected_index = (selected_index - 1 + array_length(available_syms)) mod array_length(available_syms);
}
if (_im.p1_sym_right) {
    selected_index = (selected_index + 1) mod array_length(available_syms);
}

// E to confirm selected symbol
if (_im.p1_interact_pressed) {
    var _chosen = available_syms[selected_index];
    array_push(player_input, _chosen);
    var _i = array_length(player_input) - 1;

    if (_i >= array_length(correct_symbols) || _chosen != correct_symbols[_i]) {
        player_input   = [];
        selected_index = 0;
    } else if (array_length(player_input) == array_length(correct_symbols)) {
        solved = true;
        if (!global.puzzle_solved_3) {
            global.puzzle_solved_3 = true;
            global.puzzles_solved++;
        }
        global.pending_dialogue_id = "zone3_solved";
        room_goto(rm_main);
    }
}