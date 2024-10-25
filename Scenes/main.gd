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
		"item_clicked", self, "show_fill_out_info"
	)
	get_node("Fill Out Info/Continue Button").connect(
		"item_clicked", self, "show_id_customization"
	)
	get_node("Fill Out Info/Back Button").connect(
		"item_clicked", self, "show_character_customization"
	)
	get_node("ID Customization/Donezo Button").connect(
		"item_clicked", self, "show_ID_confirm_complete"
	)
	get_node("ID Customization/Back Button").connect(
		"item_clicked", self, "show_fill_out_info"
	)
	get_node("ID Complete Confirmation/Hmm Button").connect(
		"item_clicked", self, "hide_ID_confirm_complete"
	)
	get_node("ID Complete Confirmation/Yeah Button").connect(
		"item_clicked", self, "show_final_page"
	)
	get_node("Final Page/Download Button").connect(
		"item_clicked", self, "export_ID"
	)
	get_node("Final Page/Back Button").connect(
		"item_clicked", self, "show_id_customization"
	)
	
func show_character_customization(path):
	get_node("Title Page").hide()
	get_node("Fill Out Info").hide()
	get_node("Character Customization").show()
	
	get_node("Character Customization/Character Stage/Background").show()
	
func show_confirm_complete(path):
	get_node("Character Complete Confirmation").show()
	
func hide_confirm_complete(path):
	get_node("Character Complete Confirmation").hide()

func show_fill_out_info(path):
	get_node("Character Complete Confirmation").hide()
	get_node("Character Customization").hide()
	get_node("ID Customization").hide()
	get_node("Fill Out Info").show()
	
func show_id_customization(path):
	var new_texture = get_node("Character Customization/Viewport").get_texture()
	get_node("Fill Out Info").hide()
	get_node("Final Page").hide()
	get_node("ID Customization").show()
	get_node("ID Customization/ID Badge/Photo").set_texture(new_texture)
	
	var pronouns = get_node("Fill Out Info/Pronouns").get_text()
	get_node("ID Customization/ID Badge/Pronouns").set_text(pronouns)
	var name = get_node("Fill Out Info/Name").get_text()
	get_node("ID Customization/ID Badge/Name").set_text(name)
	get_node("Character Customization/Character Stage/Background").hide()
	var character_stage = get_node("Character Customization/Character Stage").duplicate()
	character_stage.set_scale(Vector2(.56, .56))
	character_stage.set_position(Vector2(99.2, 79.2))
	get_node("ID Customization/ID Badge").add_child(character_stage)
	
func show_ID_confirm_complete(path):
	get_node("ID Complete Confirmation").show()
	
func hide_ID_confirm_complete(path):
	get_node("ID Complete Confirmation").hide()
	
func show_final_page(path):
	var ID = get_node("ID Customization/ID Badge").duplicate()
	get_node("Final Page/Viewport").add_child(ID.duplicate())
	ID.set_scale(Vector2(1.25, 1.25))
	ID.set_position(Vector2(200, -10))
	get_node("Final Page").add_child(ID)
	get_node("ID Customization").hide()
	get_node("ID Complete Confirmation").hide()
	get_node("Final Page").show()
	
func export_ID(path):
	print("exporting image")
	#get_node("Final Page/Viewport/ID Badge/Character Stage/Background").hide()
	var image = get_node("Final Page/Viewport").get_texture().get_data()
	image = image.get_rect(image.get_used_rect())
	
	image.save_png("res://screenshot.png")
	print("done exporting")
	var buf = image.save_png_to_buffer()
	if OS.has_feature('JavaScript'):
		JavaScript.download_buffer(buf,"screenshot"+".png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
