extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorPickerButton").connect("color_changed", self, "change_color")
	
func change_color(color):
	get_node("Color Squares/Color Square 15").set_self_modulate(color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
