extends "res://Scenes/UI Elements/Scripts/ClickableItem.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal self_modulate_changed(path)

# Called when the node enters the scene tree for the first time.
func _ready():
	var picker = get_node("Popup/ColorPicker")
	picker.set_size(Vector2(50, 50))
	
	# Hide color bar
	#picker.get_child(1).get_child(0).set_visible(false)
	
	# Hide RGB sliders
	picker.get_child(4).get_child(0).set_visible(false)
	picker.get_child(4).get_child(1).set_visible(false)
	picker.get_child(4).get_child(2).set_visible(false)
	
	# Hide HSV/Raw switches
	picker.get_child(4).get_child(4).get_child(0).set_visible(false)
	picker.get_child(4).get_child(4).get_child(1).set_visible(false)
	
	get_node(".").connect("item_clicked", self, "show_popup")
	get_node("Popup/ColorPicker").connect("color_changed", self, "change_color")
	
func show_popup(path):
	get_node("Popup").popup()
	var picker = get_node("Popup/ColorPicker")
	picker.set_size(Vector2(50, 50))
	
func change_color(color):
	set_self_modulate(color)
	emit_signal("self_modulate_changed", self.get_path())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
