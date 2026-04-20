if (!active || solved) exit;
var _gui_x = 400;
var _gui_y = 500;
draw_set_colour(c_white);
draw_text(_gui_x, _gui_y, "Chọn ký hiệu: " + available_syms[selected_index]);
draw_text(_gui_x, _gui_y + 20, "Đã nhập: " + string(array_length(player_input)) + " / 4");