extends KinematicBody2D

const up = Vector2(0, -1)

#Stats
const acceleration = 99
const gravity = 50
const maxspeed = 400
const jumpHeight = -1000

var jumpCount = 0

var motion = Vector2()

	#Particles
const d_dash = preload("res://Game Engine Objects/Dust Particles/Dust Dash.tscn")

func _physics_process(delta):
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("moveRight"):
		motion.x = min(motion.x+acceleration, maxspeed)
		$"Character Sprite".flip_h = false
	elif Input.is_action_pressed("moveLeft"):
		motion.x = max(motion.x-acceleration, -maxspeed)
		$"Character Sprite".flip_h = true
	else:
		$"Character Sprite".play("Idle")
		friction = true
		
	if is_on_floor():
		jumpCount = 0
		$"Character Sprite".play("Idle")
		if Input.is_action_pressed("ui_select"):
			if jumpCount < 2:
				jumpCount += 1
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


