if (!active || solved) exit;
var _rm_puzzle_1 = asset_get_index("rm_puzzle_1");
if (room != _rm_puzzle_1) exit;

var _sw = display_get_gui_width();
var _sh = display_get_gui_height();

draw_set_alpha(0.9);
draw_set_colour(c_black);
draw_rectangle(0, 0, _sw, _sh, false);
draw_set_alpha(1);

draw_set_colour(c_white);
draw_text(_sw * 0.5 - 140, 80, "PUZZLE ROOM 1: SIGNAL");

draw_set_colour(c_yellow);
draw_text(_sw * 0.5 - 120, 160, "Phase: " + string(phase));
draw_text(_sw * 0.5 - 120, 190, "Gợi ý: " + current_hint);

if (phase == 1) {
    draw_set_colour(c_white);
    draw_text(_sw * 0.5 - 160, 240, "Dùng mũi tên ←↑→↓ để nhập lại chuỗi");
    draw_text(_sw * 0.5 - 160, 270, "Đã nhập: " + string(array_length(player_seq)) + " / " + string(array_length(correct_seq)));
}