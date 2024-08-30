extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)
	for child in get_node("Old Head Menu/Color Squares").get_children():
		if child == get_node("Old Head Menu/Color Squares/Download"):
			child.connect("item_clicked", self, "_download_file")
		else:
			child.connect("item_clicked", self, "_switch_color")
	
	for child in get_node("Old Head Menu/Head Options").get_children():
		child.connect("item_clicked", self, "_switch_head")
	
	for child in get_node("Old Mouth Menu/Mouth Options").get_children():
		child.connect("item_clicked", self, "_switch_mouth")
		
	for child in get_node("Old Eyes Menu/Eyes Options").get_children():
		child.connect("item_clicked", self, "_switch_eyes")
	
func _switch_color(path):
	var color = get_node(path).get_self_modulate()
	
	for child in get_node("Avatar Image/Skin Features").get_children():
		child.set_self_modulate(color)
	
func _switch_head(path):
	var texture = get_node(path).texture
	get_node("Avatar Image/Skin Features/Head").texture = texture
		
func _switch_mouth(path):
	var texture = get_node(path).texture
	get_node("Avatar Image/Mouth").texture = texture
	
func _switch_eyes(path):
	var texture = get_node(path).texture
	get_node("Avatar Image/Eyes").texture = texture
		
func _download_file(path):
	get_node("Background Color").hide()
	var screen_cap_region = get_node("Avatar Image/Avatar Rectangle")
	var screen_cap_position = screen_cap_region.rect_position
	var screen_cap_size = screen_cap_region.rect_size
	var rect_crop = Rect2(screen_cap_position, screen_cap_size)
	yield(VisualServer, "frame_post_draw")
	
	var viewport_capture = get_viewport().get_texture().get_data()
	var img = viewport_capture.get_rect(rect_crop)
	img = img.get_rect(img.get_used_rect())
	
	img.flip_y()
	img.save_png("res://screenshot.png")
	img.save_png("user://screenshot.png")
	var buf = img.save_png_to_buffer()
	if OS.has_feature('JavaScript'):
		JavaScript.download_buffer(buf,"screenshot"+".png")
		
	get_node("Badge").show()
	var image_to_texture = ImageTexture.new()
	image_to_texture.create_from_image(img)
	get_node("Badge/Badge Photo").texture = image_to_texture
		
	get_node("Background Color").show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
