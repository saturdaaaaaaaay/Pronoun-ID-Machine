extends Node2D

signal character_complete(path)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var color_mouths = ["Mouth 3 Option"]
var color_head_accessories = ["Baseball Cap Option"]
var current_face = "Diamond Face Option"
var current_beard = "None"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Viewport/Character Stage/Background").hide()
	
	get_node("Option Tabs").connect(
		"tab_switched", get_node("Menu Manager"), "show_menu"
	)
	
	for child in get_node("Menu Manager/Menus/Face Menu/Face Options").get_children():
		child.connect("item_clicked", self, "switch_face")
		
	for child in get_node(
		"Menu Manager/Menus/Face Menu/Skin Color Options/Color Squares"
	).get_children():
		child.connect("item_clicked", self, "switch_skin_color")
		
	get_node(
		"Menu Manager/Menus/Face Menu/Skin Color Options/Color Squares/Color Picker Square"
	).connect("self_modulate_changed", self, "switch_skin_color")
		
	for child in get_node("Menu Manager/Menus/Eyes Menu").get_children():
		child.connect("item_clicked", self, "switch_eyes")
		
	for child in get_node("Menu Manager/Menus/Nose Menu").get_children():
		child.connect("item_clicked", self, "switch_nose")
		
	for child in get_node("Menu Manager/Menus/Mouth Menu/Mouth Options").get_children():
		child.connect("item_clicked", self, "switch_mouth")
		
	for child in get_node("Menu Manager/Menus/Mouth Menu/Mouth Color Options/Color Squares").get_children():
		child.connect("item_clicked", self, "switch_mouth_color")
		
	for child in get_node("Menu Manager/Menus/Eyebrows Menu").get_children():
		child.connect("item_clicked", self, "switch_eyebrows")
		
	for child in get_node("Menu Manager/Menus/Hair Menu/Hair Options").get_children():
		child.connect("item_clicked", self, "switch_hair")
		
	for child in get_node(
		"Menu Manager/Menus/Hair Menu/Hair Color Options/Color Squares"
	).get_children():
		child.connect("item_clicked", self, "switch_hair_color")
		
	get_node(
		"Menu Manager/Menus/Hair Menu/Hair Color Options/Color Squares/Color Picker Square"
	).connect("self_modulate_changed", self, "switch_hair_color")
		
	for child in get_node(
		"Menu Manager/Menus/Clothes Menu/Clothes Options"
	).get_children():
		child.connect("item_clicked", self, "switch_clothes")
		
	for child in get_node(
		"Menu Manager/Menus/Clothes Menu/Clothes Color Options/Color Squares"
	).get_children():
		child.connect("item_clicked", self, "switch_clothes_colors")
		
	get_node(
		"Menu Manager/Menus/Clothes Menu/Clothes Color Options/Color Squares/Color Picker Square"
	).connect("self_modulate_changed", self, "switch_clothes_colors")
	
	for child in get_node(
		"Menu Manager/Menus/Head Accessories Menu/Head Accessories Options"
	).get_children():
		child.connect("item_clicked", self, "switch_head_accessories")
		
	for child in get_node(
		"Menu Manager/Menus/Head Accessories Menu/Head Accessories Color Options/Color Squares"
	).get_children():
		child.connect("item_clicked", self, "switch_head_accessories_colors")
		
	get_node(
		"Menu Manager/Menus/Head Accessories Menu/Head Accessories Color Options/Color Squares/Color Picker Square"
	).connect("self_modulate_changed", self, "switch_head_accessories_colors")
		
	for child in get_node(
		"Menu Manager/Menus/Face Accessories Menu/Face Accessories Options"
	).get_children():
		child.connect("item_clicked", self, "switch_face_accessories")
		
	for child in get_node(
		"Menu Manager/Menus/Face Accessories Menu/Face Accessories Color Options/Color Squares"
	).get_children():
		child.connect("item_clicked", self, "switch_face_accessories_color")
		
	get_node(
		"Menu Manager/Menus/Face Accessories Menu/Face Accessories Color Options/Color Squares/Color Picker Square"
	).connect("self_modulate_changed", self, "switch_face_accessories_color")
		
	for child in get_node(
		"Menu Manager/Menus/Glasses Menu/Glasses Options"
	).get_children():
		child.connect("item_clicked", self, "switch_glasses")
		
	for child in get_node(
		"Menu Manager/Menus/Glasses Menu/Glasses Color Options/Color Squares"
	).get_children():
		child.connect("item_clicked", self, "switch_glasses_color")
		
	get_node(
		"Menu Manager/Menus/Glasses Menu/Glasses Color Options/Color Squares/Color Picker Square"
	).connect("self_modulate_changed", self, "switch_glasses_color")
	
	for child in get_node(
		"Menu Manager/Menus/Earrings Menu/Earrings Options"
	).get_children():
		child.connect("item_clicked", self, "switch_earrings")
		
	for child in get_node(
		"Menu Manager/Menus/Earrings Menu/Earrings Color Options/Color Squares"
	).get_children():
		child.connect("item_clicked", self, "switch_earrings_color")
		
	get_node(
		"Menu Manager/Menus/Earrings Menu/Earrings Color Options/Color Squares/Color Picker Square"
	).connect("self_modulate_changed", self, "switch_earrings_color")
	
	for child in get_node(
		"Menu Manager/Menus/Facial Hair Menu/Facial Hair Options"
	).get_children():
		child.connect("item_clicked", self, "switch_facial_hair")
		
	for child in get_node(
		"Menu Manager/Menus/Facial Hair Menu/Facial Hair Color Options/Color Squares"
	).get_children():
		child.connect("item_clicked", self, "switch_facial_hair_color")
		
	get_node(
		"Menu Manager/Menus/Facial Hair Menu/Facial Hair Color Options/Color Squares/Color Picker Square"
	).connect("self_modulate_changed", self, "switch_facial_hair_color")
	
