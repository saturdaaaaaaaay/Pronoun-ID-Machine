extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var FACE_MENU = "Face Menu"
var HAIR_INCREMENT = 100
var HAIR_TOP = -90
var HAIR_BOTTOM = 10
var EARRINGS_INCREMENT = 90
var EARRINGS_TOP = -290
var EARRINGS_BOTTOM = -200

var current_menu = null


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Menus/Hair Menu/Down Arrow").connect("item_clicked", self, "hair_scroll_down")
	get_node("Menus/Hair Menu/Up Arrow").connect("item_clicked", self, "hair_scroll_up")
	get_node("Menus/Earrings Menu/Down Arrow").connect("item_clicked", self, "earrings_scroll_down")
	get_node("Menus/Earrings Menu/Up Arrow").connect("item_clicked", self, "earrings_scroll_up")
	current_menu = FACE_MENU

func show_menu(menu):
	if menu == current_menu:
		return
	get_node("Menus/" + current_menu).hide()
	get_node("Menus/" + menu).show()
	current_menu = menu

func scroll_down(path, bottom, top, increment, menu):
	var child_total = get_node(path).get_child_count()
	if get_node(path).get_child(child_total-1).get_position().y == bottom:
		return
	for child in get_node(path).get_children():
		child.translate(Vector2(0, -increment))
		toggle_visibility(child, top, bottom)
		
	update_arrow(menu, top, bottom)
	
func scroll_up(path, bottom, top, increment, menu):
	if get_node(path).get_child(0).get_position().y == top:
		return
	for child in get_node(path).get_children():
		child.translate(Vector2(0, increment))
		toggle_visibility(child, top, bottom)
		
	update_arrow(menu, top, bottom)

func hair_scroll_down(path):
	scroll_down("Menus/Hair Menu/Hair Options", HAIR_BOTTOM, HAIR_TOP, HAIR_INCREMENT, "Hair")
	
func hair_scroll_up(path):
	scroll_up("Menus/Hair Menu/Hair Options", HAIR_BOTTOM, HAIR_TOP, HAIR_INCREMENT, "Hair")
	
func earrings_scroll_down(path):
	scroll_down("Menus/Earrings Menu/Earrings Options", EARRINGS_BOTTOM, EARRINGS_TOP, EARRINGS_INCREMENT, "Earrings")
	
func earrings_scroll_up(path):
	scroll_up("Menus/Earrings Menu/Earrings Options", EARRINGS_BOTTOM, EARRINGS_TOP, EARRINGS_INCREMENT, "Earrings")
		
func toggle_visibility(child, top, bottom):
	var position = child.get_position().y
	if position < top or position > bottom:
		child.hide()
	else:
		child.show()
		
func update_arrow(menu, top, bottom):
	var options = "Menus/" + menu + " Menu/" + menu + " Options"
	if get_node(options).get_child(0).get_position().y == top:
		get_node("Menus/" + menu + " Menu/Up Arrow").set_self_modulate(Color(1, 1, 1, 0.392157))
	else:
		get_node("Menus/" + menu + " Menu/Up Arrow").set_self_modulate(Color(1, 1, 1, 1))
		
	var hair_total = get_node(options).get_child_count()
	if get_node(options).get_child(hair_total-1).get_position().y == bottom:
		get_node("Menus/" + menu + " Menu/Down Arrow").set_self_modulate(Color(1, 1, 1, 0.392157))
	else:
		get_node("Menus/" + menu + " Menu/Down Arrow").set_self_modulate(Color(1, 1, 1, 1))
		
func set_input_pickable(pickable):
	get_node("Menus/" + current_menu).set_input_pickable(pickable)
	get_node("Menus/Hair Menu/Up Arrow").set_input_pickable(pickable)
	get_node("Menus/Hair Menu/Down Arrow").set_input_pickable(pickable)
	get_node("Menus/Earrings Menu/Up Arrow").set_input_pickable(pickable)
	get_node("Menus/Earrings Menu/Down Arrow").set_input_pickable(pickable)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
