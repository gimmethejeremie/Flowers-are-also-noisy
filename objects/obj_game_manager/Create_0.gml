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
if (!variable_global_exists("pending_wall_open")) global.pending_wall_open = false;
if (!variable_global_exists("pending_wall_x")) global.pending_wall_x = 0;
if (!variable_global_exists("pending_wall_y")) global.pending_wall_y = 0;

// Dialogue data
global.dlg = ds_map_create();
global.dlg[? "intro"]           = "P1: It is too dark... I cannot see anything.";
global.dlg[? "zone1_enter"]     = "P2: There is one standing in the middle.";
global.dlg[? "zone2_enter"]     = "Total darkness. Only footsteps remain.";
global.dlg[? "zone2_p1_caught"] = "P2: From above... can you see anything?";
global.dlg[? "zone3_enter"]     = "P2: Three of them. And nowhere to hide.";
global.dlg[? "zone3_solved"]    = "Narrator: The door opens.";
global.dlg[? "zone_locked_1"]   = "P2: This area's puzzle is not done yet. The wall is still closed.";
global.dlg[? "zone_locked_2"]   = "P2: Finish this area's puzzle before moving on.";

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

function open_walls_near(_x, _y, _half_w, _half_h) {
	if (room != rm_main) exit;

	var _tm = layer_tilemap_get_id("Walls");
	if (_tm == -1) exit;

	// Tìm cột tường gần vị trí anchor theo trục X (ưu tiên bên phải, rồi bên trái)
	var _gate_x = _x;
	var _found = false;
	for (var _d = 0; _d <= 256; _d += 16) {
		var _xr = _x + _d;
		if (tilemap_get_at_pixel(_tm, _xr, _y) != 0) { _gate_x = _xr; _found = true; break; }

		var _xl = _x - _d;
		if (tilemap_get_at_pixel(_tm, _xl, _y) != 0) { _gate_x = _xl; _found = true; break; }
	}

	if (!_found) exit;

	for (var _yy = _y - _half_h; _yy <= _y + _half_h; _yy += 16) {
		for (var _xx = _gate_x - _half_w; _xx <= _gate_x + _half_w; _xx += 16) {
			tilemap_set_at_pixel(_tm, _xx, _yy, 0);
		}
	}
}