func switch_face(path):
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Skin Features/Head").set_texture(
		new_texture
	)
	get_node("Viewport/Character Stage/Features/Skin Features/Head").set_texture(
		new_texture
	)
	current_face = get_node(path).name
	if current_beard == "Short Beard Option":
		switch_facial_hair("Menu Manager/Menus/Facial Hair Menu/Facial Hair Options/Short Beard Option")
	
func switch_skin_color(path):
	var color = get_node(path).get_self_modulate()
	for child in get_node(
		"Character Stage/Features/Skin Features"
	).get_children():
		child.set_self_modulate(color)
	
func switch_eyes(path):
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Eyes").set_texture(new_texture)

func switch_nose(path):
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Nose").set_texture(new_texture)
	
func switch_mouth(path):
	var new_texture = get_node(path).texture
	var color = get_node(path).get_self_modulate()
	var name = get_node(path).name
	var show_colors = false
	get_node("Character Stage/Features/Mouth").set_texture(new_texture)
	
	if name in color_mouths:
		show_colors = true
		
	get_node("Character Stage/Features/Mouth").set_self_modulate(color)
	get_node("Menu Manager/Menus/Mouth Menu/Mouth Color Options").set_visible(show_colors)
	
func switch_mouth_color(path):
	var color = get_node(path).get_self_modulate()
	get_node("Character Stage/Features/Mouth").set_self_modulate(color)
	
func switch_eyebrows(path):
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Eyebrows").set_texture(new_texture)
	
func switch_hair(path):
	if get_node(path).name == "Clear Button":
		get_node("Character Stage/Features/Hair Back").hide()
		get_node("Character Stage/Features/Hair Front").hide()
		return
	get_node("Character Stage/Features/Hair Back").show()
	get_node("Character Stage/Features/Hair Front").show()
	var new_texture_back = get_node(path).get_hair_back()
	var new_texture_front = get_node(path).get_hair_front()
	get_node("Character Stage/Features/Hair Back").set_texture(
		new_texture_back
	)
	get_node("Character Stage/Features/Hair Front").set_texture(
		new_texture_front
	)
	
