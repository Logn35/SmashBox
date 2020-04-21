extends KinematicBody2D

const up = Vector2(0, -1)
const gravity = 500
const speed = 500
const jumpHeight = -10000

var motion = Vector2()

func _physics_process(delta):
	motion.y =+ gravity
	
	if Input.is_action_pressed("moveRight"):
		motion.x = speed
	elif Input.is_action_pressed("moveLeft"):
		motion.x = -speed
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = jumpHeight
			
	motion = move_and_slide(motion, up)
	pass

