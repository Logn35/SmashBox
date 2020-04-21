extends bass_class

func _physics_process(delta: float) -> void:
	var direction: = Vector2(
			Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft"),
			0.0
	)
	velocity = speed * direction


func _input(event):
	if event.is_action_pressed("jump"):
		speed_y = -jumpForce
	pass
