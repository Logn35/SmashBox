extends KinematicBody2D
# v that is supposed to read "base_class" but i cant be bothered to change it
class_name bass_class

# make speed and shit and make it changeable on the inspector
export var speed: = Vector2(100.0, 1000.0)
export var gravity: = 3000.0

# velocity garbage ill remake this later
var velocity: = Vector2.ZERO

# run the physics processing every frame update
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
