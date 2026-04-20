// Vẽ tạm để thấy vùng sáng khi test
draw_set_alpha(0.3);
draw_set_colour(c_yellow);
draw_rectangle(x - zone_w/2, y - zone_h/2, x + zone_w/2, y + zone_h/2, false);
draw_set_alpha(1);