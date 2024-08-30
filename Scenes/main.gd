extends Node2D


# Declare member variables here. Examples:
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Title Page/Continue Button").connect(
		"item_clicked", self, "show_character_customization"
	)
	get_node("Character Customization/Continue Button").connect(
		"item_clicked", self, "show_confirm_complete"
	)
	get_node("Character Complete Confirmation/Nah Button").connect(
		"item_clicked", self, "hide_confirm_complete"
	)
	get_node("Character Complete Confirmation/Yep Button").connect(
		"item_clicked", self, "show_id_customization"
	)
	get_node("ID Customization/Donezo Button").connect(
		"item_clicked", self, "show_ID_confirm_complete"
	)
	get_node("ID Complete Confirmation/Hmm Button").connect(
		"item_clicked", self, "hide_ID_confirm_complete"
	)
	get_node("ID Complete Confirmation/Yeah Button").connect(
		"item_clicked", self, "show_final_page"
	)
	
func show_character_customization(path):
	get_node("Title Page").hide()
	get_node("Character Customization").show()
	
func show_confirm_complete(path):
	get_node("Character Complete Confirmation").show()
	
func hide_confirm_complete(path):
	get_node("Character Complete Confirmation").hide()
	
func show_id_customization(path):
	var new_texture = get_node("Character Customization/Viewport").get_texture()
	get_node("Character Complete Confirmation").hide()
	get_node("Character Customization").hide()
	get_node("ID Customization").show()
	get_node("ID Customization/ID Badge/Photo").set_texture(new_texture)
	
func show_ID_confirm_complete(path):
	get_node("ID Complete Confirmation").show()
	
func hide_ID_confirm_complete(path):
	get_node("ID Complete Confirmation").hide()
	
func show_final_page(path):
	get_node("ID Customization").hide()
	get_node("ID Complete Confirmation").hide()
	get_node("Final Page").show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
