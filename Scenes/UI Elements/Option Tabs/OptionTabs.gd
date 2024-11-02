extends Node2D

signal tab_switched(path)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var FAR_LEFT = 0
var FAR_RIGHT = 575
var INCREMENT = 115
var FACE_MENU = "Face Menu"
var EYES_MENU = "Eyes Menu"
var NOSE_MENU = "Nose Menu"
var MOUTH_MENU = "Mouth Menu"
var EYEBROWS_MENU = "Eyebrows Menu"
var HAIR_MENU = "Hair Menu"
var CLOTHES_MENU = "Clothes Menu"
var HEAD_ACCESSORIES_MENU = "Head Accessories Menu"
var GLASSES_MENU = "Glasses Menu"
var FACE_ACCESSORIES_MENU = "Face Accessories Menu"
var EARRINGS_MENU = "Earrings Menu"
var FACIAL_HAIR_MENU = "Facial Hair Menu"

var active_tab = null

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Left Arrow").connect("item_clicked", self, "move_left")
	get_node("Right Arrow").connect("item_clicked", self, "move_right")
	for child in get_node("Tabs").get_children():
		child.connect("item_clicked", self, "set_tab_active")
	set_tab_active(get_node("Tabs").get_child(0).get_path())
	
func set_tab_active(path):
	if path == active_tab:
		return
	var tab = get_node(path)
	tab.set_self_modulate(Color(1, 0.682353, 0.533333))
	if active_tab:
		get_node(active_tab).set_self_modulate(Color(0.956863, 0.396078, 0.141176))
	active_tab = path
	
	var tab_name = tab.get_name()
	if tab_name == "Face Option Tab":
		emit_signal("tab_switched", FACE_MENU)
	if tab_name == "Eyes Option Tab":
		emit_signal("tab_switched", EYES_MENU)
	if tab_name == "Nose Option Tab":
		emit_signal("tab_switched", NOSE_MENU)
	if tab_name == "Mouth Option Tab":
		emit_signal("tab_switched", MOUTH_MENU)
	if tab_name == "Eyebrows Option Tab":
		emit_signal("tab_switched", EYEBROWS_MENU)
	if tab_name == "Hair Option Tab":
		emit_signal("tab_switched", HAIR_MENU)
	if tab_name == "Clothes Option Tab":
		emit_signal("tab_switched", CLOTHES_MENU)
	if tab_name == "Head Accessories Option Tab":
		emit_signal("tab_switched", HEAD_ACCESSORIES_MENU)
	if tab_name == "Glasses Option Tab":
		emit_signal("tab_switched", GLASSES_MENU)
	if tab_name == "Face Accessories Option Tab":
		emit_signal("tab_switched", FACE_ACCESSORIES_MENU)
	if tab_name == "Earrings Option Tab":
		emit_signal("tab_switched", EARRINGS_MENU)
	if tab_name == "Facial Hair Option Tab":
		emit_signal("tab_switched", FACIAL_HAIR_MENU)

func move_left(path):
	if get_node("Tabs").get_child(0).get_position().x == FAR_LEFT:
		return
	for child in get_node("Tabs").get_children():
		child.translate(Vector2(INCREMENT, 0))
		toggle_visibility(child)
			
	update_arrows()
	
func move_right(path):
	var tab_total = get_node("Tabs").get_child_count()
	if get_node("Tabs").get_child(tab_total-1).get_position().x == FAR_RIGHT:
		return
	for child in get_node("Tabs").get_children():
		child.translate(Vector2(-INCREMENT, 0))
		toggle_visibility(child)
		
	update_arrows()

func toggle_visibility(child):
	var position = child.get_position().x
	if position > FAR_RIGHT or position < FAR_LEFT:
		child.hide()
	else:
		child.show()

func update_arrows():
	if get_node("Tabs").get_child(0).get_position().x == FAR_LEFT:
		get_node("Left Arrow").set_self_modulate(Color(1, 1, 1, 0.392157))
	else:
		get_node("Left Arrow").set_self_modulate(Color(1, 1, 1, 1))
		
	var tab_total = get_node("Tabs").get_child_count()
	if get_node("Tabs").get_child(tab_total-1).get_position().x == FAR_RIGHT:
		get_node("Right Arrow").set_self_modulate(Color(1, 1, 1, 0.392157))
	else:
		get_node("Right Arrow").set_self_modulate(Color(1, 1, 1, 1))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
