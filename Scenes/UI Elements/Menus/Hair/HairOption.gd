extends "res://Scenes/UI Elements/Scripts/ClickableItem.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_hair_back():
	return get_node(".").texture
	
func get_hair_front():
	return get_node("Hair Front Option").texture
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
