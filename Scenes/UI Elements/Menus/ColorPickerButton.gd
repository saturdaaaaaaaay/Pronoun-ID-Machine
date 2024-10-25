extends ColorPickerButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var picker = get_picker()
	picker.set_edit_alpha(false)
	picker.set_presets_visible(false)
	
	# Hide color bar
	#picker.get_child(1).get_child(0).set_visible(false)
	
	# Hide RGB sliders
	picker.get_child(4).get_child(0).set_visible(false)
	picker.get_child(4).get_child(1).set_visible(false)
	picker.get_child(4).get_child(2).set_visible(false)
	
	# Hide HSV/Raw switches
	picker.get_child(4).get_child(4).get_child(0).set_visible(false)
	picker.get_child(4).get_child(4).get_child(1).set_visible(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
