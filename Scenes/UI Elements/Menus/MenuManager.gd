extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var FACE_MENU = "Face Menu"

var current_menu = null


# Called when the node enters the scene tree for the first time.
func _ready():
	current_menu = FACE_MENU

func show_menu(menu):
	if menu == current_menu:
		return
	get_node(current_menu).hide()
	get_node(menu).show()
	current_menu = menu

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
