extends "res://Scenes/UI Elements/Scripts/ClickableItem.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func copy(sticker):
	var collision_shape = self.get_collision_shape()
	var new_collision_shape = sticker.get_collision_shape()
	new_collision_shape.set_scale(collision_shape.get_scale())
	new_collision_shape.set_position(collision_shape.get_position())
	sticker.set_texture(self.get_texture())
	sticker.set_global_scale(self.get_global_scale())
	
func get_collision_shape():
	return self.get_child(0).get_child(0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
