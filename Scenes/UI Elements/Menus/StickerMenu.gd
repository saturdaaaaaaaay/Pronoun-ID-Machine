extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal sticker_dropped(path)

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_node("Sticker Options").get_children():
		child.connect("item_clicked", self, "drag_sticker")
		
	get_node("Drag Sticker").connect("item_unclicked", self, "drop_sticker")

func drag_sticker(path):
	var new_texture = get_node(path).get_texture()
	var cursor = get_node("Drag Sticker")
	cursor.set_texture(new_texture)
	cursor.show()
	
func drop_sticker(path):
	get_node("Drag Sticker").hide()
	emit_signal("sticker_dropped", path)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
