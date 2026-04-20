if (!is_running) exit;
draw_set_alpha(0.85);
draw_set_colour(c_black);
draw_rectangle(40, 560, 1240, 700, false);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_text(60, 575, display_text);