if (!active || solved) exit;
draw_set_colour(c_yellow);
draw_text(20, 20, "Puzzle 1 | Phase: " + string(phase));
draw_text(20, 40, "Gợi ý: " + current_hint);
if (phase == 1) {
    draw_set_colour(c_white);
    draw_text(20, 60, "Dùng mũi tên ←↑→↓ để nhập");
    draw_text(20, 80, "Đã nhập: " + string(array_length(player_seq)) + " / " + string(array_length(correct_seq)));
}