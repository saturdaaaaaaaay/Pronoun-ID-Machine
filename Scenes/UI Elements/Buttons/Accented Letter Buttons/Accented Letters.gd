extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Case Change Button").connect("item_clicked", self, "change_case")
	
func change_case(path):
	print("clicked")
	var lowercase_letters = get_node("Letter Buttons/Lowercase Letters")
	var uppercase_letters = get_node("Letter Buttons/Uppercase Letters")
	
	lowercase_letters.set_visible(not lowercase_letters.is_visible())
	uppercase_letters.set_visible(not uppercase_letters.is_visible())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
