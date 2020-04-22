extends KinematicBody2D

const up = Vector2(0, -1)
const acceleration = 90
const gravity = 50
const maxspeed = 400
const jumpHeight = -1000
export var active = true

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+acceleration, maxspeed)
		$"Character Sprite".flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-acceleration, -maxspeed)
		$"Character Sprite".flip_h = true
	else:
		$"Character Sprite".play("Idle")
		friction = true
		
	if is_on_floor():
		$"Character Sprite".play("Idle")
		if Input.is_action_pressed("ui_up"):
			motion.y = jumpHeight
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
			
	else:
		if motion.y < 0:
			$"Character Sprite".play("Jump")
		else:
			$"Character Sprite".play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		if motion.y == 0.1:
			$"Character Sprite".play("Land")
			
	
	motion = move_and_slide(motion, up)
	pass

func _on_VisibilityNotifier2D_screen_entered():
	active = true

func _on_VisibilityNotifier2D_screen_exited():
	active = false
