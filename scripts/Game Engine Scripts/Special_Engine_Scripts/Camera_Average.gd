extends Node
#Average of Player positions
#Reset the goal position
func Camera_Average():
	cam_x_goal = 0
	cam_y_goal = 0
	var _num_of_active_players = 0
	var _set = true
	var _player_max_x = 0
	var _player_min_x = 0
	var _player_max_y = 0
	var _player_min_y = 0
	
	#Get player positions
	
	
