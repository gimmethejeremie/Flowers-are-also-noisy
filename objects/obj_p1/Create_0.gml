spd             = 2.5;
held_item       = "";
captured        = false;
capture_timer   = 0;
movement_locked = false;
auto_walking    = false;
auto_walk_target_x = 0;
auto_walk_target_y = 0;
rescued_dialogue_played = false;

if (global.return_from_puzzle) {
	x = global.return_x;
	y = global.return_y;
	global.return_from_puzzle = false;

	if (global.pending_wall_open && instance_exists(obj_game_manager)) {
		obj_game_manager.open_walls_near(global.pending_wall_x, global.pending_wall_y, 64, 96);
		global.pending_wall_open = false;
	}

	if (global.pending_dialogue_id != "" && instance_exists(obj_dialogue_manager)) {
		obj_dialogue_manager.queue_dialogue(global.pending_dialogue_id);
		global.pending_dialogue_id = "";
	}
}