extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_node("Tabs").get_children():
		child.connect("item_clicked", self, "switch_tabs")
		
func switch_tabs(path):
	var tab = get_node(path)
	tab.set_self_modulate(Color(1, 0.682353, 0.533333))
	var inactive_tab = null
	if tab.name == "Stickers Tab":
		inactive_tab = get_node("Tabs/Backgrounds Tab")
		get_node("Sticker Panel").show()
		get_node("Backgrounds Panel").hide()
	else:
		inactive_tab = get_node("Tabs/Stickers Tab")
		get_node("Backgrounds Panel").show()
		get_node("Sticker Panel").hide()
	inactive_tab.set_self_modulate(Color(0.956863, 0.396078, 0.141176))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
