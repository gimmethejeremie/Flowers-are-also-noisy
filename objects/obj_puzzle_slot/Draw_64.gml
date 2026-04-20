var _sx = (x - camera_get_view_x(view_camera[0]))
          * (display_get_gui_width() / camera_get_view_width(view_camera[0]));
var _sy = (y - camera_get_view_y(view_camera[0]))
          * (display_get_gui_height() / camera_get_view_height(view_camera[0]));

draw_set_colour(filled ? c_lime : c_white);
draw_text(_sx, _sy - 20, filled ? "✓" : (show_label ? required_item : "?"));