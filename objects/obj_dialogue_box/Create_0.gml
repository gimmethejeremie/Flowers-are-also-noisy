is_running    = false;
current_text  = "";
display_text  = "";
char_index    = 0;
char_timer    = 0;
char_speed    = 2;

function start_dialogue(_id) {
    if (!ds_map_exists(global.dlg, _id)) exit;
    current_text = global.dlg[? _id];
    display_text = "";
    char_index   = 0;
    char_timer   = 0;
    is_running   = true;
}