func switch_hair_color(path):
	var color = get_node(path).get_self_modulate()
	get_node("Character Stage/Features/Hair Back").set_self_modulate(color)
	get_node("Character Stage/Features/Hair Front").set_self_modulate(color)
	
func switch_clothes(path):
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Clothes").set_texture(new_texture)
	var extra_clothes = null
	for child in get_node(path).get_children():
		if child.name == "Extra Clothes Component":
			extra_clothes = child
	if extra_clothes:
		var extra_texture = extra_clothes.texture
		get_node("Character Stage/Features/Extra Clothes").set_texture(
			extra_texture
		)
		get_node("Character Stage/Features/Extra Clothes").show()
	else:
		get_node("Character Stage/Features/Extra Clothes").hide()
	
func switch_clothes_colors(path):
	var color = get_node(path).get_self_modulate()
	get_node("Character Stage/Features/Clothes").set_self_modulate(color)
	
func switch_head_accessories(path):
	var name = get_node(path).name
	if name == "Clear Button":
		get_node("Character Stage/Features/Head Accessory").hide()
		return
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Head Accessory").show()
	get_node("Character Stage/Features/Head Accessory").set_texture(new_texture)
	var show_colors = false
	if name in color_head_accessories:
		show_colors = true
	else:
		get_node("Character Stage/Features/Head Accessory").set_self_modulate(Color( 1, 1, 1, 1 ))
	get_node("Menu Manager/Menus/Head Accessories Menu/Head Accessories Color Options").set_visible(show_colors)
	
func switch_head_accessories_colors(path):
	var color = get_node(path).get_self_modulate()
	get_node("Character Stage/Features/Head Accessory").set_self_modulate(color)
	
func switch_face_accessories(path):
	if get_node(path).name == "Clear Button":
		get_node("Character Stage/Features/Face Accessory").hide()
		return
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Face Accessory").show()
	get_node("Character Stage/Features/Face Accessory").set_texture(new_texture)
	
func switch_face_accessories_color(path):
	var color = get_node(path).get_self_modulate()
	get_node("Character Stage/Features/Face Accessory").set_self_modulate(color)
	
func switch_glasses(path):
	if get_node(path).name == "Clear Button":
		get_node("Character Stage/Features/Glasses").hide()
		return
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Glasses").show()
	get_node("Character Stage/Features/Glasses").set_texture(new_texture)
	
func switch_glasses_color(path):
	var color = get_node(path).get_self_modulate()
	get_node("Character Stage/Features/Glasses").set_self_modulate(color)
	
func switch_earrings(path):
	if get_node(path).name == "Clear Button":
		get_node("Character Stage/Features/Earrings").hide()
		return
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Earrings").show()
	get_node("Character Stage/Features/Earrings").set_texture(new_texture)
	
func switch_earrings_color(path):
	var color = get_node(path).get_self_modulate()
	get_node("Character Stage/Features/Earrings").set_self_modulate(color)
	
func switch_facial_hair(path):
	if get_node(path).name == "Clear Button":
		get_node("Character Stage/Features/Facial Hair").hide()
		current_beard = "None"
		return

	get_node("Character Stage/Features/Facial Hair").show()
	current_beard = get_node(path).name
	
	if get_node(path).name == "Short Beard Option":
		path = "Menu Manager/Menus/Facial Hair Menu/Facial Hair Options/Short Beard Option/" + current_face
	var new_texture = get_node(path).texture
	get_node("Character Stage/Features/Facial Hair").set_texture(new_texture)
	
func switch_facial_hair_color(path):
	var color = get_node(path).get_self_modulate()
	get_node("Character Stage/Features/Facial Hair").set_self_modulate(color)
	
func export_image(path):
	print("exporting image")
	get_node("Viewport/Character Stage/Background").hide()
	var image = get_node("Viewport").get_texture().get_data()
	image = image.get_rect(image.get_used_rect())
	
	image.save_png("res://screenshot.png")
	var buf = image.save_png_to_buffer()
	if OS.has_feature('JavaScript'):
		JavaScript.download_buffer(buf,"screenshot"+".png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
