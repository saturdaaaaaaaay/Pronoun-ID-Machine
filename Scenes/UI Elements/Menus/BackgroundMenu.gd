extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var FAR_LEFT = 0
var FAR_RIGHT = 800
var INCREMENT = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Left Arrow").connect("item_clicked", self, "move_left")
	get_node("Right Arrow").connect("item_clicked", self, "move_right")

func move_left(path):
	if get_node("Background Options").get_child(0).get_position().x == FAR_LEFT:
		return
	for child in get_node("Background Options").get_children():
		child.translate(Vector2(INCREMENT, 0))
		var position = child.get_position().x
		if position < FAR_LEFT or position > FAR_RIGHT:
			child.hide()
		else:
			child.show()
		
	update_arrows()
	
func move_right(path):
	var tab_total = get_node("Background Options").get_child_count()
	if get_node("Background Options").get_child(tab_total-1).get_position().x == FAR_RIGHT:
		return
	for child in get_node("Background Options").get_children():
		child.translate(Vector2(-INCREMENT, 0))
		var position = child.get_position().x
		if position < FAR_LEFT or position > FAR_RIGHT:
			child.hide()
		else:
			child.show()
			
	update_arrows()

func update_arrows():
	if get_node("Background Options").get_child(0).get_position().x == FAR_LEFT:
		get_node("Left Arrow").set_self_modulate(Color(1, 1, 1, 0.392157))
	else:
		get_node("Left Arrow").set_self_modulate(Color(1, 1, 1, 1))
		
	var tab_total = get_node("Background Options").get_child_count()
	if get_node("Background Options").get_child(tab_total-1).get_position().x == FAR_RIGHT:
		get_node("Right Arrow").set_self_modulate(Color(1, 1, 1, 0.392157))
	else:
		get_node("Right Arrow").set_self_modulate(Color(1, 1, 1, 1))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
