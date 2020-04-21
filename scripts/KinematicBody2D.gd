extends KinematicBody2D

const up = Vector2(0, -1)
const acceleration = 10
const gravity = 50
const maxspeed = 500
const jumpHeight = -1000

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("moveRight"):
		motion.x = min(motion.x+acceleration, maxspeed)
	elif Input.is_action_pressed("moveLeft"):
		motion.x = max(motion.x-acceleration, -maxspeed)
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = jumpHeight
			
	motion = move_and_slide(motion, up)
	pass

