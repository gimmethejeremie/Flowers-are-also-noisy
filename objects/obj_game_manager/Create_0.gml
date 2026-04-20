if (!variable_global_exists("current_zone")) global.current_zone = 1;
global.p1_checkpoint_x[1] = 2  * 32;
global.p1_checkpoint_y[1] = 11 * 32;
global.p1_checkpoint_x[2] = 42 * 32;
global.p1_checkpoint_y[2] = 11 * 32;
global.p1_checkpoint_x[3] = 82 * 32;
global.p1_checkpoint_y[3] = 11 * 32;
if (!variable_global_exists("puzzles_solved")) global.puzzles_solved = 0;
if (!variable_global_exists("puzzle_solved_1")) global.puzzle_solved_1 = false;
if (!variable_global_exists("puzzle_solved_3")) global.puzzle_solved_3 = false;
if (!variable_global_exists("return_from_puzzle")) global.return_from_puzzle = false;
if (!variable_global_exists("return_x")) global.return_x = 0;
if (!variable_global_exists("return_y")) global.return_y = 0;
if (!variable_global_exists("pending_dialogue_id")) global.pending_dialogue_id = "";

// Dialogue data
global.dlg = ds_map_create();
global.dlg[? "intro"]           = "P1: Tối quá... không thấy gì hết.";
global.dlg[? "zone1_enter"]     = "P2: Có một con đứng chính giữa.";
global.dlg[? "zone2_enter"]     = "Tối hoàn toàn. Chỉ còn tiếng bước chân.";
global.dlg[? "zone2_p1_caught"] = "P2: Nhìn từ trên cao xuống… thấy gì không?";
global.dlg[? "zone3_enter"]     = "P2: Ba con. Và không có chỗ nấp.";
global.dlg[? "zone3_solved"]    = "Narrator: Cánh cửa mở ra.";
global.dlg[? "zone_locked_1"]   = "P2: Chưa xong puzzle khu này. Tường chưa mở.";
global.dlg[? "zone_locked_2"]   = "P2: Giải nốt puzzle khu này rồi hãy đi tiếp.";

// Puzzle room mode
global.in_puzzle_room   = false;
global.active_puzzle_id = 0;

function enter_puzzle_room(_puzzle_id) {
	if (global.in_puzzle_room) exit;

	global.in_puzzle_room   = true;
	global.active_puzzle_id = _puzzle_id;

	if (instance_exists(obj_p1))         obj_p1.movement_locked = true;
	if (instance_exists(obj_camera_ctrl)) obj_camera_ctrl.locked = true;
}

function exit_puzzle_room() {
	if (!global.in_puzzle_room) exit;

	global.in_puzzle_room   = false;
	global.active_puzzle_id = 0;

	if (instance_exists(obj_camera_ctrl)) obj_camera_ctrl.locked = false;
	if (instance_exists(obj_p1)) {
		if (!instance_exists(obj_dialogue_manager) || !obj_dialogue_manager.is_active) {
			obj_p1.movement_locked = false;
		}
	}
}