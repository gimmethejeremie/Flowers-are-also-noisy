puzzle_id    = 1;
active       = false;
solved       = false;
correct_seq  = [2, 4, 1, 3, 2]; // 1=Trái 2=Phải 3=Lên 4=Xuống
player_seq   = [];
show_index   = 0;
show_timer   = 0;
show_delay   = 45;
phase        = 0; // 0 = đang phát chuỗi, 1 = chờ P1 nhập
current_hint = ""; // hiện lên màn để test
p1_nearby = false;