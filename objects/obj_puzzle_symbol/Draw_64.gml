if (!active || solved) exit;
var _rm_puzzle_3 = asset_get_index("rm_puzzle_3");
if (room != _rm_puzzle_3) exit;

var _sw = display_get_gui_width();
var _sh = display_get_gui_height();

draw_set_alpha(0.9);
draw_set_colour(c_black);
draw_rectangle(0, 0, _sw, _sh, false);
draw_set_alpha(1);

draw_set_colour(c_white);
draw_text(_sw * 0.5 - 130, 80, "PUZZLE ROOM 3: SYMBOL");
draw_text(_sw * 0.5 - 170, 180, "Choose a symbol with LEFT/RIGHT, press E to confirm");
draw_text(_sw * 0.5 - 120, 230, "Current: " + available_syms[selected_index]);
draw_text(_sw * 0.5 - 120, 260, "Progress: " + string(array_length(player_input)) + " / 4");