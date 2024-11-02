extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_input_pickable(pickable):
	for child in get_node(".").get_children():
		if "Color Options" in child.name:
			for square in get_node(child.name + "/Color Squares").get_children():
				square.set_input_pickable(pickable)
		elif "Options" in child.name:
			for option in child.get_children():
				option.set_input_pickable(pickable)
		else:
			child.set_input_pickable(pickable)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
