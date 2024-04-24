extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)
	get_node("Head Menu/Color Squares/Color Square 1").connect("item_clicked", self, "_switch_color")
	get_node("Head Menu/Color Squares/Color Square 2").connect("item_clicked", self, "_switch_color")
	get_node("Head Menu/Color Squares/Color Square 3").connect("item_clicked", self, "_switch_color")
	
	get_node("Head Menu/Head Options/Diamond Head Option").connect("item_clicked", self, "_switch_head")
	get_node("Head Menu/Head Options/Square Head Option").connect("item_clicked", self, "_switch_head")
	get_node("Head Menu/Head Options/Wider Head Option").connect("item_clicked", self, "_switch_head")
	
	get_node("Mouth Menu/Mouth Options/Mouth Option 1").connect("item_clicked", self, "_switch_mouth")
	get_node("Mouth Menu/Mouth Options/Mouth Option 2").connect("item_clicked", self, "_switch_mouth")
	
	get_node("Head Menu/Color Squares/Download").connect("item_clicked", self, "_download_file")
	
func _switch_color(path):
	var color = get_node(path).get_self_modulate()
	
	get_node("Avatar Image/Head").set_self_modulate(color)
	get_node("Avatar Image/Ears").set_self_modulate(color)
	get_node("Avatar Image/Torso").set_self_modulate(color)
	
func _switch_head(path):
	var texture = get_node(path).texture
	get_node("Avatar Image/Head").texture = texture
		
func _switch_mouth(path):
	var texture = get_node(path).texture
	get_node("Avatar Image/Mouth").texture = texture
	
func _get_skin_features():
	for child in get_children():
		print(child)
		print( child.is_class("Skin Feature"))
		
func _download_file(path):
	get_node("Background Color").hide()
	
	var position = get_node("Avatar Image/Avatar Rectangle").rect_position
	var size = get_node("Avatar Image/Avatar Rectangle").rect_size
	var rect_crop = Rect2(position, size)
	yield(VisualServer, "frame_post_draw")
	var img = self.get_viewport().get_texture().get_data().get_rect(rect_crop)
	img.flip_y()
	img.save_png("res://screenshot.png")
	var buf = img.save_png_to_buffer()
	JavaScript.download_buffer(buf,"screenshot"+".png")
	
	get_node("Background Color").show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
