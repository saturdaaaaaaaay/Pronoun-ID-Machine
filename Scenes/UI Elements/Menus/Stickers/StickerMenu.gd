extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var FAR_LEFT = 50
var FAR_RIGHT = 450
var INCREMENT = 100
signal sticker_dropped(path)

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_node("Sticker Options/Smaller Stickers").get_children():
		child.connect("item_clicked", self, "drag_sticker")
	for child in get_node("Sticker Options/Bigger Stickers").get_children():
		child.connect("item_clicked", self, "drag_sticker")
		
	get_node("Drag Sticker").connect("item_unclicked", self, "drop_sticker")
	
	get_node("Left Arrow").connect("item_clicked", self, "move_left")
	get_node("Right Arrow").connect("item_clicked", self, "move_right")

func drag_sticker(path):
	var chosen_sticker = get_node(path)
	var collision_position = chosen_sticker.get_child(0).get_child(0).get_position()
	var collision_scale = chosen_sticker.get_child(0).get_child(0).get_scale()
	var scale = chosen_sticker.get_global_scale()
	var new_texture = chosen_sticker.get_texture()
	var cursor = get_node("Drag Sticker")
	#cursor.get_child(0).get_child(0).set_position(collision_position)
	#cursor.get_child(0).get_child(0).set_scale(collision_scale)
	#cursor.set_texture(new_texture)
	#cursor.set_global_scale(scale)
	chosen_sticker.copy(cursor)
	cursor.show()
	
func drop_sticker(path):
	get_node("Drag Sticker").hide()
	emit_signal("sticker_dropped", path)
	
func move_left(path):
	if get_node("Sticker Options/Bigger Stickers").get_child(0).get_position().x == FAR_LEFT:
		return
	for child in get_node("Sticker Options/Bigger Stickers").get_children():
		child.translate(Vector2(INCREMENT, 0))
		var position = child.get_position().x
		if position < FAR_LEFT or position > FAR_RIGHT:
			child.hide()
		else:
			child.show()
		
	update_arrows()
	
func move_right(path):
	var tab_total = get_node("Sticker Options/Bigger Stickers").get_child_count()
	if get_node("Sticker Options/Bigger Stickers").get_child(tab_total-1).get_position().x == FAR_RIGHT:
		return
	for child in get_node("Sticker Options/Bigger Stickers").get_children():
		child.translate(Vector2(-INCREMENT, 0))
		var position = child.get_position().x
		if position < FAR_LEFT or position > FAR_RIGHT:
			child.hide()
		else:
			child.show()
			
	update_arrows()

func update_arrows():
	if get_node("Sticker Options/Bigger Stickers").get_child(0).get_position().x == FAR_LEFT:
		get_node("Left Arrow").set_self_modulate(Color(1, 1, 1, 0.392157))
	else:
		get_node("Left Arrow").set_self_modulate(Color(1, 1, 1, 1))
		
	var tab_total = get_node("Sticker Options/Bigger Stickers").get_child_count()
	if get_node("Sticker Options/Bigger Stickers").get_child(tab_total-1).get_position().x == FAR_RIGHT:
		get_node("Right Arrow").set_self_modulate(Color(1, 1, 1, 0.392157))
	else:
		get_node("Right Arrow").set_self_modulate(Color(1, 1, 1, 1))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
