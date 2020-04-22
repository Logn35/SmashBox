extends Camera2D

onready var camera1 = $"Camera2D2"

func _ready():
	camera1.target = get_node("TestCharacter2")
