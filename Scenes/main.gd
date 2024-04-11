extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var skin_features = []

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)
	_get_skin_features()
	get_node("Color Squares/Color Square 1").connect("item_clicked", self, "_clicked")
	get_node("Color Squares/Color Square 2").connect("item_clicked", self, "_clicked")
	get_node("Color Squares/Download").connect("item_clicked", self, "Download_File")
	
func _clicked(path):
	var color = get_node(path).get_self_modulate()
	
	get_node("Avatar Image/Heads/Wider Head").set_self_modulate(color)
	get_node("Avatar Image/Heads/Square Head").set_self_modulate(color)
	get_node("Avatar Image/Heads/Diamond Head").set_self_modulate(color)
	get_node("Avatar Image/Ears").set_self_modulate(color)
	get_node("Avatar Image/Torso").set_self_modulate(color)
	
func _get_skin_features():
	for child in get_children():
		print(child)
		print( child.is_class("Skin Feature"))
		
func Download_File(path):
	var position = get_node("Avatar Rectangle").rect_position
	var size = get_node("Avatar Rectangle").rect_size
	var rect_crop = Rect2(position, size)
	var img = self.get_viewport().get_texture().get_data().get_rect(rect_crop)
	img.flip_y()
	img.save_png("res://screenshot.png")
	var buf = img.save_png_to_buffer()
	JavaScript.download_buffer(buf,"screenshot"+".png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
