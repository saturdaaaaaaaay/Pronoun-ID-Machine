extends "res://Scenes/UI Elements/Menus/Sticker.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.is_visible():
		var position = get_viewport().get_mouse_position()
		self.set_position(position)
