global.current_zone = 1;
global.p1_checkpoint_x[1] = 2  * 32;
global.p1_checkpoint_y[1] = 11 * 32;
global.p1_checkpoint_x[2] = 42 * 32;
global.p1_checkpoint_y[2] = 11 * 32;
global.p1_checkpoint_x[3] = 82 * 32;
global.p1_checkpoint_y[3] = 11 * 32;
puzzles_solved = 0;

// Dialogue data
global.dlg = ds_map_create();
global.dlg[? "intro"]           = "P1: Tối quá... không thấy gì hết.";
global.dlg[? "zone1_enter"]     = "P2: Có một con đứng chính giữa.";
global.dlg[? "zone2_enter"]     = "Tối hoàn toàn. Chỉ còn tiếng bước chân.";
global.dlg[? "zone2_p1_caught"] = "P2: Nhìn từ trên cao xuống… thấy gì không?";
global.dlg[? "zone3_enter"]     = "P2: Ba con. Và không có chỗ nấp.";
global.dlg[? "zone3_solved"]    = "Narrator: Cánh cửa mở ra.";