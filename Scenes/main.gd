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
	
	get_node("Switch/Cloud Switch").connect("item_clicked", self, "show_halloween")
	get_node("Switch/Halloween Switch").connect("item_clicked", self, "show_clouds")
	
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
	character_stage.set_scale(Vector2(.42, .42))
	character_stage.set_position(Vector2(105, 80))
	for child in get_node("ID Customization/ID Badge/Character Stage").get_children():
		child.queue_free()
	get_node("ID Customization/ID Badge/Character Stage").add_child(character_stage)
	
func show_ID_confirm_complete(path):
	get_node("ID Complete Confirmation").show()
	
func hide_ID_confirm_complete(path):
	get_node("ID Complete Confirmation").hide()
	
func show_final_page(path):
	var ID = get_node("ID Customization/ID Badge").duplicate()
	for child in get_node("Final Page/Viewport").get_children():
		child.queue_free()
	get_node("Final Page/Viewport").add_child(ID.duplicate())
	ID.set_scale(Vector2(1.5, 1.5))
	ID.set_position(Vector2(325, 40))
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
		
func show_halloween(path):
	get_node("Clouds").hide()
	get_node("Halloween").show()
	get_node("Switch/Cloud Switch").hide()
	get_node("Switch/Halloween Switch").show()
	var color = Color(0.54902, 0.819608, 1)
	get_node("Background").set_frame_color(Color(0.393378, 0.077972, 0.570313))
	
func show_clouds(path):
	get_node("Clouds").show()
	get_node("Halloween").hide()
	get_node("Switch/Cloud Switch").show()
	get_node("Switch/Halloween Switch").hide()
	get_node("Background").set_frame_color(Color(0.54902, 0.819608, 1))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
