extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var non_color_backgrounds = ["Clocktower Colored Background Option"]


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_node("Tabs").get_children():
		child.connect("item_clicked", self, "switch_tabs")
	get_node("Sticker Menu").connect("sticker_dropped", self, "attach_sticker")
	for child in get_node("Background Menu/Background Options").get_children():
		child.connect("item_clicked", self, "switch_background")
	for child in get_node("Background Menu/Background Color Options/Color Squares").get_children():
		child.connect("item_clicked", self, "switch_background_color")
		
func switch_tabs(path):
	var tab = get_node(path)
	tab.set_self_modulate(Color(1, 0.682353, 0.533333))
	var inactive_tab = null
	if tab.name == "Stickers Tab":
		inactive_tab = get_node("Tabs/Backgrounds Tab")
		get_node("Sticker Panel").show()
		get_node("Sticker Menu").show()
		get_node("Backgrounds Panel").hide()
		get_node("Background Menu").hide()
	else:
		inactive_tab = get_node("Tabs/Stickers Tab")
		get_node("Backgrounds Panel").show()
		get_node("Background Menu").show()
		get_node("Sticker Panel").hide()
		get_node("Sticker Menu").hide()
	inactive_tab.set_self_modulate(Color(0.956863, 0.396078, 0.141176))
	
func attach_sticker(path):
	var sticker = preload("res://Scenes/UI Elements/Menus/PlacedSticker.tscn").instance()
	var texture = get_node(path).get_texture()
	var position = get_viewport().get_mouse_position()
	var margin = get_node("MarginContainer")
	var margin_left = margin.margin_left
	var margin_right = margin.margin_right
	var margin_top = margin.margin_top
	var margin_bottom = margin.margin_bottom
	var mouse_x = position.x > margin_left and position.x < margin_right
	var mouse_y = position.y > margin_top and position.y < margin_bottom
	if mouse_x and mouse_y:
		get_node("ID Badge/Stickers").add_child(sticker)
		sticker.set_texture(texture)
		sticker.set_global_position(position)
		sticker.set_global_scale(Vector2(.5, .5))
		sticker.connect("item_clicked", self, "move_sticker")
		
func move_sticker(path):
	if get_node("Sticker Menu").is_visible():
		get_node(path).queue_free()
		get_node("Sticker Menu").drag_sticker(path)
		
func switch_background(path):
	var texture = get_node(path).get_texture()
	var name = get_node(path).name
	get_node("ID Badge/Background").set_texture(texture)
	var show_colors = true
	if name in non_color_backgrounds:
		show_colors = false
		get_node("ID Badge/Background").set_self_modulate(Color( 1, 1, 1, 1 ))
	else:
		switch_background_color(path)
	get_node("Background Menu/Background Color Options").set_visible(show_colors)
		
func switch_background_color(path):
	var self_modulate = get_node(path).get_self_modulate()
	get_node("ID Badge/Background").set_self_modulate(self_modulate)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
